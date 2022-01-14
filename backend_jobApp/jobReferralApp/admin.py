from django.contrib import admin
from django.db.models import Count
from django.contrib.auth.models import Permission
from django.template.response import TemplateResponse
from django.utils.html import mark_safe
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from .models import *
from django.urls import path


class CategoryAdmin(admin.ModelAdmin):
    list_display = ["name", "description"]
#
# class LocationAdmin(admin.ModelAdmin):
#     list_display = ["country", "city"]


class PostForm(forms.ModelForm):
    # descriptions = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        models = Post
        fields = '__all__'


class PostTagInline(admin.TabularInline):
    model = Post.tags.through


class PostAdmin(admin.ModelAdmin):
    class Media:
        css = {
            'all':('/static/css/main.css', )
        }

    form = PostForm
    list_display = ["title", 'description', 'category', 'created_date', "image", "active"]
    search_fields = ['title', "created_date", 'category__name']
    list_filter = ['title', 'category__name']
    readonly_fields = ['avatar']
    inlines = (PostTagInline,)

    def avatar(self, post):
        if post:
            return mark_safe("<img src='/static/{img_url}' alt='{alt}' width='120px'/>".format(img_url = post.image.name, alt=post.title))


class PostInline(admin.StackedInline):
    model = Post
    pk_name = 'employer'


class PostAppAdminSite(admin.AdminSite):
    site_header = 'HE THONG QUAN LY VIEC LAM'

    def get_urls(self):
        return [
            path('post-stats/', self.post_stats)
        ] + super().get_urls()

    def post_stats(self, request):
        post_count = Post.objects.count()
        stats = Post.objects.annotate(post_count=Count('post')).values("id", "title", "post_count")

        return TemplateResponse(request, 'admin/post-stats.html',{
            'post_count':post_count,
            'stats':stats
        })


admin_site = PostAppAdminSite('myjob')

@admin.action(description='Active company')
def make_company_active(modeladmin, request, queryset):
    queryset.update(is_accepted=True)
class EmployerAdmin(admin.ModelAdmin):
    inlines = (PostInline,)
    list_display = ["company_name", "is_accepted"]
    actions = [make_company_active]


# Register your models here.
admin.site.register(Category, CategoryAdmin)
admin.site.register(Post, PostAdmin)
admin.site.register(Tag)
admin.site.register(Employer, EmployerAdmin)
admin.site.register(User)
admin.site.register(Location)
admin.site.register(Permission)
admin.site.register(JobApplicant)
admin.site.register(Apply)