App = require 'app'

App.Router = Em.Router.extend

  enableLogging: true

  root: Em.Route.extend
        
    index: Em.Route.extend
      route: '/'
      redirectsTo: 'home'

    home: Em.Route.extend
      route: '/home'
            
      doBob: (router, event) ->
        router.transitionTo 'bob'

      gotoEmails: (router, event) ->
        router.transitionTo 'emails'

      connectOutlets: (router, context) ->
        router.get('applicationController')
          .connectOutlet 'home'

    bob: Em.Route.extend
      route: '/bob'

      doHome: (router, event) -> router.transitionTo 'home'

      connectOutlets: (router, context) ->

        theMan = App.BobModel.create().setProperties
          firstName: 'bob'
          lastName: 'marley'
          lyrics: 'no woman no cry!'

        router.get('applicationController')
          .connectOutlet 'bob', theMan

    emails: Em.Route.extend
      route: '/emails'

      doHome: (router, event) -> router.transitionTo 'home'

      connectOutlets: (router, context) ->
        emails = App.EmailModel.find()
        router.get('applicationController')
          .connectOutlet 'emails', {emails}


    email: Em.Route.extend
      route: '/emails/:id'

      doHome: (router, event) -> router.transitionTo 'home'
      
      connectOutlets: (router, context) ->
        email = App.EmailModel.find context.id

        router.get('applicationController')
          .connectOutlet 'email', email
