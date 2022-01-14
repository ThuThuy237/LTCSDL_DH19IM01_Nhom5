from datetime import date

from django.db.models import Q
from django.shortcuts import render
from django.views import View
from django.views.generic import TemplateView
from rest_framework.pagination import PageNumberPagination
from rest_framework import viewsets, permissions, generics, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .permission import *
from .serializers import *
from rest_framework.parsers import MultiPartParser, JSONParser

class StandardResultsSetPagination(PageNumberPagination):
    page_size = 5
    page_size_query_param = 'page_size'
    max_page_size = 20

class UserViewSet(viewsets.ViewSet, generics.ListAPIView, generics.CreateAPIView):
     queryset = User.objects.filter(is_active=True)
     serializer_class = UserSerializer
     parser_classes = [MultiPartParser, JSONParser]
     permission_classes = [UserPermission]

     def create(self, request, *args, **kwargs):
          serializer = UserCreateSerializer(data=request.data)
          serializer.is_valid(raise_exception=True)
          serializer.save()

          return Response(serializer.data, status=status.HTTP_201_CREATED)

     @action(methods=['get'], detail=False, url_path="current-user", url_name='get-current-user')
     def get_current_user(self, request):
          return Response(self.serializer_class(request.user, context={"request": request}).data,
                          status=status.HTTP_200_OK)

     @action(methods=['post'], detail=False, url_path="change-password", url_name='change-password')
     def change_password(self, request):
          try:
               user = request.user
               user.set_password(request.data['password'])
               user.save()
               return Response(data={"Result" : "Change password successfully"},
                               status=status.HTTP_200_OK)
          except: return Response(data={"Result" : "Change password failed"},
                          status=status.HTTP_400_BAD_REQUEST)

     @action(methods=['patch'], detail=False, url_path="change-ava", url_name='change-ava')
     def change_ava(self, request):
          try:
               user = request.user
               if request.FILES['avatar'] is not None:
                    user.avatar = request.FILES['avatar']
                    user.save()
               return Response(data={"Result": "Change avatar successfully"},
                               status=status.HTTP_200_OK)
          except:
               return Response(data={"Result": "Change avatar failed"},
                               status=status.HTTP_400_BAD_REQUEST)


     @action(methods=['patch'], detail=False, url_path="change-info", url_name='change-info')
     def change_info(self, request):
          try:
               user = request.user
               if request.data['email'] is not None:
                    user.email = request.data['email']
               if request.data['firstName'] is not None:
                    user.first_name = request.data['firstName']
               if request.data['lastName'] is not None:
                    user.last_name = request.data['lastName']

               user.save()
               return Response(data={"Result": "Change information successfully"},
                               status=status.HTTP_200_OK)
          except:
               return Response(data={"Result": "Change information failed"},
                               status=status.HTTP_400_BAD_REQUEST)


class PostViewSet(viewsets.ViewSet,generics.CreateAPIView, generics.ListAPIView, generics.RetrieveAPIView, generics.UpdateAPIView):

     queryset = Post.objects.all()
     serializer_class = PostSerializers
     pagination_class = StandardResultsSetPagination
     parser_classes = [MultiPartParser, JSONParser]
     # permission_classes = [permissions.IsAuthenticated]


     def list(self, request, *args, **kwargs):
          queryset = Post.objects.filter(active=True)
          kw = self.request.query_params.get('kw', None)
          category = self.request.query_params.get('category', None)
          location = self.request.query_params.get('location', None)
          salary = self.request.query_params.get('salary', None)
          #
          if kw:
               queryset = queryset.filter(title__icontains=kw)
          if category !='' and category:
               queryset = queryset.filter(category_id=category)
          if location !='' and location:
               queryset = queryset.filter(location_id=location)
          if salary:
               queryset = queryset.filter(Q(salary__gte=salary) | Q(salary__gte=0))
          page = self.paginate_queryset(queryset)
          if page is not None:
               serializer = self.get_serializer(page, many=True)
               return self.get_paginated_response(serializer.data)

          serializer = self.get_serializer(queryset, many=True)
          return Response(serializer.data)

     def retrieve(self, request, *args, **kwargs):
          instance = self.get_object()
          serializer = PostItemSerializers(instance, context={"request": request})
          return Response(serializer.data)

     def create(self, request, *args, **kwargs):
          try:
               active = True
               if request.data['active'] is not None and request.data['active'] == "false":
                    active = False
               p = Post.objects.get_or_create(title=request.data['title'],
                                              employer=Employer.objects.get(user=request.user),
                                              address=request.data['address'],
                                              category=Category.objects.get(pk=request.data['category']),
                                              location=Location.objects.get(pk=request.data['location']),
                                              image=request.FILES['image'],
                                              salary=request.data['salary'],
                                              active=active,
                                              description=request.data['description']
                                              )[0]

               if request.data['tags'] != 'undefined' and request.data['tags'] is not None:
                    for i in request.data['tags']:
                         if i != ',':
                              print(i)
                              tag = Tag.objects.get(pk=i)
                              p.tags.add(tag)
               return Response(PostSerializers(p).data, status=status.HTTP_201_CREATED)
          except : return Response(data={"Result": "Bad request!"},
                               status=status.HTTP_400_BAD_REQUEST)

     @action(methods=['get'], detail=False, url_path='get-top5-lastest')
     def gettop5(self, request):
          queryset = Post.objects.filter(active=True)
          category = self.request.query_params.get('category', None)
          if category:
               queryset = queryset.filter(category_id=category)
          queryset = queryset[:5]
          return Response(self.get_serializer(queryset, many=True).data)

     @action(methods=['get'], detail=False, url_path='owner-get')
     def owner_get(self, request):
          try:
               e = Employer.objects.get(user=request.user)
               if e is not None:
                    queryset = Post.objects.filter(employer=e)
                    return Response(self.get_serializer(queryset, many=True).data)
               else:
                    return Response(data={"Result": "User is not have permission!"},
                               status=status.HTTP_400_BAD_REQUEST)
          except:
               return Response(data={"Result": "Bad request!"},
                               status=status.HTTP_400_BAD_REQUEST)

     @action(methods=['get'], detail=True, url_path='delete')
     def delete(self, request, pk):
          try:
               e = Employer.objects.get(user=request.user)
               post = Post.objects.get(pk=pk)
               if post.employer == e:
                    post.delete()
                    return Response(data={"Result": "Delete success!"},
                                    status=status.HTTP_200_OK)
               return Response(data={"Result": "User is not have permission!"},
                               status=status.HTTP_400_BAD_REQUEST)
          except:
               return Response(data={"Result": "Bad request!"},
                               status=status.HTTP_400_BAD_REQUEST)

     @action(methods=['post'], detail=False, url_path='change-active')
     def changActive(self, request):
          try:
               post = Post.objects.get(pk=request.data["postId"])
               em = Employer.objects.get(user=request.user)
               if em is None:
                    return Response(data={"Result": "User is not have permission!"},
                                    status=status.HTTP_400_BAD_REQUEST)
               if post is not None:
                    if post.employer != em:
                         return Response(data={"Result": "User is not have permission!"},
                                         status=status.HTTP_400_BAD_REQUEST)
                    else:
                         post.active = not post.active
                         post.save()
                         return Response(data={"Result": "Change success!"},
                                         status=status.HTTP_200_OK)
               else:
                    return Response(data={"Result": "Post is not found!"},
                                    status=status.HTTP_400_BAD_REQUEST)
          except :
               return Response(data={"Result": "Failed!"},
                               status=status.HTTP_400_BAD_REQUEST)

class EmployerViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.ListAPIView, generics.RetrieveAPIView):
     queryset = Employer.objects.all()
     serializer_class = EmployerSerializers

     def create(self, request, *args, **kwargs):
          e = Employer.objects.get_or_create(company_name = request.data['company_name'],
                                              user=User.objects.get(pk=request.data['user']),
                                              address = request.data['address'],
                                              contact_email = request.data['contact_email'],
                                              contact_phone = request.data['contact_phone'],
                                              )[0]
          return Response(EmployerSerializers(e).data, status=status.HTTP_201_CREATED)

     def retrieve(self, request, *args, **kwargs):
          instance = self.get_object()
          serializer = EmployerItemSerializers(instance, context={"request": request})
          return Response(serializer.data)
     def list(self, request, *args, **kwargs):
          queryset = Employer.objects.filter(is_accepted=True)
          serializer = self.get_serializer(queryset, many=True)
          return Response(serializer.data)

     @action(methods=['patch'], detail=False, url_path="change-info", url_name='change-info')
     def change_info(self, request):
          try:
               employer = Employer.objects.get(user=request.user)
               if request.data['contact_phone'] is not None:
                    employer.contact_phone = request.data['contact_phone']
               if request.data['address'] is not None:
                    employer.address = request.data['address']
               if request.data['company_name'] is not None:
                    employer.company_name = request.data['company_name']
               if request.data['contact_email'] is not None:
                    employer.contact_email = request.data['contact_email']
               employer.save()
               return Response(data={"Result": "Change company information successfully"},
                               status=status.HTTP_200_OK)
          except:
               return Response(data={"Result": "Change company information failed !"},
                               status=status.HTTP_400_BAD_REQUEST)

     @action(methods=['patch'], detail=False, url_path="change-logo", url_name='change-logo')
     def change_logo(self, request):
          try:
               e = Employer.objects.get(user=request.user)
               if request.FILES['logo'] is not None:
                    e.logo_image = request.FILES['logo']
                    e.save()
               return Response(data={"Result": "Change logo successfully"},
                               status=status.HTTP_200_OK)
          except:
               return Response(data={"Result": "Change logo failed"},
                               status=status.HTTP_400_BAD_REQUEST)


class TagViewSet(viewsets.ViewSet, generics.ListAPIView):
     queryset = Tag.objects.all()
     serializer_class = TagSerializers

class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
     queryset = Category.objects.all()
     serializer_class = CategorySerializers

class LocationViewSet(viewsets.ViewSet, generics.ListAPIView):
     queryset = Location.objects.all()
     serializer_class = LocationSelectSerializers

class JobApplycantViewSet(viewsets.ViewSet, generics.ListAPIView):
     queryset = JobApplicant.objects.all()
     serializer_class = JobApplicationSerializers
     parser_classes = [MultiPartParser, JSONParser]

     def retrieve(self, request, *args, **kwargs):
          try:
               try:
                    obj = JobApplicant.objects.get_or_create(user=request.user.id)[0]
                    return Response(JobApplicationSerializers(obj).data, status=status.HTTP_200_OK)
               except:
                    return Response(data={"results":"Null"}, status=status.HTTP_400_BAD_REQUEST)
          except : return Response(data={"results":"Unauthorized"}, status=status.HTTP_401_UNAUTHORIZED)

     @action(methods=['patch'], detail=False, url_path="upload-cv", url_name='upload-cv')
     def upload_cv(self, request):
          try:
               jobApplicant = JobApplicant.objects.get_or_create(user=request.user)[0]
               if request.FILES['cv'] is not None:
                    jobApplicant.cv = request.FILES['cv']
                    print(request.POST.get('cv'))
                    jobApplicant.save()
                    return Response(data={"Result": "Upload Curriculum Vitae successfully"},
                               status=status.HTTP_200_OK)
               else: return Response(data={"Result": "Not have any file upload !"},
                               status=status.HTTP_400_BAD_REQUEST)
          except:
               return Response(data={"Result": "Upload Curriculum Vitae failed"},
                               status=status.HTTP_400_BAD_REQUEST)

     @action(methods=['patch'], detail=False, url_path="upload-cover-letter", url_name='upload-cover-letter')
     def upload_coverletter(self, request):
          try:
               jobApplicant = JobApplicant.objects.get_or_create(user=request.user)[0]
               if request.FILES['coverLetter'] is not None:
                    jobApplicant.cover_letter = request.FILES['coverLetter']
                    jobApplicant.save()
                    return Response(data={"Result": "Upload Cover Letter successfully"},
                               status=status.HTTP_200_OK)
               else: return Response(data={"Result": "Not have any file upload !"},
                               status=status.HTTP_400_BAD_REQUEST)
          except:
               return Response(data={"Result": "Upload Cover Letter failed"},
                               status=status.HTTP_400_BAD_REQUEST)


     @action(methods=['patch'], detail=False, url_path="change-info", url_name='change-info')
     def change_info(self, request):
          try:
               applicant = JobApplicant.objects.get_or_create(user=request.user)[0]
               if request.data['phone'] is not None:
                    applicant.phone = request.data['phone']
                    applicant.save()
               if request.data['address'] is not None:
                    applicant.address = request.data['address']
                    applicant.save()
               return Response(data={"Result": "Change applicant information successfully"},
                               status=status.HTTP_200_OK)
          except:
               return Response(data={"Result": "Change applicant information failed"},
                               status=status.HTTP_400_BAD_REQUEST)


class ApplyViewSet(viewsets.ViewSet, generics.ListAPIView):
     queryset = Apply.objects.all()
     serializer_class = ApplySerializers

     @action(methods=['post'], detail=False, url_path='apply')
     def apply(self, request):
          try:
               post = Post.objects.get(pk=request.data['postId'])
               applicant = JobApplicant.objects.get_or_create(user=request.user)[0]
               if applicant is None:
                    return Response(data={"results": "Unauthorized"}, status=status.HTTP_401_UNAUTHORIZED)
               if post is None:
                    return Response(data={"results": "Not found this post"}, status=status.HTTP_404_NOT_FOUND)
               apply = Apply.objects.get_or_create(post=post, applicant=applicant)
               if apply[1]:
                    return Response(data={"results": "Apply Successfully"}, status=status.HTTP_200_OK)
               else:
                    return Response(data={"results": "This account applied !"}, status=status.HTTP_200_OK)
          except : return Response(data={"results": "Apply Failed"}, status=status.HTTP_400_BAD_REQUEST)

     @action(methods=['post'], detail=True, url_path='manage-status')
     def manage_status(self, request, pk):
          try:
               apply = Apply.objects.get(pk=pk)
               switcher = {
                    "p": Apply.Status.PENDING,
                    "A": Apply.Status.ACCEPT,
                    "R": Apply.Status.REFUSE,
               }

               apply.status = switcher.get(request.data['status'], Apply.Status.PENDING)
               apply.save()
               return Response(data={"Results": "Change status success"}, status=status.HTTP_200_OK)
          except:
               return Response(data={"Results": "Can not change status"}, status=status.HTTP_400_BAD_REQUEST)
     @action(methods=['post'], detail=False, url_path='rating')
     def rating(self, request):
          try:
               post = Post.objects.get(pk=request.data['post'])
               stars = request.data['stars']
               comment = request.data['comment']
               applicant = JobApplicant.objects.get(user=request.user)
               if applicant is None:
                    return Response(data={"Results": "Unauthorized"}, status=status.HTTP_401_UNAUTHORIZED)
               if post is None:
                    return Response(data={"Results": "Not found this post"}, status=status.HTTP_404_NOT_FOUND)
               apply = Apply.objects.get(post=post, applicant=applicant)
               if apply is not None:
                    if stars is not None:
                         apply.stars = stars
                    if comment is not None:
                        apply.comment = comment
                    apply.save()
                    return Response(data={"Results": "Rating Successfully"}, status=status.HTTP_200_OK)
               else:
                    return Response(data={"Results": "The account is not apply this post yet !"}, status=status.HTTP_400_BAD_REQUEST)
          except:
               return Response(data={"Results": "Rating Failed"}, status=status.HTTP_400_BAD_REQUEST)


     @action(methods=['post'], detail=False, url_path="list-of-post", url_name='list-of-post')
     def list_of_post(self, request):
          try:
               # jobApplicant = JobApplicant.objects.get(user=request.user)  check owner
               post = Post.objects.get(id = request.data['postId'])
               if post is not None :
                    result = Apply.objects.filter(post=post)
                    serializer = ApplySerializers
                    return Response(serializer(result, many=True, context={"request": request}).data,
                                    status=status.HTTP_200_OK)
               else:
                    return Response(data={"Result": "Post is not found !"},
                                    status=status.HTTP_400_BAD_REQUEST)
          except:
               return Response(data={"Result": "Have an error !"},
                               status=status.HTTP_400_BAD_REQUEST)
     @action(methods=['get'], detail=False, url_path="get-by-applicant", url_name='get-by-applicant')
     def get_apply(self, request):
          try:
               jobApplicant = JobApplicant.objects.get_or_create(user=request.user)[0]
               queryset = Apply.objects.filter(applicant=jobApplicant)
               serializers = self.serializer_class
               return Response(serializers(queryset, many=True).data,
                                    status=status.HTTP_200_OK)
          except:
               return Response(data={"Result": "Have an error "},
                               status=status.HTTP_400_BAD_REQUEST)

     @action(methods=['post'], detail=False, url_path="get-by-employer", url_name='get-by-employer')
     def get_apply_by_employer(self, request):
          try:
               e = Employer.objects.get(pk=request.data['id'])
               posts = list(Post.objects.filter(employer=e))
               queryset = Apply.objects.filter(Q(post__in=posts),(Q(stars__isnull=False) | Q(comment__isnull=False)))
               serializers = ApplySimpleSerializers
               return Response(serializers(queryset, many=True, context={"request": request}).data,
                               status=status.HTTP_200_OK)
          except:
               return Response(data={"Result": "Have an error !"},
                               status=status.HTTP_400_BAD_REQUEST)


class PostStatsView(TemplateView):
     template_name = "post-stats.html"
     def get_context_data(self, **kwargs):
          context = super().get_context_data(**kwargs)
          today = date.today()
          context['total'] = Post.objects.count()
          context['num_by_years'] = Post.objects.filter(created_date__year=today.year).count()
          num_by_month = Post.objects.filter(created_date__year=today.year, created_date__month=today.month).count()
          num_by_last_month = Post.objects.filter(created_date__year=today.year, created_date__month=(today.month - 1)).count()
          context['num_by_month'] = num_by_month
          if num_by_last_month != 0:
               context['raise'] = int(num_by_month / num_by_last_month) * 100
          else:
               context['raise'] = "Increase"

          posts =[]
          switcher = {
               1: 'January',
               2: 'February',
               3: 'March',
               4: 'April',
               5: 'May',
               6: 'June',
               7: 'July',
               8: 'August',
               9: 'September',
               10: "October",
               11: 'November',
               12: 'December'
          }

          for m in range(1, 13):
               posts.append( Post.objects.filter(created_date__month=m).count())
          listCate = []
          dataCate = []
          for i in Category.objects.all():
               dataCate.append(i.post.count())
               listCate.append(i.name)
          context['postStats'] = posts
          context['listCatename'] = listCate
          context['DataCate'] = dataCate
          return context

class UserStatsView(TemplateView):
     template_name = "user-stats.html"

     def get_context_data(self, **kwargs):
          context = super().get_context_data(**kwargs)
          today = date.today()
          context['total'] = User.objects.count()
          context['num_by_years'] = User.objects.filter(date_joined__year=today.year).count()
          num_by_month = User.objects.filter(date_joined__year=today.year,
                                             date_joined__month=today.month).count()
          num_by_last_month = User.objects.filter(date_joined__year=today.year,
                                                  date_joined__month=(today.month - 1)).count()
          context['num_by_month'] = num_by_month
          if num_by_last_month != 0:
               context['raise'] = int(num_by_month / num_by_last_month) * 100
          else:
               context['raise'] = "Increase"

          users = []
          switcher = {
               1: 'January',
               2: 'February',
               3: 'March',
               4: 'April',
               5: 'May',
               6: 'June',
               7: 'July',
               8: 'August',
               9: 'September',
               10: "October",
               11: 'November',
               12: 'December'
          }

          for m in range(1, 13):
               users.append(User.objects.filter(date_joined__month=m).count())

          context['userStats'] = users
          return context

class RecruiterStatsView(TemplateView):
     template_name = "recruiter-stats.html"

     def get_context_data(self, **kwargs):
          context = super().get_context_data(**kwargs)
          today = date.today()
          context['total'] = Employer.objects.all().count()
          context['num_by_years'] = Post.objects.filter(created_date__year=today.year).count()
          num_by_month = Post.objects.filter(created_date__year=today.year,
                                             created_date__month=today.month).count()
          num_by_last_month = Post.objects.filter(created_date__year=today.year,
                                                  created_date__month=(today.month - 1)).count()
          context['num_by_month'] = num_by_month
          if num_by_last_month != 0:
               context['raise'] = int(num_by_month / num_by_last_month) * 100
          else:
               context['raise'] = "Increase"

          # posts = []
          # switcher = {
          #      1: 'January',
          #      2: 'February',
          #      3: 'March',
          #      4: 'April',
          #      5: 'May',
          #      6: 'June',
          #      7: 'July',
          #      8: 'August',
          #      9: 'September',
          #      10: "October",
          #      11: 'November',
          #      12: 'December'
          # }
          #
          # for m in range(1, 13):
          #      posts.append(Post.objects.filter(created_date__month=m).count())
          # context['postStats'] = posts
          return context

class ApplyStatsView(TemplateView):
     template_name = "apply-stats.html"

     def get_context_data(self, **kwargs):
          context = super().get_context_data(**kwargs)
          today = date.today()
          context['total'] = Apply.objects.count()
          context['num_by_years'] = Apply.objects.filter(date_apply__year=today.year).count()
          num_by_month = Apply.objects.filter(date_apply__year=today.year,
                                             date_apply__month=today.month).count()
          num_by_last_month = Apply.objects.filter(date_apply__year=today.year,
                                                  date_apply__month=(today.month - 1)).count()
          context['num_by_month'] = num_by_month
          if num_by_last_month != 0:
               context['raise'] = int(num_by_month / num_by_last_month) * 100
          else:
               context['raise'] = "Increase"

          applys = []
          switcher = {
               1: 'January',
               2: 'February',
               3: 'March',
               4: 'April',
               5: 'May',
               6: 'June',
               7: 'July',
               8: 'August',
               9: 'September',
               10: "October",
               11: 'November',
               12: 'December'
          }

          for m in range(1, 13):
               applys.append(Apply.objects.filter(date_apply__month=m).count())

          context['applyStats'] = applys
          return context