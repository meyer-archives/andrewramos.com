from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template
from django.views.decorators.cache import cache_page

from content.views import front_page

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
	url(r'^$', cache_page(front_page,60*15), name='home-url'),
	(r'^portfolio/', include('portfolio.urls')),
	(r'^blog/', include('blog.urls')),
	(r'^admin/doc/', include('django.contrib.admindocs.urls')),
	(r'^admin/', include(admin.site.urls)),
	(r'^s/', include('shorturls.urls')),
	(r'^search/', include('haystack.urls')),
	url(r'^xmlrpc/$', 'rpc4django.views.serve_rpc_request'),
	url(r'^about/$', direct_to_template, {'template': 'about.html'}, name='about_url'),
)