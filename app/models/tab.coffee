######
#  Tab model
######
mongoose = require 'mongoose'
result = require './result'

module.exports = new mongoose.Schema
  title: String
  regex: String
  url: String
  results: [result]
