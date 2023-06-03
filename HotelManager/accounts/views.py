from django.shortcuts import render, redirect
from django.views import View
from .forms import UserRegisterationForm, UserLoginForm
from .models import User
from django.contrib import messages
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.mixins import LoginRequiredMixin


class UserRegisterView(View):
    from_class = UserRegisterationForm
    template_name = 'accounts/register.html'

    def get(self, request):
        form = self.from_class
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = self.from_class(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            User.objects.create_user(email=cd['email'],
                                     name=cd['name'], password=cd['password'])

            messages.success(request, 'Registered', 'success')
            return redirect('accounts:user_login')
        return render(request, self.template_name, {'form': form})





class UserLogoutView(LoginRequiredMixin, View):
    def get(self, request):
        logout(request)
        messages.success(request, 'خروج از حساب کاربری با موفقیت انجام شد', 'success')
        return redirect('home:home')


class UserLoginView(View):
    form_class = UserLoginForm
    template_name = 'accounts/login.html'

    def get(self, request):
        form = self.form_class
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = self.form_class(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            user = authenticate(request, email=cd['email'], password=cd['password'])
            if user is not None:
                login(request, user)
                messages.success(request, 'ورود به حساب کاربری با موفقیت انجام شد', 'success')
                return redirect('home:profile')
            messages.error(request, 'نام کاربری یا رمز عبور اشتباه است', 'danger')
        return render(request, self.template_name, {'form': form})
