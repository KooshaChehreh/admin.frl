from django.urls import path, include
from . import views

app_name = 'home'

urlpatterns = [
    path('', views.ProfileView.as_view(), name='profile'),
    path('report/', views.ReportView.as_view(), name='report'),

]
