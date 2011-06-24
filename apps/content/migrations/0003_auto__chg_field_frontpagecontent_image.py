# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Changing field 'FrontPageContent.image'
        db.alter_column('content_frontpagecontent', 'image', self.gf('athumb.fields.ImageWithThumbsField')(max_length=255, null=True))


    def backwards(self, orm):
        
        # User chose to not deal with backwards NULL issues for 'FrontPageContent.image'
        raise RuntimeError("Cannot reverse this migration. 'FrontPageContent.image' and its values cannot be restored.")


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
