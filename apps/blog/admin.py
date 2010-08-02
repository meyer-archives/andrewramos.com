from django.contrib import admin
from django.contrib.auth.admin import User
from django.contrib.auth.admin import UserAdmin

from blog.models import Article
from blog.models import CaseStudy
from blog.models import ShortPost
from blog.models import Quote

class BlogPostAdmin(admin.ModelAdmin):
	prepopulated_fields = {"slug":("title",)}
	list_display = ('title','is_featured','is_published',)
	search_fields = ['title']
	list_editable = ('is_featured','is_published',)
	list_filter = ('date_modified','date_added','is_featured','is_published',)
	readonly_fields = ('date_added','date_modified',)
	date_hierarchy = 'date_added'

	fieldsets = (
		(None, {
			'fields': ('title','slug','content',),
		}),
		('Meta Information', {
			'fields': ('tags',('is_featured','is_published'),'date_added', 'date_modified','parent'),
		}),
	)

class ArticleAdmin(BlogPostAdmin):
	pass

class CaseStudyAdmin(BlogPostAdmin):
	pass

class ShortPostAdmin(BlogPostAdmin):
	pass

class QuoteAdmin(BlogPostAdmin):
	pass

admin.site.register(Article, ArticleAdmin)
admin.site.register(CaseStudy,CaseStudyAdmin)
admin.site.register(ShortPost, ShortPostAdmin)
admin.site.register(Quote,QuoteAdmin)