from django.contrib import admin
from portfolio.models import Project, PortfolioPiece, Client
from django.contrib.contenttypes import generic
from utils.widgets import AdminImageFieldWithThumbWidget
from django.db import models

#class PortfolioPieceAdmin(admin.ModelAdmin):
#    pass
#    list_display = ('title','project_link','thumbnail',)
#    readonly_fields = ('date_added','date_modified',)

class PortfolioPieceInline(generic.GenericTabularInline):
    formfield_overrides = {
        models.ImageField: {'widget':AdminImageFieldWithThumbWidget},
    }
    model = PortfolioPiece
    extra = 1

class ProjectAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug":("title",)}
    list_display = ('title','client','status','view_on_site')
    list_editable = ['status',]

    fieldsets = (
        (None, {
            'fields': (('title', 'slug',), 'description', 'client', 'status', 'image_width', 'case_study',),
        }),
    )

#    list_filter = ('date_modified','date_added',)
    inlines = [PortfolioPieceInline]
    save_on_top = True

admin.site.register(Project, ProjectAdmin)
#admin.site.register(PortfolioPiece, PortfolioPieceAdmin)
admin.site.register(Client)