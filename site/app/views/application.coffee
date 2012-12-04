App = require 'app'

App.ApplicationView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')

  templateName: require 'templates/application'
