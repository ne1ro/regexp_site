######
# Main server app file
######
express = require 'express'
mongoose = require 'mongoose'
bodyParser = require 'body-parser'
server = express()

# Configure Express.js application
server.use '/', express.static("#{__dirname}/public")
server.use bodyParser.json()
server.listen 3000

# Connect to DB
mongoose.connect 'mongodb://localhost/spa'

module.exports = server
require('./app/core/routes') server