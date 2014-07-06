######
#  Tab model
######
mongoose = require 'mongoose'
result = require './result'

tabSchema = new mongoose.Schema
  title: String
  regex: String
  url: String
  results: [result]

module.exports = mongoose.model 'Tab', tabSchema
