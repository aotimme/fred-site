App = require 'app'

App.Router = Em.Router.extend
  enableLogging: true

  doHome: (router, event) -> router.transitionTo 'home'

  gotoEmails: (router, event) -> router.transitionTo 'emails.index'

        
  root: Em.Route.extend

    index: Em.Route.extend
      route: '/'
      redirectsTo: 'home'

    home: Em.Route.extend
      route: '/home'
            
      connectOutlets: (router, context) ->
        router.get('applicationController')
          .connectOutlet 'home'

    emails: Em.Route.extend
      route: '/emails'

      index: Ember.Route.extend
        route: '/'

        showEmail: Ember.Route.transitionTo 'emails.email'

        connectOutlets: (router, context) ->
          router.get('applicationController')
            .connectOutlet 'emails', emails: App.EmailModel.find()

      email: Em.Route.extend
        route: '/:id'

        connectOutlets: (router, context) ->
          console.log router, context
          email = App.EmailModel.find context.id

          router.get('applicationController')
            .connectOutlet 'email', email
