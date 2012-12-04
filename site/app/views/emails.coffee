App = require 'app'

App.EmailsView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')

  templateName: require 'templates/emails'
