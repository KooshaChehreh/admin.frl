from django import forms
from accounts.models import User
from django.core.exceptions import ValidationError
from django.contrib.auth.forms import ReadOnlyPasswordHashField


class TimeFilterForm(forms.Form):
    start = forms.DateTimeField(required=False, label='Start',
                                widget=forms.DateTimeInput(attrs={'class': 'form-control', 'type': 'date'}))
    end = forms.DateTimeField(required=False, label='End',
                              widget=forms.DateTimeInput(attrs={'class': 'form-control', 'type': 'date'}))


class UpdateProfileForm(forms.Form):
    email = forms.CharField(label='Email', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    first_name = forms.CharField(label='First Name', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    middle_name = forms.CharField(label='Middle Name', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    last_name = forms.CharField(label='Last Name', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    address = forms.CharField(label='Address', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    address2 = forms.CharField(label='Address2', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    city = forms.CharField(label='City', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    state = forms.CharField(label='State', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    postcode = forms.CharField(label='Postcode', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    country = forms.CharField(label='Country', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    country_code = forms.CharField(label='Country Code', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    phone_no = forms.CharField(label='Phone No', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    whatsapp_no = forms.CharField(label='Whatsapp No', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    dob = forms.CharField(label='DOB', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    nic = forms.CharField(label='NIC', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    profession = forms.CharField(label='Profession', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
    organization = forms.CharField(label='Organization', widget=forms.TextInput(attrs={'class': 'w-50 form-control'}))
