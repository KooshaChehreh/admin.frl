import calendar
from datetime import datetime

from django.contrib.auth.mixins import UserPassesTestMixin


class IsAdminUserMixin(UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_authenticated and self.request.user.is_admin


def this_month_start_end():
    now = datetime.now()
    last_day = calendar.monthrange(now.year, now.month)[1]
    start = datetime(now.year, now.month, 1)
    end = datetime(now.year, now.month, last_day)
    return start, end
