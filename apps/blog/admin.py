from django.contrib import admin
from django.contrib.auth.admin import User, UserAdmin
from blog.models import *
from django.contrib.contenttypes import generic
from utils.widgets import AdminImageFieldWithThumbWidget
from django.db import models

META_INFO = ('Meta Information', {
#    'classes': ('collapse',),
    'fields': ('tags','is_featured','status','date_published','date_added', 'date_modified',),
})

class ImageInline(generic.GenericTabularInline):
    formfield_overrides = {
        models.ImageField: {'widget':AdminImageFieldWithThumbWidget},
    }
    model = Image
    extra = 1

class BlogPostAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug":("title",)}
    list_display = ('title','is_featured','status','short_url','view_on_site',)
    search_fields = ('title',)
    list_editable = ('is_featured','status',)
    list_filter = ('date_modified','date_added','is_featured','status',)
    readonly_fields = ('date_added','date_modified','content')
    date_hierarchy = 'date_added'
    save_on_top = True

    class Media: 
        js = ('showdown.js','showdown-textarea.js',)
        css = {
            'all': ('showdown-textarea.css',)
        }

class ArticleAdmin(BlogPostAdmin):
    inlines = [ImageInline,]
    fieldsets = (
        (None, {
            'fields': (('title','slug'),'display_title','subtitle','content_markdown','image_width',),
        }),
        META_INFO,
    )

class CaseStudyAdmin(BlogPostAdmin):
    inlines = [ImageInline,]
    fieldsets = (
        (None, {
            'fields': (('title','slug'),'content_markdown','image_width',),
        }),
        META_INFO,
    )

class ShortPostAdmin(BlogPostAdmin):
    fieldsets = (
        (None, {
            'fields': (('title','slug'),'content_markdown','link'),
        }),
        META_INFO,
    )

class QuoteAdmin(BlogPostAdmin):
    fieldsets = (
        (None, {
            'fields': (('title','slug'),'author','content_markdown',),
        }),
        META_INFO,
    )

admin.site.register(Article, ArticleAdmin)
admin.site.register(CaseStudy,CaseStudyAdmin)
admin.site.register(ShortPost, ShortPostAdmin)
admin.site.register(Quote,QuoteAdmin)