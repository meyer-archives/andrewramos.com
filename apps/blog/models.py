from django.db import models
from datetime import datetime
from django.contrib.auth.models import User
from tagging.fields import TagField
from easy_thumbnails.files import get_thumbnailer
from django.conf import settings
from django.contrib.contenttypes import generic
from django.contrib.contenttypes.models import ContentType

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
	date_published = models.DateTimeField(blank=False, default=datetime.now,verbose_name="Publish date")
	post_status = models.CharField(default="p",max_length=1,choices=POST_STATUS)
	tags = TagField()
	images = generic.GenericRelation(Image)

	def template_name(self):
		return "blog/single_%s.html" % self._meta.module_name

	def view_on_site(self):
		return "<a class='view-on-site-link' href='%s'>View on site</a>" % self.get_absolute_url()
	view_on_site.short_description = ''
	view_on_site.allow_tags = 'True'

	class Meta:
		abstract = True

	def __unicode__(self):
		return self.title


class Article(BlogPost):
	"""Article"""
	excerpt = models.TextField(blank=True)
	display_title = models.BooleanField(default=True)
	subtitle = models.CharField(blank=True, max_length=100, verbose_name="subtitle")
	images = generic.GenericRelation(Image)
	# featured_image = models.ImageField(blank=True,upload_to="featured-images/")

	# def featured_image_preview(self):
	# 	if self.featured_image:
	# 		try:
	# 			thumbnail_options = dict(size=(150, 150), crop=False)
	# 			img = get_thumbnailer(self.featured_image).get_thumbnail(thumbnail_options)
	# 			return "<img style='border:1px solid #CCC;padding:1px;background:#FFF;float:left' src='%s%s'>" % (settings.MEDIA_URL,img)
	# 		except:
	# 			return "None"
	# 	else:
	# 		return "None"
	# featured_image_preview.short_description = 'Featured image'
	# featured_image_preview.allow_tags = 'True'

	@models.permalink
	def get_absolute_url(self):
		return ('blog.views.article_single',[str(self.slug)])

class CaseStudy(BlogPost):
	"""Case Study"""
	excerpt = models.TextField(blank=True)
	# featured_image = models.ImageField(upload_to="case-studies/")

	# def featured_image_preview(self):
	# 	if self.featured_image:
	# 		try:
	# 			thumbnail_options = dict(size=(150, 150), crop=False)
	# 			img = get_thumbnailer(self.featured_image).get_thumbnail(thumbnail_options)
	# 			return "<img style='border:1px solid #CCC;padding:1px;background:#FFF;float:left' src='%s%s'>" % (settings.MEDIA_URL,img)
	# 		except:
	# 			return "None"
	# 	else:
	# 		return "None"
	# featured_image_preview.short_description = 'Featured image'
	# featured_image_preview.allow_tags = 'True'

	@models.permalink
	def get_absolute_url(self):
		return ('blog.views.casestudy_single',[str(self.slug)])

	class Meta:
		verbose_name_plural = "case studies"

class ShortPost(BlogPost):
	"""Short post with an optional link"""
	link = models.URLField(blank=True, verify_exists=False)

	@models.permalink
	def get_absolute_url(self):
		return ('blog.views.shortpost_single',[str(self.slug)])

class Quote(BlogPost):
	"""Quote post type"""
	author = models.CharField(blank=True, max_length=100)

	@models.permalink
	def get_absolute_url(self):
		return ('blog.views.quote_single',[str(self.slug)])


class Image(models.Model):
	image = models.ImageField(upload_to="uploads/blog")
	content_type = models.ForeignKey(ContentType)
	object_id = models.PositiveIntegerField()
	content_object = generic.GenericForeignKey("content_type", "object_id")

	class Meta:
		verbose_name_plural = "images"