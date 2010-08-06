from django.contrib import admin
from django.contrib.auth.admin import User, UserAdmin
from blog.models import Article, CaseStudy, ShortPost, Quote, Image
from django.contrib.contenttypes import generic

META_INFO = ('Meta Information', {
	'fields': ('tags','is_featured','post_status','date_published','date_added', 'date_modified',),
})

class ImageInline(generic.GenericTabularInline):
	model = Image
	extra = 1

class BlogPostAdmin(admin.ModelAdmin):
	prepopulated_fields = {"slug":("title",)}
	list_display = ('title','is_featured','post_status','view_on_site',)
	search_fields = ('title',)
	list_editable = ('is_featured','post_status',)
	list_filter = ('date_modified','date_added','is_featured','post_status',)
	readonly_fields = ('date_added','date_modified',)
	date_hierarchy = 'date_added'

class ArticleAdmin(BlogPostAdmin):
	list_display = ('title','is_featured','post_status','view_on_site',)
	inlines = [ImageInline,]
	fieldsets = (
		(None, {
			'fields': (('title','slug'),'display_title','subtitle',('content','excerpt'),),
		}),
		META_INFO,
	)

class CaseStudyAdmin(BlogPostAdmin):
	list_display = ('title','is_featured','post_status','view_on_site',)
	inlines = [ImageInline,]
	fieldsets = (
		(None, {
			'fields': (('title','slug'),'content','excerpt',),
		}),
		META_INFO,
	)

class ShortPostAdmin(BlogPostAdmin):
	fieldsets = (
		(None, {
			'fields': (('title','slug'),'content','link'),
		}),
		META_INFO,
	)

class QuoteAdmin(BlogPostAdmin):
	fieldsets = (
		(None, {
			'fields': (('title','slug'),'author','content',),
		}),
		META_INFO,
	)

admin.site.register(Article, ArticleAdmin)
admin.site.register(CaseStudy,CaseStudyAdmin)
admin.site.register(ShortPost, ShortPostAdmin)
admin.site.register(Quote,QuoteAdmin)