from django.contrib import admin
from portfolio.models import Project, PortfolioPiece, Client

class PortfolioPieceAdmin(admin.ModelAdmin):
	pass
	list_display = ('title','project_link','thumbnail',)
	readonly_fields = ('date_added','date_modified',)

class PortfolioPieceInline(admin.StackedInline):
	model = PortfolioPiece
	extra = 1

class ProjectAdmin(admin.ModelAdmin):
	prepopulated_fields = {"slug":("title",)}
	list_display = ('title','client','view_on_site')
#	list_filter = ('date_modified','date_added',)
	inlines = [PortfolioPieceInline]

admin.site.register(Project, ProjectAdmin)
admin.site.register(PortfolioPiece, PortfolioPieceAdmin)
admin.site.register(Client)