from django.conf.urls import url, patterns, include
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static

from content.views import front_page

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
	url(r'^$', front_page, name='home-url'),
	url(r'^portfolio/', include('portfolio.urls')),
	url(r'^blog/', include('blog.urls')),
	url(r'^admin/', include(admin.site.urls)),
	url(r'^s/', include('shorturls.urls')),
	url(r'^about/$', TemplateView.as_view(template_name='about.html'), name='about-url'),
	url(r'^robots\.txt$', TemplateView.as_view(template_name='robots.txt', content_type='text/plain')),
	url(r'^googled3585815de49d1b8\.html$', TemplateView.as_view(template_name='google.html')),
	url(r'^error\.html$', TemplateView.as_view(template_name='404.html')),
) #+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

# if settings.DEBUG:
# 	urlpatterns += patterns('django.contrib.staticfiles.views',
# 		url(r'^-/(?P<path>.*)$', 'serve'),
# 	)