from django.conf.urls.defaults import *

urlpatterns = patterns('blog.views',
    (r'^$', 'index'),
	(r'^archives/$', 'archives_index'),
    (r'^archives/(?P<post_slug>[\w-]+)/$', 'single_post'),
)