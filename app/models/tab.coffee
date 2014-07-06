######
#  Tab model
######
mongoose = require 'mongoose'
result = require './result'

resultSchema = new mongoose.Schema
  result: String

tabSchema = new mongoose.Schema
  title: String
  regex: String
  url: String
  results: [resultSchema]

module.exports = mongoose.model 'Tab', tabSchema
