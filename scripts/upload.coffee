#!/usr/bin/env coffee
process.env.DEBUG = "upload*"
PROJECT_PATH = "/home/aotimme/timme/fred-site"
SERVER_PATH  = "#{PROJECT_PATH}/server"
DATA_PATH    = "#{PROJECT_PATH}/data"

fs       = require 'fs'
mongoose = require 'mongoose'
debug    = require 'debug'
config   = require "#{SERVER_PATH}/config"
#Email    = require "#{SERVER_PATH}/models/email"
emailSchema = new mongoose.Schema
  title: String
  date : {type: Date, default: Date.now}
  text : String
Email = mongoose.model 'Email', emailSchema

debug = debug 'upload'

mongoose.connect config.DB

file = fs.readFileSync "#{DATA_PATH}/emails/10-21-2012.json"
json = JSON.parse file

email = new Email json
debug 'saving email', email.title
email.save (err) ->
  debug 'SAVE FAIL' if err
  debug 'DONE'
