# Generated by Django 4.2.1 on 2023-06-03 10:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='OtpCode',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('phone_number', models.CharField(max_length=11, unique=True)),
                ('code', models.PositiveIntegerField()),
                ('created', models.DateTimeField(auto_now=True)),
            ],
        ),
    ]
