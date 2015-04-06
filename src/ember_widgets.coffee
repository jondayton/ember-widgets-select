## Used for bundling files together using neuter

Ember.Widgets = Ember.Namespace.create()
Ember.Widgets.VERSION = '0.2.0'
Ember.Widgets.DISABLE_ANIMATIONS = false
Ember.libraries?.register 'Ember Widgets', Ember.Widgets.VERSION

# Dependencies
require 'dependencies/ember-addepar-mixins/resize_handler'

# Ember-Widgets
require 'build/src/templates'
require 'build/src/mixins'
require 'build/src/select'
require 'build/src/multi_select'