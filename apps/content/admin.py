from django.contrib import admin
from content.models import FrontPageContent
from utils.widgets import AdminImageFieldWithThumbWidget
from django.db import models

class FrontPageAdmin(admin.ModelAdmin):
	list_display = ('thumbnail','link_formatted','enabled',)
	list_editable = ('enabled',)
	formfield_overrides = {
		models.ImageField: {'widget':AdminImageFieldWithThumbWidget},
	}

admin.site.register(FrontPageContent, FrontPageAdmin)