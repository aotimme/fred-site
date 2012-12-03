App = require 'app'

App.Router = Em.Router.extend
  enableLogging: true

  doHome: (router, event) -> router.transitionTo 'home'
        
  root: Em.Route.extend

    index: Em.Route.extend
      route: '/'
      redirectsTo: 'home'

    home: Em.Route.extend
      route: '/home'
            
      doBob: (router, event) ->
        router.transitionTo 'bob'

      gotoEmails: (router, event) ->
        router.transitionTo 'emails.index'

      connectOutlets: (router, context) ->
        router.get('applicationController')
          .connectOutlet 'home'

    bob: Em.Route.extend
      route: '/bob'

      connectOutlets: (router, context) ->

        theMan = App.BobModel.create().setProperties
          firstName: 'bob'
          lastName: 'marley'
          lyrics: 'no woman no cry!'

        router.get('applicationController')
          .connectOutlet 'bob', theMan

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

        gotoEmails: (router, event) -> router.transitionTo 'emails'
        
        connectOutlets: (router, context) ->
          console.log router, context
          email = App.EmailModel.find context.id

          router.get('applicationController')
            .connectOutlet 'email', {email}
