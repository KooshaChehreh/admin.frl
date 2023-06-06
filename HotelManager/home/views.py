from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, redirect
from django.views import View
from django.contrib.auth.decorators import user_passes_test
from home.forms import TimeFilterForm, UpdateProfileForm2
from home.models import Booking, MemberDetail, Package
from utils import this_month_start_end
from django.contrib import messages


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


class PaymentView(View):

    def post(self, request):
        package_id = request.POST.get('package_id')
        package = Package.objects.get(package_id=package_id)
        return render(request, 'payment.html', {"package": package})