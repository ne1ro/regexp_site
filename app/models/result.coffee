######
#  Result model
######
mongoose = require 'mongoose'
resultSchema = new mongoose.Schema
  result: String

module.exports = mongoose.model 'Result', resultSchema
