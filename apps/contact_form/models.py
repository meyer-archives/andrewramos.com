from django.db import models
from datetime import datetime

class EmailMessage(models.Model):
	"""Emails from the contact form"""

	email_address = models.EmailField()
	subject = models.CharField(blank=False, max_length=100)
	message = models.TextField(blank=False)
	date_added = models.DateTimeField(auto_now_add=True, default=datetime.now)
	date_modified = models.DateTimeField(auto_now=True, default=datetime.now)

	class Meta:
		verbose_name, verbose_name_plural = 'email', 'email'

	def __unicode__(self):
		return u"%s (from %s)" % (self.subject,self.email_address)
