# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Deleting model 'EmailMessage'
        db.delete_table('content_emailmessage')

        # Deleting model 'StaticPage'
        db.delete_table('content_staticpage')


    def backwards(self, orm):
        
        # Adding model 'EmailMessage'
        db.create_table('content_emailmessage', (
            ('date_modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, auto_now=True, blank=True)),
            ('date_added', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, auto_now_add=True, blank=True)),
            ('message', self.gf('django.db.models.fields.TextField')()),
            ('email_address', self.gf('django.db.models.fields.EmailField')(max_length=75)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('subject', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('content', ['EmailMessage'])

        # Adding model 'StaticPage'
        db.create_table('content_staticpage', (
            ('content', self.gf('django.db.models.fields.TextField')(null=True, blank=True)),
            ('status', self.gf('django.db.models.fields.CharField')(default='d', max_length=1)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('date_added', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, auto_now_add=True, blank=True)),
            ('content_markdown', self.gf('django.db.models.fields.TextField')()),
            ('date_modified', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, auto_now=True, blank=True)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=100, db_index=True)),
        ))
        db.send_create_signal('content', ['StaticPage'])


    models = {
        'content.frontpagecontent': {
            'Meta': {'object_name': 'FrontPageContent'},
            'enabled': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'link': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'})
        }
    }

    complete_apps = ['content']
