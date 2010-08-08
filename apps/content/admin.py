from django.contrib import admin
from content.models import StaticPage, EmailMessage, FrontPageContent

class PageAdmin(admin.ModelAdmin):
	prepopulated_fields = {"slug":("title",)}
	list_display = ('title','page_status','slug')
	search_fields = ('title',)
	list_filter = ('date_modified','date_added','page_status',)
	list_editable = ('page_status',)
	readonly_fields = ('date_added','date_modified',)
	date_hierarchy = 'date_added'
	fieldsets = (
		(None,{
			'fields':(('title','slug'),'content_markdown','page_status')
		}),
		("Meta Information",{
			'fields':('date_added','date_modified',)
		}),
	)
	class Media: 
		js = ('showdown.js','showdown-textarea.js',)
		css = {
			'all': ('showdown-textarea.css',)
		}

class EmailAdmin(admin.ModelAdmin):
	list_display = ('subject','email_address',)
	search_fields = ('email_address',)
	readonly_fields = ('date_added','date_modified','subject','email_address','message')
	fieldsets = (
		(None,{
			'fields':('email_address','subject','message',)
		}),
		("Meta Information",{
			'fields':('date_added','date_modified',)
		}),
	)
	date_hierarchy = 'date_added'

class FrontPageAdmin(admin.ModelAdmin):
	list_display = ('thumbnail','link_formatted','enabled',)
	list_editable = ('enabled',)

admin.site.register(FrontPageContent, FrontPageAdmin)
admin.site.register(StaticPage,PageAdmin)
admin.site.register(EmailMessage,EmailAdmin)