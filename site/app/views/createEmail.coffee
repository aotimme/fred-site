App = require 'app'

App.CreateEmailView = Em.View.extend
  didInsertElement: -> @$().hide().fadeIn('slow')

  templateName: require 'templates/createEmail'
  tagName: 'form'

  submit: (event) ->
    event.preventDefault()
    console.log 'create email submit'
    @get('controller').createRecord()
