App = require 'app'

App.EmailView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')

  templateName: require 'templates/email'

  doClick: (router, event) ->
    alert @get('controller.dateString')
