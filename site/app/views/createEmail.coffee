App = require 'app'

App.CreateEmailView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')

  templateName: require 'templates/createEmail'
  tagName: 'form'
  classNames: 'form-horizontal'
