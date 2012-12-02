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

      connectOutlets: (router, context) ->
        router.get('applicationController').connectOutlet 'home'

    bob: Em.Route.extend
      route: '/bob'

      doHome: (router, event) -> router.transitionTo 'home'

      connectOutlets: (router, context) ->

        theMan = App.BobModel.create().setProperties
          firstName: 'bob'
          lastName: 'marley'
          lyrics: 'no woman no cry!'

        router.get('applicationController').connectOutlet 'bob', theMan
