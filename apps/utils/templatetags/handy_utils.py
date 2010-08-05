from django.template import Library, Node, Variable, loader
from django.template.context import Context
from django.utils.safestring import mark_safe
from django.contrib.admin.templatetags.admin_list import result_headers
import re

register = Library()

@register.simple_tag
def is_current(request, pattern, return_class='current'):
	return re.search(pattern, request.path_info) and return_class or ""

class PartialTemplateNode(Node):
	def __init__(self, template_name, context_item):
		self.template_name = template_name
		self.context_item = Variable(context_item)

	def render(self, context):
		template = loader.get_template('partials/%s.html' % (self.template_name,))
		item = self.context_item.resolve(context)
		template_context = Context({
			'item': item
		})
		return template.render(template_context)

@register.tag
def blog_partial(parser, token):
	tag, template_name, context_item = token.split_contents()
	return PartialTemplateNode(template_name, context_item)