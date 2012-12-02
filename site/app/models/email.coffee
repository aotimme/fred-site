App = require 'app'

App.EmailModel = DS.Model.extend
  primaryKey: '_id'

  title: DS.attr 'string'
  text : DS.attr 'string'
  date : DS.attr 'date'
.reopenClass
  url: 'email'
