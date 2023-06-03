from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from django.views import View

from home.forms import TimeFilterForm
from home.models import Booking
from utils import this_month_start_end


# Create your views here.
class ProfileView(View):
    def get(self, request, category_slug: str = None):
        return render(request, 'home/profile.html')


class ReportView(LoginRequiredMixin, View):
    class_form = TimeFilterForm
    template_name = 'home/report.html'

    def get(self, request, category_slug: str = None):
        lists = {12: '12', 13: '13', 14: '14', 15: '15', 16: '16', 17: '17', 18: '18'}
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
