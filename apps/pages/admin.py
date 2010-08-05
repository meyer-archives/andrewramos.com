from django.contrib import admin
from pages.models import Page

class PageAdmin(admin.ModelAdmin):
	prepopulated_fields = {"slug":("title",)}
	list_display = ('title','page_status',)
	search_fields = ('title',)
	list_editable = ('page_status',)
	list_filter = ('date_modified','date_added','page_status',)
	readonly_fields = ('date_added','date_modified',)
	date_hierarchy = 'date_added'

admin.site.register(Page,PageAdmin)