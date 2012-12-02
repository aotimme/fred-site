# Application bootstrapper

App = Em.Application.create()
App.store = DS.Store.create
  revision: 9
  adapter: DS.RESTAdapter.create
    bulkCommit: false
    mappings:
      emails: 'App.Email'
module.exports = App
