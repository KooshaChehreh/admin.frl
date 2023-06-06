from django import forms
from accounts.models import User
from django.core.exceptions import ValidationError
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from .models import MemberDetail


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


class UpdateProfileForm2(forms.ModelForm):
    class Meta:
        model = MemberDetail
        fields = ('email', 'first_name', 'middle_name', 'last_name', 'address', 'city', 'post_code',
                  'state', 'country', 'country_code', 'phone_number', 'whatsapp_number', 'dob',
                  'nic', 'profession', 'organization')
        widgets = {
            'email': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'first_name': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'middle_name': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'last_name': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'address': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'city': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'post_code': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'state': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'country': forms.Select(attrs={'class': 'w-50 form-control'}),
            'country_code': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'phone_number': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'whatsapp_number': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'dob': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'nic': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'profession': forms.TextInput(attrs={'class': 'w-50 form-control'}),
            'organization': forms.TextInput(attrs={'class': 'w-50 form-control'}),
        }

        labels = {
            'email': 'Email',
            'first_name': 'First Name',
            'middle_name': 'Middle Name',
            'last_name': 'Last Name',
            'address': 'Address',
            'city': 'City',
            'post_code': 'Post Code',
            'state': 'State',
            'country': 'Country',
            'country_code': 'Country Code',
            'phone_number': 'Phone No',
            'whatsapp_number': 'Whatsapp No',
            'dob': 'DOB',
            'nic': 'NIC',
            'profession': 'Profession',
            'organization': 'Organization'
        }



class PaymentForm(forms.Form):
    pass

class CartAddProductForm(forms.Form):
    quantity = forms.IntegerField(min_value=1, max_value=100, initial=1)

