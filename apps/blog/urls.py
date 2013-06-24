from django.conf.urls import url, patterns
from blog.views import index, archives, article_single, shortpost_single, casestudy_single, quote_single, tagged_posts
from blog.feeds import LatestEntriesFeed

urlpatterns = patterns('blog.views',
	url(r'^$', index, name='blog-home'),
	url(r'^archives/$', archives, name='blog-archives'),
	url(r'^article/(?P<post_slug>[\w-]+)/$', article_single, name='article-single'),
	url(r'^short-post/(?P<post_slug>[\w-]+)/$', shortpost_single, name='shortpost-single'),
	url(r'^case-study/(?P<post_slug>[\w-]+)/$', casestudy_single, name='casestudy-single'),
	url(r'^quote/(?P<post_slug>[\w-]+)/$', quote_single, name='quote-single'),
	url(r'^feed/$', LatestEntriesFeed(),name="rss-feed"),
	url(r'^tags/(?P<slug>[\w-]+)/$', tagged_posts, name='tagged-posts'),
)