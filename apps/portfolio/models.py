from django.db import models
from datetime import datetime
from django.contrib.auth.models import User
from tagging.fields import TagField

class Project(models.Model):
	title = models.CharField(blank=False, max_length=100)
	slug = models.SlugField()
	client = models.CharField(blank=False, max_length=100)
	active = models.BooleanField(default=True)
	tags = TagField()

	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)

	class Meta:
		pass

	def __unicode__(self):
		return self.title

class PortfolioPiece(models.Model):
	title = models.CharField(blank=False, max_length=100)
	description = models.TextField(blank=True, verbose_name="description")
	image = models.ImageField(upload_to="portfolio/")
	project = models.ForeignKey(Project)
	tags = TagField()

	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)

	class Meta:
		pass

	def __unicode__(self):
		return self.title