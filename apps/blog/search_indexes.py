import datetime
from haystack.indexes import *
from haystack import site
from blog.models import Article, CaseStudy, ShortPost, Quote


class ArticleIndex(SearchIndex): # SearchIndex
	text = CharField(document=True, use_template=True)
	date_published = DateTimeField(model_attr='date_published')

	def get_queryset(self):
		"""Used when the entire index for model is updated."""
		return Article.objects.filter(post_status='p',date_published__lte=datetime.datetime.now())

class CaseStudyIndex(SearchIndex):
	text = CharField(document=True, use_template=True)
	date_published = DateTimeField(model_attr='date_published')

	def get_queryset(self):
		"""Used when the entire index for model is updated."""
		return CaseStudy.objects.filter(post_status='p',date_published__lte=datetime.datetime.now())

class ShortPostIndex(SearchIndex): # SearchIndex
	text = CharField(document=True, use_template=True)
	date_published = DateTimeField(model_attr='date_published')

	def get_queryset(self):
		"""Used when the entire index for model is updated."""
		return ShortPost.objects.filter(post_status='p',date_published__lte=datetime.datetime.now())

class QuoteIndex(SearchIndex): # SearchIndex
	text = CharField(document=True, use_template=True)
	date_published = DateTimeField(model_attr='date_published')

	def get_queryset(self):
		"""Used when the entire index for model is updated."""
		return Quote.objects.filter(post_status='p',date_published__lte=datetime.datetime.now())

site.register(Article, ArticleIndex)
site.register(CaseStudy, CaseStudyIndex)
site.register(ShortPost, ShortPostIndex)
site.register(Quote, QuoteIndex)