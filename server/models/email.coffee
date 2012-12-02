# The Email model
mongoose = require 'mongoose'

emailSchema = new mongoose.Schema
  title: String
  date : {type: Date, default: Date.now}
  text : String

module.exports = mongoose.model 'Email', emailSchema
