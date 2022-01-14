# Generated by Django 3.2.6 on 2021-12-28 01:35

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import phonenumber_field.modelfields


class Migration(migrations.Migration):

    dependencies = [
        ('jobReferralApp', '0014_auto_20211222_1105'),
    ]

    operations = [
        migrations.AlterField(
            model_name='apply',
            name='post',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='applies', to='jobReferralApp.post'),
        ),
        migrations.AlterField(
            model_name='jobapplicant',
            name='address',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='jobapplicant',
            name='phone',
            field=phonenumber_field.modelfields.PhoneNumberField(blank=True, max_length=128, null=True, region=None, unique=True),
        ),
        migrations.AlterField(
            model_name='jobapplicant',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, related_name='jobApplicant', related_query_name='jobApplicant', serialize=False, to=settings.AUTH_USER_MODEL),
        ),
    ]