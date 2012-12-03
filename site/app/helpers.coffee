# load helpers

Handlebars.registerHelper 'breakLines', (property, options) ->
  console.log property, options
  value = Ember.Handlebars.get(this, property, options)
  console.log value
  new Handlebars.SafeString(value.split('\n').join('<br/>'))
