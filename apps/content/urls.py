from django.conf.urls.defaults import *
from content.views import page_single

urlpatterns = patterns('content.views',
    url(r'^(?P<page_slug>[\w-]+)/$', page_single),
)