from django.contrib.auth.models import AbstractUser
from django.db import models
from ckeditor.fields import RichTextField
from phonenumber_field.modelfields import PhoneNumberField
from django.db.models import Avg

# Create your models here.


class User(AbstractUser):
    avatar = models.ImageField(upload_to='static/uploads/avatar/%Y/%m', null=True)

    def __str__(self):
        return self.username

    class Meta:
        ordering = ['id']

class Category(models.Model):
    name = models.CharField(null=False, unique=True, max_length=255)
    description = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['name']


class Location(models.Model):
    country = models.CharField(null=False, max_length=255)
    city = models.CharField(max_length=255, null=False, blank=True)

    class Meta:
        unique_together = [['country', 'city']]

    def __str__(self):
        return self.city and self.country

    class Meta:
        ordering = ['city']

class Post(models.Model):
    title = models.CharField(null=False, max_length=255)
    description = RichTextField()
    image = models.ImageField(upload_to='static/uploads/images/%Y/%m')
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)
    salary = models.IntegerField(null=True, default=0)
    category = models.ForeignKey(Category, related_name="post", on_delete=models.SET_NULL, null=True)
    location = models.ForeignKey(Location, related_name="post", on_delete=models.CASCADE, null=False)
    address = models.CharField(null=False, max_length=255)
    employer = models.ForeignKey('Employer', related_name="post", on_delete=models.CASCADE)
    tags = models.ManyToManyField('Tag', blank=True)
    jobApplicant = models.ManyToManyField('JobApplicant', related_name='post',through="Apply" )

    def __str__(self):
        return self.title
    
    class Meta:
        ordering = ['-created_date']

    def avg_rating(self):
        point = self.applies.aggregate(Avg('stars'))  # trung bình điểm rating
        return point['stars__avg']


class Employer(models.Model):
    company_name = models.CharField(max_length=255, null= False)
    address = models.CharField(max_length=255, null= False)
    contact_email = models.EmailField(null = False)
    contact_phone = PhoneNumberField(unique = True, null = False, blank = False)
    is_accepted = models.BooleanField(default=False)
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name="employer")
    logo_image = models.ImageField(upload_to='static/uploads/images/%Y/%m')

    def __str__(self):
        return self.company_name

    class Meta:
        ordering = ['is_accepted']

class JobApplicant(models.Model):
    cv = models.FileField(upload_to='static/uploads/cv/%Y/%m', null=True)
    cover_letter = models.FileField(upload_to='static/uploads/coverLetter/%Y/%m', null=True)
    phone = PhoneNumberField(unique = True, null = True, blank = True)
    address = models.CharField(max_length=255, null= True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name="jobApplicant", related_query_name="jobApplicant")


    class Meta:
        ordering = ['user']

class Apply(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name="applies")
    applicant = models.ForeignKey(JobApplicant, related_name="applies", on_delete=models.CASCADE)
    date_apply = models.DateTimeField(auto_now_add=True)
    # status = models.BooleanField(default=False) #is complete
    stars = models.IntegerField(null=True)
    comment = models.TextField(blank=True, null=True)

    class Status(models.TextChoices):
        PENDING = 'P'
        ACCEPT = 'A'
        REFUSE = 'R'
    status = models.CharField(
        max_length=1,
        choices=Status.choices,
        default=Status.PENDING,
    )

    class Meta:
        ordering = ['date_apply']


class Tag(models.Model):
    name = models.CharField(null=False, unique=True, max_length=255)

    def __str__(self):
        return self.name
    class Meta:
        ordering = ['name']
