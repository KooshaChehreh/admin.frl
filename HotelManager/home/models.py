from django.db import models
from core.models import BaseModel
from accounts.models import User


# Create your models here.


class RegisterRequest(BaseModel):
    first_name = models.CharField(max_length=50, verbose_name='First Name', null=True, blank=True)
    address = models.TextField(verbose_name='Address')
    city = models.CharField(max_length=20, verbose_name='City', null=True, blank=True)
    post_code = models.CharField(max_length=20, verbose_name='Post Code', null=True, blank=True)
    state = models.CharField(max_length=20, verbose_name='State', null=True, blank=True)
    country = models.CharField(max_length=20, verbose_name='Country', null=True, blank=True)
    country_code = models.CharField(max_length=20, verbose_name='Country Code', null=True, blank=True)
    phone_number = models.CharField(max_length=20, verbose_name='Phone Number', null=True, blank=True)
    whatsapp_number = models.CharField(max_length=20, verbose_name='Whatsapp Number', null=True, blank=True)
    dob = models.CharField(max_length=15, verbose_name='Dob', null=True, blank=True)
    nic = models.CharField(max_length=100, verbose_name='Nic', null=True, blank=True)
    profession = models.CharField(max_length=100, verbose_name='Profession', null=True, blank=True)
    organization = models.CharField(max_length=191, verbose_name='Organization', null=True, blank=True)
    admission_year = models.PositiveIntegerField(verbose_name='Admission Year', null=True, blank=True)
    admission_grade = models.CharField(max_length=10, verbose_name='Admission Grade', null=True, blank=True)
    leaving_year = models.PositiveIntegerField(verbose_name='Leaving Year', null=True, blank=True)
    last_grade_study = models.CharField(max_length=10, verbose_name='Last Grade Study', null=True, blank=True)
    student_admission_number = models.CharField(max_length=10, verbose_name='Student Admission Number', null=True,
                                                blank=True)

    extra_activity = models.TextField(verbose_name='Extra Activity')
    profile_photo = models.ImageField(null=True, blank=True, verbose_name='Profile Photo')
    payment_photo = models.ImageField(null=True, blank=True, verbose_name='Payment Photo')
    leaving_cert_photo = models.ImageField(null=True, blank=True, verbose_name='Leaving Certification Photo')
    approved = models.BooleanField(null=True, blank=True, verbose_name='Approved')
    login_method = models.CharField(max_length=30, verbose_name='Login Method', null=True, blank=True)
    login_id = models.CharField(max_length=30, verbose_name='Login ID', null=True, blank=True)
    login_token = models.CharField(max_length=30, verbose_name='Login Token', null=True, blank=True)
    member_detail = models.ForeignKey('MemberDetail', on_delete=models.CASCADE, related_name='register_requests')


class MemberDetail(BaseModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='mem_details')
    email = models.EmailField(max_length=191, unique=True, verbose_name='Email')
    first_name = models.CharField(max_length=50, verbose_name='First Name', null=True, blank=True)
    middle_name = models.CharField(max_length=50, verbose_name='Middle Name', null=True, blank=True)
    last_name = models.CharField(max_length=50, verbose_name='Last Name', null=True, blank=True)
    address = models.TextField(verbose_name='Address')
    city = models.CharField(max_length=20, verbose_name='City', null=True, blank=True)
    post_code = models.CharField(max_length=20, verbose_name='Post Code', null=True, blank=True)
    state = models.CharField(max_length=20, verbose_name='State', null=True, blank=True)
    country = models.ForeignKey('Country', on_delete=models.CASCADE, related_name='member_details')
    country_code = models.CharField(max_length=20, verbose_name='Country Code', null=True, blank=True)
    phone_number = models.CharField(max_length=20, verbose_name='Phone Number', null=True, blank=True)
    whatsapp_number = models.CharField(max_length=20, verbose_name='Whatsapp Number', null=True, blank=True)
    dob = models.CharField(max_length=15, verbose_name='Dob', null=True, blank=True)
    nic = models.CharField(max_length=100, verbose_name='Nic', null=True, blank=True)
    profession = models.CharField(max_length=100, verbose_name='Profession', null=True, blank=True)
    organization = models.CharField(max_length=191, verbose_name='Organization', null=True, blank=True)


class Country(BaseModel):
    country = models.CharField(max_length=120, verbose_name='Country', null=True, blank=True)
    code = models.CharField(max_length=4, verbose_name='Code', null=True, blank=True)


class Booking(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_bookings')
    package = models.ManyToManyField('Package', related_name='package_bookings')
    # date = models.CharField(max_length=20, verbose_name='Date', null=True, blank=True)
    date = models.DateField(max_length=20, verbose_name='Date', null=True, blank=True)
    number_of_people = models.PositiveIntegerField(verbose_name='Number Of People', null=True, blank=True)
    total = models.PositiveIntegerField(verbose_name='Total', null=True, blank=True)
    booking_status = models.CharField(max_length=100, verbose_name='Booking Status', null=True, blank=True)


class Payment(BaseModel):
    booking = models.OneToOneField(Booking, on_delete=models.CASCADE, related_name='payment')
    date = models.DateField(verbose_name='Date', null=True, blank=True)
    amount = models.CharField(max_length=255, verbose_name='Amount', null=True, blank=True)


class Package(BaseModel):
    title = models.CharField(max_length=200, verbose_name='Title', null=True, blank=True)
    sub_title = models.CharField(max_length=200, verbose_name='Sub Title', null=True, blank=True)
    homepage_description = models.CharField(max_length=200, verbose_name='Home Page Description', null=True, blank=True)
    show_in_home = models.BooleanField(verbose_name='Show in home', null=True, blank=True)
    description = models.TextField(verbose_name='Description')
    image = models.ImageField(verbose_name='Image', null=True, blank=True)
    days = models.CharField(max_length=200, verbose_name='Days', null=True, blank=True)
    per_amount = models.PositiveIntegerField(verbose_name='Per Amount', null=True, blank=True)
    sort = models.IntegerField(verbose_name='Sort', null=True, blank=True)


class PackagePhoto(BaseModel):
    package = models.ForeignKey(Package, on_delete=models.CASCADE, related_name='package_photos')
    image = models.ImageField(verbose_name='Image', null=True, blank=True)
    size = models.CharField(max_length=10, verbose_name='Size', null=True, blank=True)
    sort = models.IntegerField(verbose_name='Sort', null=True, blank=True)


class Page(BaseModel):
    page_name = models.CharField(max_length=100, verbose_name='Page Name', null=True, blank=True)
    pdf_file = models.CharField(max_length=200, verbose_name='PDF File', null=True, blank=True)
    description = models.TextField(verbose_name='Description')


class HomeSlider(BaseModel):
    image = models.ImageField(verbose_name='Image', null=True, blank=True)
    sort = models.IntegerField(verbose_name='Sort', null=True, blank=True)
    caption = models.CharField(max_length=100, verbose_name='Caption', null=True, blank=True)
