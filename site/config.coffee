fs   = require 'fs'
path = require 'path'

# See docs at http://brunch.readthedocs.org/en/latest/config.html.

exports.config =

  files:
    
    javascripts:
      defaultExtension: 'js'
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/

      order:
        before: [
          'vendor/scripts/console-helper.js'
          'vendor/scripts/debug.js'
          'vendor/scripts/jquery-1.8.0.min.js'
          'vendor/scripts/handlebars-1.0.0.beta.6.js'
          'vendor/scripts/ember-latest.js'
          #'ember.js/dist/ember.js'
          'vendor/scripts/ember-data-latest.js'
          #'ember-data/dist/ember-data.js'
          #'vendor/scripts/bootstrap.js'
          'bootstrap/js/bootstrap-modal.js'
        ]

    stylesheets:
      defaultExtension: 'less'
      joinTo: 'stylesheets/app.css'

    templates:
      precompile: true
      defaultExtension: 'hbs'
      joinTo: 'javascripts/app.js' : /^app/

  server:
    port: 3333
    base: '/'
    run: no
