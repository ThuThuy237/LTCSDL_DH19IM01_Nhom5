from functools import reduce

from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from .models import *
from django.db.models import Avg

class JobApplicationSerializers(ModelSerializer):
    listApply = serializers.SerializerMethodField('list_apply')

    def list_apply(self, applicant):
        request = self.context['request']
        qs = applicant.applies.all()
        serializer = ApplySerializers(qs, many=True, context={"request": request})
        return serializer.data
    class Meta:
        model = JobApplicant
        fields = [ "user", "cv", "cover_letter", "phone", "address", "listApply"]


class UserSerializer(ModelSerializer):
    type = serializers.SerializerMethodField('typeUser')
    jobApplicant = JobApplicationSerializers()

    def typeUser(self, user):
        try:
            e = Employer.objects.get(user=user)
            return 'recruiter'
        except : return 'user'
    class Meta:
        model = User
        fields = ["id", "first_name", "last_name", "email", "username", "password", "avatar", "type", "jobApplicant"]
        extra_kwargs = {
            'password': {'write_only': 'true'}
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()

        return user

class UserCreateSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "email", "username", "password"]
        extra_kwargs = {
            'password': {'write_only': 'true'}
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()

        return user


class LocationSerializers(serializers.RelatedField):
    def to_representation(self, value):
       return '%s, %s' % (value.city, value.country)

class LocationSelectSerializers(ModelSerializer):
    class Meta:
        model = Location
        fields = ["id", "country", "city"]


class PostSerializers(ModelSerializer):
    location = serializers.SerializerMethodField('loca')
    created_date = serializers.DateTimeField(format="%d-%m-%Y %H:%M:%S")
    category = serializers.SlugRelatedField(slug_field="name", read_only=True)

    def loca(self, post):
        return '%s, %s' %(post.location.city, post.location.country)

    class Meta:
        model = Post
        fields = ["id", "title", "image", "created_date", "category", "location", "description", "salary", "active" ]

class EmployerSerializers(ModelSerializer):
    user = UserSerializer()
    avg_rating = serializers.SerializerMethodField('avgrating')

    def avgrating(self, employer):
        avg = []
        for p in employer.post.all():
            point = p.applies.aggregate(Avg('stars'))
            if point['stars__avg'] is not None:
                avg.append(point['stars__avg'])
        if len(avg) != 0:
            return sum(avg) / len(avg)
        # if not avg:
        #     return reduce(lambda a, b: a + b, avg) / len(avg)

    class Meta:
        model = Employer
        fields = ["user", "company_name", "address", "contact_email", "contact_phone", "is_accepted", "logo_image", "avg_rating"]
        # fields = '__all__'

class EmployerItemSerializers(ModelSerializer):
    user = UserSerializer()
    list_post = serializers.SerializerMethodField('get_list_post_active')
    count_post = serializers.SerializerMethodField('f_count_post')
    avg_rating = serializers.SerializerMethodField('avgrating')
    def avgrating(self, employer):
        avg = []
        for p in employer.post.all():
            point = p.applies.aggregate(Avg('stars'))
            if point['stars__avg'] is not None:
                avg.append(point['stars__avg'])

        if len(avg) != 0:
            return sum(avg) / len(avg)


    def f_count_post(self, employer):
        count = employer.post.filter(active=True).count()
        return '%d' %(count)

    def get_list_post_active(self, employer):
        request = self.context['request']
        qs = employer.post.filter(active=True)
        serializer = PostSerializers(qs, many=True, context={"request": request})
        return serializer.data

    class Meta:
        model = Employer
        fields = ["user", "company_name", "address", "contact_email", "avg_rating", "contact_phone", "is_accepted", "logo_image", "list_post", "count_post"]
class TagSerializers(ModelSerializer):
    class Meta:
        model = Tag
        fields = ["id", "name"]


class CategorySerializers(ModelSerializer):
    class Meta:
        model = Category
        fields = ["id", "name"]

class JASerializers(ModelSerializer):
    user = serializers.SerializerMethodField('get_full_name')
    email = serializers.SerializerMethodField('get_email')

    def get_full_name(self, value):
        if value.user.first_name == "" or value.user.last_name == "":
            return value.user.username
        else:
            return '%s %s' % (value.user.first_name, value.user.last_name)

    def get_email(self, value):
        return value.user.email

    class Meta:
        model = JobApplicant
        fields = [ "user", "cv", "cover_letter", "phone", "address", "email"]

class ApplySerializers(ModelSerializer):
    post_title= serializers.SerializerMethodField('title')
    date_apply = serializers.DateTimeField(format="%d-%m-%Y %H:%M")
    applicant = JASerializers()
    def title(self, apply):
        return '%s' % (apply.post.title)
    class Meta:
        model = Apply
        fields = ["id", "post", "applicant", "date_apply", "status", "stars", "comment", "post_title"]

class UserAva(ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "username", "avatar"]

class ApplySimpleSerializers(ModelSerializer):
    post_title= serializers.SerializerMethodField('title')
    user = serializers.SerializerMethodField('userInfo')

    def userInfo(self, apply):
        request = self.context['request']
        queryset = User.objects.get(jobApplicant = apply.applicant)
        serializer = UserAva(queryset, context={"request": request})
        return serializer.data

    def title(self, apply):
        return '%s' % (apply.post.title)
    class Meta:
        model = Apply
        fields = ["id", "user", "stars", "comment", "post_title"]
class PostItemSerializers(ModelSerializer):
    location = serializers.SerializerMethodField('loca')
    created_date = serializers.DateTimeField(format="%d-%m-%Y %H:%M:%S")
    updated_date = serializers.DateTimeField(format="%d-%m-%Y %H:%M:%S")
    category = serializers.SlugRelatedField(slug_field="name", read_only=True)
    jobApplicant = serializers.SerializerMethodField('apply_count')
    employer = EmployerSerializers()
    tags = serializers.SlugRelatedField(slug_field="name", many=True, read_only=True)

    def apply_count(self, post):
        count = post.jobApplicant.count()
        return '%d' %(count)

    def loca(self, post):
        return '%s, %s' %(post.location.city, post.location.country)

    class Meta:
        model = Post
        fields = ["id", 'title', "salary", "description", "image", "created_date", "updated_date", "active", "category", "location", "address", "employer", "tags", 'jobApplicant']

