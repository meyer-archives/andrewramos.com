from django.db import models
from datetime import datetime
from easy_thumbnails.files import get_thumbnailer
from django.conf import settings

PAGE_STATUS = (
	('p','published'),
	('d','draft'),
)

class StaticPage(models.Model):
	title = models.CharField(max_length=200)
	slug = models.SlugField(max_length=100, db_index=True)
	content_markdown = models.TextField(blank=False,help_text='Text is formatted using Markdown.',verbose_name='content')
	content = models.TextField(blank=True, null=True,verbose_name='rendered content')
	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)
	status = models.CharField(default="d",max_length=1,choices=PAGE_STATUS)

	def save(self):
		import markdown
		self.content = markdown.markdown(self.content_markdown, ['extra','footnotes'])
		super(StaticPage, self).save()

	@models.permalink
	def get_absolute_url(self):
		return ('content.views.page_single',[str(self.slug)])

	def view_on_site(self):
		print self.get_absolute_url()
		return "<a class='view-on-site-link' href='%s'>View on site</a>" % self.get_absolute_url()
	view_on_site.short_description = 'Page link'
	view_on_site.allow_tags = 'True'

	class Meta:
		verbose_name, verbose_name_plural = 'static page', 'static pages'
		ordering = ('status','slug',)

	def __unicode__(self):
		return "%s (%s)" % (self.title,self.slug,)

class EmailMessage(models.Model):
	"""Emails from the contact form"""

	email_address = models.EmailField()
	subject = models.CharField(blank=False, max_length=100)
	message = models.TextField(blank=False)
	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)

	class Meta:
		verbose_name, verbose_name_plural = 'email', 'emails'

	def __unicode__(self):
		return u"%s (from %s)" % (self.subject,self.email_address)

class FrontPageContent(models.Model):
	"""(FrontPageContent description)"""

	image = models.ImageField(upload_to="uploads/front-page",help_text="Image should be no more than 220px wide. Larger images will be scaled down.")
	link = models.URLField(blank=True, verify_exists=False,help_text="Optional link to attach to the image.")
	enabled = models.BooleanField(default=True)

	def link_formatted(self):
		if self.link:
			return self.link
		else:
			return 'None'
	link_formatted.short_description = 'Link'

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
		verbose_name, verbose_name_plural = 'front page image', 'front page images'

	def __unicode__(self):
		return u'Front page image'
