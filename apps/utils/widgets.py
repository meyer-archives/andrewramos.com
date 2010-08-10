from django.contrib.admin.widgets import AdminFileWidget 
from django.utils.safestring import mark_safe
from easy_thumbnails.files import get_thumbnailer
from django.conf import settings

class AdminImageFieldWithThumbWidget(AdminFileWidget): 
	def render(self, name, value, attrs=None):
		print "%s || %s" % (name,value,)
		thumb_html = '' 
		if value:
			thumbnail_options = dict(size=(100,100), crop=False)
			try:
				img = get_thumbnailer(value).get_thumbnail(thumbnail_options)
				thumb_html = "<img style='border:1px solid #CCC;padding:1px;background:#FFF;float:left;margin-right:10px' src='%s%s'>" % (settings.MEDIA_URL,img)
			except Exception, e:
				print '%s doesn\'t exist' % value
		return mark_safe("%s%s" % (thumb_html, super(AdminImageFieldWithThumbWidget, self).render(name, value, attrs)))