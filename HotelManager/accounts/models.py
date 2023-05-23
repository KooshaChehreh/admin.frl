from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from .managers import UserManager
from core.models import BaseModel

# TODO:MODELS
"""
admin_role
admins
booking
country_list
home_slider
members_details
migrations
package_photos
packages
pages
password_resets
payment
registration_request
roles
users
"""


class User(AbstractBaseUser, PermissionsMixin):
    name = models.CharField(max_length=50, verbose_name='Name')
    email = models.EmailField(max_length=255, unique=True, verbose_name='Email')
    status = models.BooleanField(verbose_name='Status', null=True, blank=True)
    email_verified_at = models.DateTimeField(verbose_name='Email Verified At', null=True, blank=True)
    remember_token = models.CharField(max_length=100, verbose_name='Remember Token')
    is_active = models.BooleanField(default=True, verbose_name='Activation Status')
    is_admin = models.BooleanField(default=False, verbose_name='Admin Status')
    is_superuser = models.BooleanField(default=False, verbose_name='Superuser Status')

    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name', 'password']

    def __str__(self):
        return self.email

    @property
    def is_staff(self):
        return self.is_admin

    def role(self):
        return "Super User" if self.is_superuser else self.groups.get()

    role.short_description = 'Role'
