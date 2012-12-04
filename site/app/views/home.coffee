App = require 'app'

App.HomeView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')

  templateName: require 'templates/home'
