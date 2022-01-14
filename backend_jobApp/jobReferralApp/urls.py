from django.urls import path, include
from django.views.generic import TemplateView

from . import views
from rest_framework.routers import DefaultRouter

from .views import *

router = DefaultRouter()
router.register('post', views.PostViewSet)
router.register('user', views.UserViewSet)
router.register('employer', views.EmployerViewSet)
router.register('tag', views.TagViewSet)
router.register('category', views.CategoryViewSet)
router.register('location', views.LocationViewSet)
router.register('job-appliant', views.JobApplycantViewSet)
router.register('apply', views.ApplyViewSet)
#/post/ GET
#/post/ POST
#/post/{post_id} GET
#/post/{post_id} PUT
#/post/{post_id} DELETE
urlpatterns = [
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls')),
    path('admin/stats/', PostStatsView.as_view(template_name='admin/post-stats.html')),
    path('admin/stats/user', UserStatsView.as_view(template_name='admin/user-stats.html')),
    path('admin/stats/hr', RecruiterStatsView.as_view(template_name='admin/recruiter-stats.html')),
    path('admin/stats/apply', ApplyStatsView.as_view(template_name='admin/apply-stats.html')),
]
