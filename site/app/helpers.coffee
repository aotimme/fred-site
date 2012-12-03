# load helpers

Handlebars.registerHelper 'breakLines', (property, options) ->
  value = Ember.Handlebars.get(this, property, options)
  new Handlebars.SafeString(value.split('\n').join('<br/>'))
