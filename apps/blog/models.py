from django.db import models
from datetime import datetime
from django.contrib.auth.models import User
from tagging.fields import TagField

class BlogPost(models.Model):
	"""Generic post model."""

	POST_STATUS = (
		('p','published'),
		('d','draft')
	)

	title = models.CharField(blank=False, max_length=150)
	slug = models.SlugField(unique=True)
	content = models.TextField(blank=False)
	is_featured = models.BooleanField(default=False,verbose_name="featured post")
	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)
#	status = models.CharField(blank=True, max_length=1, choices=POST_STATUS)
	is_published = models.BooleanField(default=True,verbose_name="published")
	tags = TagField()
	parent = models.ForeignKey('self', null=True, blank=True)

	class Meta:
		abstract = True

	def __unicode__(self):
		return self.title

class Article(BlogPost):
	"""Article"""

	excerpt = models.TextField(blank=True)
	subtitle = models.CharField(blank=True, max_length=100, verbose_name="subtitle")
	featured_image = models.ImageField(blank=True,upload_to="featured-images/")

	class Meta:
		verbose_name, verbose_name_plural = "article", "articles"

	def __unicode__(self):
		return self.title


class CaseStudy(BlogPost):
	"""Case Study"""

	excerpt = models.TextField(blank=True)
	featured_image = models.ImageField(upload_to="case-studies/")

	class Meta:
		verbose_name, verbose_name_plural = "case study", "case studies"

	def __unicode__(self):
		return self.title


class ShortPost(BlogPost):
	"""Short post with an optional link"""
	link = models.URLField(blank=True, verify_exists=False)

	class Meta:
		verbose_name, verbose_name_plural = "short post", "short posts"

	def __unicode__(self):
		return self.title


class Quote(BlogPost):
	"""Quote post type"""
	author = models.CharField(blank=True, max_length=100)

	class Meta:
		verbose_name, verbose_name_plural = "quote", "quotes"

	def __unicode__(self):
		return self.title