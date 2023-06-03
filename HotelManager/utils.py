import calendar
from datetime import datetime

from django.contrib.auth.mixins import UserPassesTestMixin
from kavenegar import *


def send_otp_code(phone_number, code):
    try:
        api = KavenegarAPI('API_KEY')
        params = {
            'sender': '',
            'receptor': phone_number,
            'message': f'{code} کد تایید شما '
        }
        response = api.sms_send(params)
        print(response)
    except APIException as e:
        print(e)
    except HTTPException as e:
        print(e)


class IsAdminUserMixin(UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_authenticated and self.request.user.is_admin


def this_month_start_end():
    now = datetime.now()
    last_day = calendar.monthrange(now.year, now.month)[1]
    start = datetime(now.year, now.month, 1)
    end = datetime(now.year, now.month, last_day)
    return start, end
