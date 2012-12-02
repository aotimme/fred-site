App = require 'app'

App.Email = DS.Model.extend
  primaryKey: '_id'
  url: 'emails'

  title: DS.attr 'string'
  text : DS.attr 'string'
  date : DS.attr 'date'
