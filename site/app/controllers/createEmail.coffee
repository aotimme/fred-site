App = require 'app'

App.CreateEmailController = Em.ObjectController.extend
  createRecord: ->
    console.log 'creating email'
    email = @get 'content'
    console.log 'email:', email.get('title'), email.get('text')
    App.store.commit()
    #@get('store').commit()
    #email.commit()
