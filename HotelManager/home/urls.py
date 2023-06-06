from django.urls import path, include
from . import views

app_name = 'home'

urlpatterns = [
    path('', views.LandingView.as_view(), name='landing'),
    path('profile/', views.ProfileView.as_view(), name='profile'),
    path('report/', views.ReportView.as_view(), name='report'),
    path('packages/', views.PackagesView.as_view(), name='packages'),
    path('package/<int:id>/', views.ProductDetailView.as_view(), name='product_detail'),
    # path('<payment>', views.PaymentView.as_view(), name='payment'),
]
