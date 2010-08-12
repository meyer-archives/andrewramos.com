from django.db import models
from datetime import datetime
from django.contrib.auth.models import User
from tagging.fields import TagField
from easy_thumbnails.files import get_thumbnailer
from django.conf import settings
from django.contrib.contenttypes import generic
from django.utils.safestring import mark_safe
from django.contrib.contenttypes.models import ContentType
from blog.models import CaseStudy

PROJECT_STATUS = (
	('p','published'),
	('d','draft'),
)

IMAGES_SIZES = (
	('f',mark_safe('Full width (700&times;440px)')),
	('p',mark_safe('Post width (480&times;440px)')),
)

class Project(models.Model):
	title = models.CharField(blank=False, max_length=100)
	description = models.CharField(blank=True, max_length=150)
	slug = models.SlugField()
	client = models.ForeignKey("Client")
	status = models.CharField(blank=False, default='d', max_length=1, choices=PROJECT_STATUS)
	# tags = TagField()
	category = generic.GenericRelation('Category')
	pieces = generic.GenericRelation('PortfolioPiece')

	image_width = models.CharField(blank=False, default='f', max_length=1, choices=IMAGES_SIZES,help_text='Select a size at which the portfolio pieces for this project should be displayed.')

	case_study = models.ForeignKey(CaseStudy,blank=True,null=True)

	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)

	@models.permalink
	def get_absolute_url(self):
		return ('portfolio.views.portfolio_single',[str(self.slug)])

	def view_on_site(self):
		return "<a class='view-on-site-link' href='%s'>View on site</a>" % self.get_absolute_url()
	view_on_site.short_description = ''
	view_on_site.allow_tags = 'True'

	class Meta:
		verbose_name, verbose_name_plural = "project", "projects"

	def __unicode__(self):
		return self.title


class Category(models.Model):
	title = models.CharField(blank=False, max_length=100)
	image = models.ImageField(upload_to="uploads/portfolio",help_text='The nav item to show for the portfolio category.',verbose_name='Nav image')

	content_type = models.ForeignKey(ContentType)
	object_id = models.PositiveIntegerField()
	content_object = generic.GenericForeignKey("content_type", "object_id")

	class Meta:
		verbose_name, verbose_name_plural = 'image', 'attached images'

	def __unicode__(self):
		return self.title


class PortfolioPiece(models.Model):
	image = models.ImageField(upload_to="uploads/portfolio")
	order = models.IntegerField(blank=True, null=True,default=1)

	content_type = models.ForeignKey(ContentType)
	object_id = models.PositiveIntegerField()
	content_object = generic.GenericForeignKey("content_type", "object_id")

	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)

	# def project_link(self):
	# 	return "%s <a class='view-on-site-link' href='%s'>(view on site)</a>" % (self.project,self.project.get_absolute_url(),)
	# project_link.short_description = 'Project'
	# project_link.allow_tags = 'True'

	def thumbnail(self):
		if self.image:
			# try:
			thumbnail_options = dict(size=(100,100), crop=False)
			img = get_thumbnailer(self.image).get_thumbnail(thumbnail_options)
			return "<img style='border:1px solid #CCC;padding:1px;background:#FFF;float:left' src='%s%s'>" % (settings.MEDIA_URL,img)
			# except:
				# return "(thumbnail error)"
		else:
			return "(nothing)"
	thumbnail.short_description = 'Image'
	thumbnail.allow_tags = 'True'

	class Meta:
		verbose_name, verbose_name_plural = "portfolio piece", "portfolio pieces"

	def __unicode__(self):
		return "Image %s" % self.pk


class Client(models.Model):
	"""
	Clients for projects
	"""

	client_name = models.CharField(blank=True, max_length=100)

	class Meta:
		verbose_name, verbose_name_plural = "client", "clients"

	def __unicode__(self):
		return self.client_name