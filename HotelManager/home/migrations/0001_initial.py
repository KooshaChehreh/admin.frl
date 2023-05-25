# Generated by Django 4.2.1 on 2023-05-25 11:44

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Booking',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, help_text='This is deleted datetime', null=True, verbose_name='Deleted datetime')),
                ('restored_at', models.DateTimeField(blank=True, editable=False, help_text='This is Restored Datetime', null=True, verbose_name='Restored Datetime')),
                ('is_deleted', models.BooleanField(db_index=True, default=False, editable=False, help_text='This is deleted status', verbose_name='Deleted status')),
                ('is_active', models.BooleanField(default=True, editable=False, help_text='This is active status', verbose_name='Active status')),
                ('date', models.CharField(blank=True, max_length=20, null=True, verbose_name='Date')),
                ('number_of_people', models.PositiveIntegerField(blank=True, null=True, verbose_name='Number Of People')),
                ('total', models.PositiveIntegerField(blank=True, null=True, verbose_name='Total')),
                ('booking_status', models.CharField(blank=True, max_length=100, null=True, verbose_name='Booking Status')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, help_text='This is deleted datetime', null=True, verbose_name='Deleted datetime')),
                ('restored_at', models.DateTimeField(blank=True, editable=False, help_text='This is Restored Datetime', null=True, verbose_name='Restored Datetime')),
                ('is_deleted', models.BooleanField(db_index=True, default=False, editable=False, help_text='This is deleted status', verbose_name='Deleted status')),
                ('is_active', models.BooleanField(default=True, editable=False, help_text='This is active status', verbose_name='Active status')),
                ('country', models.CharField(blank=True, max_length=120, null=True, verbose_name='Country')),
                ('code', models.CharField(blank=True, max_length=4, null=True, verbose_name='Code')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='HomeSlider',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, help_text='This is deleted datetime', null=True, verbose_name='Deleted datetime')),
                ('restored_at', models.DateTimeField(blank=True, editable=False, help_text='This is Restored Datetime', null=True, verbose_name='Restored Datetime')),
                ('is_deleted', models.BooleanField(db_index=True, default=False, editable=False, help_text='This is deleted status', verbose_name='Deleted status')),
                ('is_active', models.BooleanField(default=True, editable=False, help_text='This is active status', verbose_name='Active status')),
                ('image', models.ImageField(blank=True, null=True, upload_to='', verbose_name='Image')),
                ('sort', models.IntegerField(blank=True, null=True, verbose_name='Sort')),
                ('caption', models.CharField(blank=True, max_length=100, null=True, verbose_name='Caption')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='MemberDetail',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, help_text='This is deleted datetime', null=True, verbose_name='Deleted datetime')),
                ('restored_at', models.DateTimeField(blank=True, editable=False, help_text='This is Restored Datetime', null=True, verbose_name='Restored Datetime')),
                ('is_deleted', models.BooleanField(db_index=True, default=False, editable=False, help_text='This is deleted status', verbose_name='Deleted status')),
                ('is_active', models.BooleanField(default=True, editable=False, help_text='This is active status', verbose_name='Active status')),
                ('email', models.EmailField(max_length=191, unique=True, verbose_name='Email')),
                ('first_name', models.CharField(blank=True, max_length=50, null=True, verbose_name='First Name')),
                ('middle_name', models.CharField(blank=True, max_length=50, null=True, verbose_name='Middle Name')),
                ('last_name', models.CharField(blank=True, max_length=50, null=True, verbose_name='Last Name')),
                ('address', models.TextField(verbose_name='Address')),
                ('city', models.CharField(blank=True, max_length=20, null=True, verbose_name='City')),
                ('post_code', models.CharField(blank=True, max_length=20, null=True, verbose_name='Post Code')),
                ('state', models.CharField(blank=True, max_length=20, null=True, verbose_name='State')),
                ('country_code', models.CharField(blank=True, max_length=20, null=True, verbose_name='Country Code')),
                ('phone_number', models.CharField(blank=True, max_length=20, null=True, verbose_name='Phone Number')),
                ('whatsapp_number', models.CharField(blank=True, max_length=20, null=True, verbose_name='Whatsapp Number')),
                ('dob', models.CharField(blank=True, max_length=15, null=True, verbose_name='Dob')),
                ('nic', models.CharField(blank=True, max_length=100, null=True, verbose_name='Nic')),
                ('profession', models.CharField(blank=True, max_length=100, null=True, verbose_name='Profession')),
                ('organization', models.CharField(blank=True, max_length=191, null=True, verbose_name='Organization')),
                ('country', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='member_details', to='home.country')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='mem_details', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Package',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, help_text='This is deleted datetime', null=True, verbose_name='Deleted datetime')),
                ('restored_at', models.DateTimeField(blank=True, editable=False, help_text='This is Restored Datetime', null=True, verbose_name='Restored Datetime')),
                ('is_deleted', models.BooleanField(db_index=True, default=False, editable=False, help_text='This is deleted status', verbose_name='Deleted status')),
                ('is_active', models.BooleanField(default=True, editable=False, help_text='This is active status', verbose_name='Active status')),
                ('title', models.CharField(blank=True, max_length=200, null=True, verbose_name='Title')),
                ('sub_title', models.CharField(blank=True, max_length=200, null=True, verbose_name='Sub Title')),
                ('homepage_description', models.CharField(blank=True, max_length=200, null=True, verbose_name='Home Page Description')),
                ('show_in_home', models.BooleanField(blank=True, null=True, verbose_name='Show in home')),
                ('description', models.TextField(verbose_name='Description')),
                ('image', models.ImageField(blank=True, null=True, upload_to='', verbose_name='Image')),
                ('days', models.CharField(blank=True, max_length=200, null=True, verbose_name='Days')),
                ('per_amount', models.PositiveIntegerField(blank=True, null=True, verbose_name='Per Amount')),
                ('sort', models.IntegerField(blank=True, null=True, verbose_name='Sort')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Page',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, help_text='This is deleted datetime', null=True, verbose_name='Deleted datetime')),
                ('restored_at', models.DateTimeField(blank=True, editable=False, help_text='This is Restored Datetime', null=True, verbose_name='Restored Datetime')),
                ('is_deleted', models.BooleanField(db_index=True, default=False, editable=False, help_text='This is deleted status', verbose_name='Deleted status')),
                ('is_active', models.BooleanField(default=True, editable=False, help_text='This is active status', verbose_name='Active status')),
                ('page_name', models.CharField(blank=True, max_length=100, null=True, verbose_name='Page Name')),
                ('pdf_file', models.CharField(blank=True, max_length=200, null=True, verbose_name='PDF File')),
                ('description', models.TextField(verbose_name='Description')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='RegisterRequest',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, help_text='This is deleted datetime', null=True, verbose_name='Deleted datetime')),
                ('restored_at', models.DateTimeField(blank=True, editable=False, help_text='This is Restored Datetime', null=True, verbose_name='Restored Datetime')),
                ('is_deleted', models.BooleanField(db_index=True, default=False, editable=False, help_text='This is deleted status', verbose_name='Deleted status')),
                ('is_active', models.BooleanField(default=True, editable=False, help_text='This is active status', verbose_name='Active status')),
                ('first_name', models.CharField(blank=True, max_length=50, null=True, verbose_name='First Name')),
                ('address', models.TextField(verbose_name='Address')),
                ('city', models.CharField(blank=True, max_length=20, null=True, verbose_name='City')),
                ('post_code', models.CharField(blank=True, max_length=20, null=True, verbose_name='Post Code')),
                ('state', models.CharField(blank=True, max_length=20, null=True, verbose_name='State')),
                ('country', models.CharField(blank=True, max_length=20, null=True, verbose_name='Country')),
                ('country_code', models.CharField(blank=True, max_length=20, null=True, verbose_name='Country Code')),
                ('phone_number', models.CharField(blank=True, max_length=20, null=True, verbose_name='Phone Number')),
                ('whatsapp_number', models.CharField(blank=True, max_length=20, null=True, verbose_name='Whatsapp Number')),
                ('dob', models.CharField(blank=True, max_length=15, null=True, verbose_name='Dob')),
                ('nic', models.CharField(blank=True, max_length=100, null=True, verbose_name='Nic')),
                ('profession', models.CharField(blank=True, max_length=100, null=True, verbose_name='Profession')),
                ('organization', models.CharField(blank=True, max_length=191, null=True, verbose_name='Organization')),
                ('admission_year', models.PositiveIntegerField(blank=True, null=True, verbose_name='Admission Year')),
                ('admission_grade', models.CharField(blank=True, max_length=10, null=True, verbose_name='Admission Grade')),
                ('leaving_year', models.PositiveIntegerField(blank=True, null=True, verbose_name='Leaving Year')),
                ('last_grade_study', models.CharField(blank=True, max_length=10, null=True, verbose_name='Last Grade Study')),
                ('student_admission_number', models.CharField(blank=True, max_length=10, null=True, verbose_name='Student Admission Number')),
                ('extra_activity', models.TextField(verbose_name='Extra Activity')),
                ('profile_photo', models.ImageField(blank=True, null=True, upload_to='', verbose_name='Profile Photo')),
                ('payment_photo', models.ImageField(blank=True, null=True, upload_to='', verbose_name='Payment Photo')),
                ('leaving_cert_photo', models.ImageField(blank=True, null=True, upload_to='', verbose_name='Leaving Certification Photo')),
                ('approved', models.BooleanField(blank=True, null=True, verbose_name='Approved')),
                ('login_method', models.CharField(blank=True, max_length=30, null=True, verbose_name='Login Method')),
                ('login_id', models.CharField(blank=True, max_length=30, null=True, verbose_name='Login ID')),
                ('login_token', models.CharField(blank=True, max_length=30, null=True, verbose_name='Login Token')),
                ('member_detail', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='register_requests', to='home.memberdetail')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, help_text='This is deleted datetime', null=True, verbose_name='Deleted datetime')),
                ('restored_at', models.DateTimeField(blank=True, editable=False, help_text='This is Restored Datetime', null=True, verbose_name='Restored Datetime')),
                ('is_deleted', models.BooleanField(db_index=True, default=False, editable=False, help_text='This is deleted status', verbose_name='Deleted status')),
                ('is_active', models.BooleanField(default=True, editable=False, help_text='This is active status', verbose_name='Active status')),
                ('date', models.DateField(blank=True, null=True, verbose_name='Date')),
                ('amount', models.CharField(blank=True, max_length=255, null=True, verbose_name='Amount')),
                ('booking', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='payment', to='home.booking')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='PackagePhoto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created at')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Updated at')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, help_text='This is deleted datetime', null=True, verbose_name='Deleted datetime')),
                ('restored_at', models.DateTimeField(blank=True, editable=False, help_text='This is Restored Datetime', null=True, verbose_name='Restored Datetime')),
                ('is_deleted', models.BooleanField(db_index=True, default=False, editable=False, help_text='This is deleted status', verbose_name='Deleted status')),
                ('is_active', models.BooleanField(default=True, editable=False, help_text='This is active status', verbose_name='Active status')),
                ('image', models.ImageField(blank=True, null=True, upload_to='', verbose_name='Image')),
                ('size', models.CharField(blank=True, max_length=10, null=True, verbose_name='Size')),
                ('sort', models.IntegerField(blank=True, null=True, verbose_name='Sort')),
                ('package', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='package_photos', to='home.package')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='booking',
            name='package',
            field=models.ManyToManyField(related_name='package_bookings', to='home.package'),
        ),
        migrations.AddField(
            model_name='booking',
            name='register_request',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='re_bookings', to='home.registerrequest'),
        ),
        migrations.AddField(
            model_name='booking',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_bookings', to=settings.AUTH_USER_MODEL),
        ),
    ]
