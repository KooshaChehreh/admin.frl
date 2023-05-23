from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .forms import UserCreationForm, UserChangeForm
from .models import User


class UserAdmin(BaseUserAdmin):
    form = UserChangeForm
    add_form = UserCreationForm
    readonly_fields = ('last_login',)
    list_display = ('email', 'is_admin', 'is_superuser', 'role')
    list_filter = ('is_admin',)

    fieldsets = (
        ('Main', {'fields': ('email', 'name', 'password', 'last_login')}),
        ('Permissions',
         {'classes': ('collapse',),
          'fields': (('is_active', 'is_admin', 'is_superuser'), 'groups', 'user_permissions')}),
    )

    add_fieldsets = (
        (None, {'fields': ('email', 'name', 'password1', 'password2')}),
    )

    search_fields = ('email', 'name')
    ordering = ('name',)
    filter_horizontal = ('groups', 'user_permissions')
    list_per_page = 10

    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        if not request.user.is_superuser:
            form.base_fields['is_superuser'].disabled = True
        return form


admin.site.register(User, UserAdmin)
