App = require 'app'

App.Router = Em.Router.extend
  enableLogging: true

  doHome: (router, event) -> router.transitionTo 'home'

  gotoEmails: (router, event) -> router.transitionTo 'emails.index'

  doAdd: (router, event) -> router.transitionTo 'emails.create'


  root: Em.Route.extend

    index: Em.Route.extend
      route: '/'
      redirectsTo: 'home'

    home: Em.Route.extend
      route: '/home'
            
      connectOutlets: (router, context) ->
        router.get('applicationController')
          .connectOutlet 'main', 'home'
        router.get('applicationController')
          .connectOutlet 'navbar', 'navbar'

    emails: Em.Route.extend
      route: '/emails'

      index: Ember.Route.extend
        route: '/'

        showEmail: Ember.Route.transitionTo 'emails.email'

        connectOutlets: (router, context) ->
          router.get('applicationController')
            .connectOutlet 'main', 'emails', emails: App.EmailModel.find()
          router.get('applicationController')
            .connectOutlet 'navbar', 'navbar'

      email: Em.Route.extend
        route: '/:id'

        destroyItem: (router, event) ->
          email = event.context
          console.log 'deleting email', email
          email.deleteRecord()
          App.store.commit()
          router.transitionTo 'emails.index'

        connectOutlets: (router, context) ->
          console.log router, context
          email = App.EmailModel.find context.id

          router.get('applicationController')
            .connectOutlet 'main', 'email', email
          router.get('applicationController')
            .connectOutlet 'navbar', 'navbar'

      create: Em.Route.extend
        route: '/create'
        
        connectOutlets: (router, context) ->
          console.log 'emails create'

          email = App.EmailModel.createRecord title: 'My Title'

          router.get('applicationController')
            .connectOutlet 'main', 'createEmail', email
