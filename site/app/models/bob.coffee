App = require 'app'

App.BobModel = Em.Object.extend

  firstName : null
  lastName  : null
  lyrics    : null

  fullName: (->
    @get('firstName') + ' ' + @get('lastName')
  ).property 'firstName', 'lastName'
