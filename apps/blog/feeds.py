from django.contrib.syndication.views import Feed
from blog.models import Article, CaseStudy, ShortPost, Quote
from itertools import chain
from django.utils.feedgenerator import Atom1Feed
import datetime

class LatestEntriesFeed(Feed):
	domain = 'andrewramos.com'
	title = 'AndrewRamos.com'
	link = '/blog/feed/'
	description = 'The blog of Andrew Ramos'
	feed_type = Atom1Feed

	author_name = 'Andrew Ramos'
	author_link = 'http://andrewramos.com/'

	def feed_copyright(self):
		now = datetime.datetime.now()
		return 'Copyright (c) %s Andrew Ramos' % now.year

	def items(self):
		articles = Article.objects.all().order_by("-date_published")
		case_studies = CaseStudy.objects.all().order_by("-date_published")
		short_posts = ShortPost.objects.all().order_by("-date_published")
		quotes = Quote.objects.all().order_by("-date_published")

		results = chain(
			articles[:5],
			case_studies[:5],
			short_posts[:5],
			quotes[:5],
		)

		return sorted(results, key=lambda x: x.date_published, reverse=True)

	def item_title(self, item):
		return "%s%s: %s" % (item._meta.verbose_name[0].upper(), item._meta.verbose_name[1:], item.title)

	def item_description(self, item):
		if item._meta.verbose_name == "article":
			return item.content
		elif item._meta.verbose_name == "short post":
			if item.link:
				return "%s: <a href='%s'>%s</a>" % (item.content,item.link,item.link,)
			else:
				return item.content
		elif item._meta.verbose_name == "quote":
			if item.author:
				return "&ldquo;%s&rdquo; &mdash; %s" % (item.content,item.author)
			else:
				return "&ldquo;%s&rdquo;" % item.content
		elif item._meta.verbose_name == "case study":
			return item.content
		else:
			return "Error: blog post type not supported!"

	def item_pubdate(self, item):
		return item.date_published