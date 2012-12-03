App = require 'app'

App.EmailView = Em.View.extend

  templateName: require 'templates/email'

  doClick: (router, event) ->
    alert @get('controller.dateString')
