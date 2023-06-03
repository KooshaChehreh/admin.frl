from django import forms
from accounts.models import User
from django.core.exceptions import ValidationError
from django.contrib.auth.forms import ReadOnlyPasswordHashField


class TimeFilterForm(forms.Form):
    start = forms.DateTimeField(required=False, label='Start',
                                widget=forms.DateTimeInput(attrs={'class': 'form-control', 'type': 'date'}))
    end = forms.DateTimeField(required=False, label='End',
                              widget=forms.DateTimeInput(attrs={'class': 'form-control', 'type': 'date'}))
