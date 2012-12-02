express  = require 'express'
mongoose = require 'mongoose'
config   = require 'config'
routes   = require 'lib/routes'

mongoose.connect config.DB

app = express()

app.use express.static "#{__dirname}/../site/public"
#app.use express.bodyParser()

app.get    '/emails'    , routes.log, routes.all
app.get    '/emails/:id', routes.log, routes.one
app.post   '/emails'    , express.bodyParser(), routes.log, routes.post
app.delete '/emails/:id', routes.log, routes.delete

app.listen config.PORT

module.exports = app
