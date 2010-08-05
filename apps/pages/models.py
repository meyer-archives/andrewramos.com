from django.db import models
from datetime import datetime

PAGE_TYPES = (
	('pages/default.html','grey page'),
	('pages/white.html','white page')
)
PAGE_STATUS = (
	('p','published'),
	('d','draft'),
)

class Page(models.Model):
	title = models.CharField(max_length=200)
	slug = models.SlugField(max_length=100, db_index=True)
	template = models.CharField(default="g",max_length=30,choices=PAGE_TYPES)
	content = models.TextField(blank=True)
	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)
	page_status = models.CharField(default="p",max_length=1,choices=PAGE_STATUS)

	class Meta:
		verbose_name, verbose_name_plural = 'page', 'pages'
		ordering = ('page_status','slug',)

	def __unicode__(self):
		return "%s (%s)" % (self.title,self.slug,)

		@models.permalink
		def get_absolute_url(self):
			return ('pages.views.page',[str(self.url)])