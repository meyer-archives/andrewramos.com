from django.db import models
from datetime import datetime
from easy_thumbnails.files import get_thumbnailer
from django.conf import settings

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
