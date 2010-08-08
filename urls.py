from django.conf.urls.defaults import *

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
	url(r'^$', 'content.views.front_page', name='home-url'),
	(r'^portfolio/', include('portfolio.urls')),
	(r'^blog/', include('blog.urls')),
    (r'^admin/doc/', include('django.contrib.admindocs.urls')),
    (r'^admin/', include(admin.site.urls)),
	(r'^s/', include('shorturls.urls')),
	(r'^search/', include('haystack.urls')),
	(r'', include('content.urls')),
)
