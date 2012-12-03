App = require 'app'

App.EmailModel = DS.Model.extend
  primaryKey: -> '_id'

  # attributes
  _id  : DS.attr 'string'
  title: DS.attr 'string'
  text : DS.attr 'string'
  date : DS.attr 'date'

.reopenClass
  url: 'email'
