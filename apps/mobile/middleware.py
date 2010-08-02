from django.conf import settings
from useragents import search_strings

class MobileMiddleware(object):
	def process_request(self, request):
		"""Mobile device detection!"""

		request.enable_mobile = False
		request.mobile = False
		request.mobile_safari = False
		request.iphone = False
		request.ipad = False
		request.mobile_device = False
		
#		 if request.GET.has_key('mobile'):
#			 request.session['enable_mobile'] = request.GET.get('mobile')
		
		request.enable_mobile = True #request.session.get('enable_mobile', 'false').lower() == 'true'
		
#		print('request.enable_mobile: %s' % request.enable_mobile)

		# Parse useragent, check for mobile user
		if request.enable_mobile:

			# Opera Mini headers
			if request.META.has_key("HTTP_X_OPERAMINI_FEATURES"):
				request.mobile = True

			# Useragent parsing
			elif request.META.has_key("HTTP_USER_AGENT"):
				s = request.META["HTTP_USER_AGENT"].lower()

				if "iphone" in s or "ipod" in s:
					request.iphone = "iphone" in s or "ipod" in s
					request.mobile_safari = True
					request.mobile = True
				elif "ipad" in s:
					request.ipad = True
					request.mobile_safari = True
					request.mobile = False
				else:
					for ua in search_strings:
						if ua in s:
							request.mobile = True

		if request.mobile:
			if settings.TEMPLATE_DIRS != settings.MOBILE_TEMPLATE_DIRS:
				settings.TEMPLATE_DIRS = settings.MOBILE_TEMPLATE_DIRS
		else:
			if settings.TEMPLATE_DIRS != settings.SITE_TEMPLATE_DIRS:
				settings.TEMPLATE_DIRS = settings.SITE_TEMPLATE_DIRS
				
		return None