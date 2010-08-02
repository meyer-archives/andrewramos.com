from django.conf.urls.defaults import *

urlpatterns = patterns('portfolio.views',
    (r'^$', 'index'),
    (r'^(?P<project_slug>\w[\w-]+\w)/$', 'project'),
)