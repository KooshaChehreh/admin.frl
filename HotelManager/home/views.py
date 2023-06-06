from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, redirect, get_object_or_404
from django.views import View
from django.contrib.auth.decorators import user_passes_test
from home.forms import TimeFilterForm, UpdateProfileForm2
from home.forms import TimeFilterForm, UpdateProfileForm2, CartAddProductForm
from home.models import Booking, MemberDetail, Package
from utils import this_month_start_end
from django.contrib import messages


class LandingView(View):
    def get(self, request):
        return render(request, 'home/landing.html')


class ProfileView(LoginRequiredMixin, View):
    form = UpdateProfileForm2
    template_name = 'home/profile.html'

    def setup(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            self.user = request.user
            self.bookings = Booking.objects.filter(user=self.user)
            member_detail = MemberDetail.objects.filter(user=self.user)
            self.member_detail = member_detail.get() if member_detail.exists() else None
        return super().setup(request, *args, **kwargs)

    def get(self, request):
        form = self.form(instance=self.member_detail) if self.member_detail else self.form
        bookings = self.bookings
        member_detail = self.member_detail
        return render(request, self.template_name,
                      {'form': form, 'bookings': bookings, 'member_detail': member_detail})

    def post(self, request, *args, **kwargs):
        form = self.form(request.POST)
        if self.member_detail:
            form.instance = self.member_detail
        if form.is_valid():
            member_detail = form.save(commit=False)
            member_detail.user = request.user
            member_detail.save()
            messages.success(request, 'Your information updated successfully', 'success')
        return redirect('home:profile')


class ReportView(LoginRequiredMixin, View):
    class_form = TimeFilterForm
    template_name = 'home/report.html'

    def get(self, request):
        form = self.class_form(request.GET)
        bookings = Booking.objects.all()
        if not request.user.is_admin:
            bookings = bookings.filter(user=request.user)
        if form.is_valid() and any(form.cleaned_data.values()):
            cd = form.cleaned_data
            for key, value in cd.items():
                if value:
                    if key == 'start':
                        bookings = bookings.filter(date__gte=value)
                    elif key == 'end':
                        bookings = bookings.filter(date__lte=value)

        else:
            start, end = this_month_start_end()
            bookings = bookings.filter(date__gte=start, date__lte=end)

        total_income = 0
        for booking in bookings:
            total_income += booking.total

        return render(request, self.template_name,
                      {
                          "form": self.class_form,
                          "bookings": bookings,
                          "total_income": total_income,
                      })


# class PaymentView(View):
#
#     def post(self, request):
#         form = CartAddProductForm(request.POST)
#         if form.is_valid():
#             cd = form.cleaned_data
#             quantity = cd['quantity']
#         package_id = request.POST.get('package_id')
#         package = Package.objects.get(package_id=package_id)
#         return render(request, 'payment.html', {"package": package})


class PackagesView(View):
    def get(self, request):
        packages = Package.objects.all()
        return render(request, 'home/packages.html', {"packages": packages})


class ProductDetailView(View):
    form_class = CartAddProductForm

    def setup(self, request, *args, **kwargs):
        self.product = get_object_or_404(Package, id=kwargs['id'])
        return super().setup(request, *args, *kwargs)

    def get(self, request, id):
        form = self.form_class
        return render(request, 'home/detail.html', {'product': self.product, 'form': form})

    def post(self, request, id):
        form = CartAddProductForm(request.POST)
        package = {}
        if form.is_valid():
            cd = form.cleaned_data
            quantity = cd['quantity']
            amount = self.product.per_amount * quantity
            package = {
                "product": self.product,
                "quantity": quantity,
                "amount": amount
            }
        return render(request, 'home/payment.html', package)
