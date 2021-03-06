from datetime import datetime

from django.conf import settings
from django.contrib.auth.models import User
from django.contrib.contenttypes import generic
from django.contrib.contenttypes.models import ContentType
from django.contrib.sites.models import Site
from django.db import models
from django.utils.safestring import mark_safe

from taggit.managers import TaggableManager
from shorturls.magic import get_short_url_for_object

__all__ = ['Article','CaseStudy','ShortPost','Quote','Image',]

IMAGES_SIZES = (
	('f',mark_safe('Full width (700&times;440px)')),
	('p',mark_safe('Post width (480&times;440px)')),
)

class BlogPost(models.Model):
	"""Generic post model."""

	POST_STATUS = (
		('p','published'),
		('d','draft')
	)

	title = models.CharField(blank=False, max_length=150)
	slug = models.SlugField(unique=True)
	content_markdown = models.TextField(blank=True,help_text='Text is formatted using Markdown.',verbose_name='content')
	content = models.TextField(blank=True, null=True)
	is_featured = models.BooleanField(default=False,verbose_name="featured post")
	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)
	date_published = models.DateTimeField(blank=False, default=datetime.now,verbose_name="Publish date",help_text='Dates set in the future will only be published at the date specified.')
	status = models.CharField(default="d",max_length=1,choices=POST_STATUS)
#	tags = TaggableManager()

	def template_name(self):
		return "blog/single_%s.html" % self._meta.module_name

	def short_url(self):
		current_site = Site.objects.get_current()
		return '<input onmouseup="this.select()" style="width:200px" value="http://%s%s">' % (current_site.domain, get_short_url_for_object(self))

	short_url.short_description = 'Short URL'
	short_url.allow_tags = 'True'

	def view_on_site(self):
		return "<a class='view-on-site-link' href='%s'>View on site</a>" % self.get_absolute_url()
	view_on_site.short_description = ''
	view_on_site.allow_tags = 'True'

	def save(self):
		import markdown
		self.content = markdown.markdown(self.content_markdown, ['extra','footnotes'])
		super(BlogPost, self).save()

	class Meta:
		abstract = True

	def __unicode__(self):
		return self.title

class Image(models.Model):
	image = models.ImageField(
		upload_to="uploads/blog",
		blank=True, null=True,
	)

	content_type = models.ForeignKey(ContentType)
	object_id = models.PositiveIntegerField()
	content_object = generic.GenericForeignKey("content_type", "object_id")

	class Meta:
		verbose_name, verbose_name_plural = 'image', 'attached images'

	def __unicode__(self):
		return "Image %s" % self.pk

class Article(BlogPost):
	"""Article"""
	excerpt = models.TextField(blank=True,help_text='Optional teaser content to show in the site RSS feed.')
	display_title = models.BooleanField(default=True)
	subtitle = models.CharField(blank=True, max_length=100, verbose_name="subtitle")
	images = generic.GenericRelation(Image)
	image_width = models.CharField(blank=False, default='f', max_length=1, choices=IMAGES_SIZES,help_text='Select a size at which any attached images should be displayed.')

	@models.permalink
	def get_absolute_url(self):
		return ('article-single',[str(self.slug)])

class CaseStudy(BlogPost):
	"""Case Study"""
	excerpt = models.TextField(blank=True)
	images = generic.GenericRelation(Image)
	image_width = models.CharField(blank=False, default='f', max_length=1, choices=IMAGES_SIZES,help_text='Select a size at which any attached images should be displayed.')

	@models.permalink
	def get_absolute_url(self):
		return ('casestudy-single',[str(self.slug)])

	class Meta:
		verbose_name_plural = "case studies"

class ShortPost(BlogPost):
	"""Short post with an optional link"""
	link = models.URLField(blank=True, help_text='Optional link to append to the end of the post.')

	@models.permalink
	def get_absolute_url(self):
		return ('shortpost-single',[str(self.slug)])

class Quote(BlogPost):
	"""Quote post type"""
	author = models.CharField(blank=True, max_length=100)

	@models.permalink
	def get_absolute_url(self):
		return ('quote-single',[str(self.slug)])