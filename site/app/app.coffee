# Application bootstrapper

App = Em.Application.create()
App.store = DS.Store.create
  revision: 9
  adapter: DS.RESTAdapter.create
    bulkCommit: false
    mappings:
      emails: 'App.EmailModel'
    serializer: DS.Serializer.extend
      primaryKey: (type) -> '_id'
module.exports = App
