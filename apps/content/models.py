from datetime import datetime

from django.conf import settings
from django.db import models

# from athumb.fields import ImageWithThumbsField

class FrontPageContent(models.Model):
	"""(FrontPageContent description)"""

	image = models.ImageField(
		upload_to="uploads/front-page",
		# thumbs=(
		# 	('admin_thumb', {'size': (100, 100), 'crop': True}),
		# 	('220', {'size': (220, 1000)}),
		# ),
		blank=True, null=True,
		# thumbnail_format='png'
		)
	link = models.URLField(blank=True, help_text="Optional link to attach to the image.")
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
			# thumbnail_options = dict(size=(100,100), crop=False)
			# img = get_thumbnailer(self.image).get_thumbnail(thumbnail_options)
			return "<img style='border:1px solid #CCC;padding:1px;background:#FFF;float:left' src='%s'>" % (self.image.url,)
			# return 'test'
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
