# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'FrontPageContent'
        db.create_table('content_frontpagecontent', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('image', self.gf('athumb.fields.ImageWithThumbsField')(max_length=255, null=True, blank=True)),
            ('link', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('enabled', self.gf('django.db.models.fields.BooleanField')(default=True)),
        ))
        db.send_create_signal('content', ['FrontPageContent'])


    def backwards(self, orm):
        
        # Deleting model 'FrontPageContent'
        db.delete_table('content_frontpagecontent')


    models = {
        'content.frontpagecontent': {
            'Meta': {'object_name': 'FrontPageContent'},
            'enabled': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('athumb.fields.ImageWithThumbsField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'}),
            'link': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'})
        }
    }

    complete_apps = ['content']
