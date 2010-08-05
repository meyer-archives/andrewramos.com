from django.forms import ModelForm
from contact_form.models import EmailMessage

class EmailForm(ModelForm):
	class Meta:
		model = EmailMessage