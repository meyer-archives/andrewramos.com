from django.conf.urls.defaults import *
from pages.views import page_single

urlpatterns = patterns('pages.views',
    url(r'^(?P<page_slug>[\w-]+)/$', page_single),
)