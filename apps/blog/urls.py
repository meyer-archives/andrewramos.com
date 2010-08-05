from django.conf.urls.defaults import *
from blog.views import index, archives, article_single, shortpost_single, casestudy_single, quote_single
from blog.feeds import LatestEntriesFeed

urlpatterns = patterns('blog.views',
	url(r'^$', index, name='blog-index'),
	url(r'^archives/$', archives, name='blog-archives'),
	url(r'^article/(?P<post_slug>[\w-]+)/$', article_single),
	url(r'^short-post/(?P<post_slug>[\w-]+)/$', shortpost_single),
	url(r'^case-study/(?P<post_slug>[\w-]+)/$', casestudy_single),
	url(r'^quote/(?P<post_slug>[\w-]+)/$', quote_single),
	url(r'^feed/$', LatestEntriesFeed(),name="rss-feed"),
)