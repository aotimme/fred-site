App = require 'app'

App.BobView = Em.View.extend

  templateName: require 'templates/bob'

  doClick: (router, event) ->
    alert @get('controller.lyrics')
