from django.db import models
from datetime import datetime
from django.contrib.auth.models import User
from tagging.fields import TagField
from easy_thumbnails.files import get_thumbnailer
from django.conf import settings
from django.contrib.contenttypes import generic
from django.contrib.contenttypes.models import ContentType

class Project(models.Model):
	title = models.CharField(blank=False, max_length=100)
	slug = models.SlugField()
	client = models.ForeignKey("Client")
	active = models.BooleanField(default=True, verbose_name="Visible")
	tags = TagField()
	pieces = generic.GenericRelation('PortfolioPiece')

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


class PortfolioPiece(models.Model):
	title = models.CharField(blank=False, max_length=100)
	description = models.CharField(blank=True, max_length=150)
	image = models.ImageField(upload_to="uploads/portfolio")

	content_type = models.ForeignKey(ContentType)
	object_id = models.PositiveIntegerField()
	content_object = generic.GenericForeignKey("content_type", "object_id")

	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)

	def project_link(self):
		return "%s <a class='view-on-site-link' href='%s'>(view on site)</a>" % (self.project,self.project.get_absolute_url(),)
	project_link.short_description = 'Project'
	project_link.allow_tags = 'True'

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
		return self.title


class Client(models.Model):
	"""
	Clients for projects
	"""

	client_name = models.CharField(blank=True, max_length=100)

	class Meta:
		verbose_name, verbose_name_plural = "client", "clients"

	def __unicode__(self):
		return self.client_name