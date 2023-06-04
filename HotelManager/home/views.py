from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from django.views import View
from django.contrib.auth.decorators import user_passes_test
from home.forms import TimeFilterForm, UpdateProfileForm
from home.models import Booking, MemberDetail
from utils import this_month_start_end


class ProfileView(View):
    form = UpdateProfileForm()

    def get(self, request):
        user = request.user
        bookings = Booking.objects.filter(user=user)
        member_detail = MemberDetail.objects.filter(user=user)
        print(user)
        print(member_detail[0].address)
        print(bookings)
        return render(request, 'home/profile.html',
                      {'form': self.form, 'bookings': bookings, 'member_detail': member_detail[0]})

    # def post(self, request, *args, **kwargs):
    # form = self.form(request.POST, instance=)
    # if form.is_valid():
    # new_post = form.save(commit=False)
    # new_post.save()
    # messages.success(request, 'You update', 'success')
    # return redirect('home:detail', post.id, post.slug)


class ReportView(LoginRequiredMixin, View):
    class_form = TimeFilterForm
    template_name = 'home/report.html'

    def get(self, request):
        form = self.class_form(request.GET)
        if form.is_valid() and any(form.cleaned_data.values()):
            cd = form.cleaned_data
            for key, value in cd.items():
                pass
                if value:
                    if key == 'start':
                        bookings = Booking.objects.filter(date__gte=value)
                    elif key == 'end':
                        bookings = Booking.objects.filter(date__lte=value)

        else:
            start, end = this_month_start_end()
            bookings = Booking.objects.filter(date__gte=start, date__lte=end)
            # bookings = Booking.objects.all()

        total_income = 0
        for booking in bookings:
            total_income += booking.total

        return render(request, self.template_name,
                      {
                          "form": self.class_form,
                          "bookings": bookings,
                          "total_income": total_income,
                      })
