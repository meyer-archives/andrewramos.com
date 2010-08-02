from django import template
import re
register = template.Library()

def strip_empty_tags(value):
	replace = "p|ul"
	return str(value).replace(" ","!!!")

register.filter('strip_empty_tags', strip_empty_tags)