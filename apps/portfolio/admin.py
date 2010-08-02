from django.contrib import admin
from django.contrib.auth.admin import User
from django.contrib.auth.admin import UserAdmin

from portfolio.models import Project
from portfolio.models import PortfolioPiece

class PortfolioPieceAdmin(admin.ModelAdmin):
	pass
	list_display = ('title','project',)
	readonly_fields = ('date_added','date_modified',)

class PortfolioPieceInline(admin.StackedInline):
	model = PortfolioPiece
	extra = 1

class ProjectAdmin(admin.ModelAdmin):
	prepopulated_fields = {"slug":("title",)}
	list_display = ('title',)
	list_filter = ('date_modified','date_added',)
	inlines = [PortfolioPieceInline]

admin.site.register(Project, ProjectAdmin)
admin.site.register(PortfolioPiece, PortfolioPieceAdmin)