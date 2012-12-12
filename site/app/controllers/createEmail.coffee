App = require 'app'
debug = require('debug') 'DEBUG CreateEmailController'

App.CreateEmailController = Em.ObjectController.extend
  exit: ->
    email = @get 'content'
    debug 'email saving?', email.get 'isSaving'
    if not email.get 'isSaving'
      debug 'deleting created email'
      email.deleteRecord()
