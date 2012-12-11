debug = require 'debug'
async = require 'async'
Email = require 'models/email'

debug = debug 'routes'

exports.log = (req, res, next) ->
  debug "#{req.route.method.toUpperCase()} #{req.route.path}"
  next()

exports.all = (req, res) ->
  Email.find (err, emails) ->
    debug "Retrieved #{emails.length} emails"
    res.send emails: emails

exports.post = (req, res) ->
  emailJSON = req.body.email
  email = new Email
    title: emailJSON.title
    text : emailJSON.text
  email.save (err, email) ->
    res.send email: email

exports.one = (req, res) ->
  Email.findById req.params.id, (err, email) ->
    if not email?
      debug "Email #{req.params.id} does not exist"
      res.send 404
    else
      debug "Email #{req.params.id} retrieved"
      res.send email: email

exports.delete = (req, res) ->
  async.waterfall [
    (next) ->
      Email.findById req.params.id, next
    (email, next) ->
      email.remove next
  ], (err) ->
    if err?
      debug "Email #{req.params.id} removal error"
      res.send 404
    else
      debug "Removed email #{req.params.id}"
      res.send 200
