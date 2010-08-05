from django.contrib import admin
from contact_form.models import EmailMessage

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

admin.site.register(EmailMessage,EmailAdmin)