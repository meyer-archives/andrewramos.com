from django.shortcuts import render_to_response
from django import forms
from django.template import RequestContext
from django.db.models import signals as signalmodule
from django.http import HttpResponse
from django.utils import simplejson
from functools import wraps

def render_to(template=None, mimetype="text/html"):
	"""
	Totally stolen in its entirety from django-annoying. All I needed.
	"""
	def renderer(function):
		@wraps(function)
		def wrapper(request, *args, **kwargs):
			output = function(request, *args, **kwargs)
			if not isinstance(output, dict):
				return output
			tmpl = output.pop('TEMPLATE', template)
			return render_to_response(tmpl, output, context_instance=RequestContext(request), mimetype=mimetype)
		return wrapper
	return renderer