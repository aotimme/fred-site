App = require 'app'

App.CreateEmailController = Em.ObjectController.extend
  exit: ->
    email = @get 'content'
    console.log 'email saving?', email.get 'isSaving'
    if not email.get 'isSaving'
      console.log 'deleting created email'
      email.deleteRecord()
