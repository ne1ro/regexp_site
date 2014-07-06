######
# Main server app file
######
express = require 'express'
mongoose = require 'mongoose'
server = express()

# Configure Express.js application
server.use '/', express.static("#{__dirname}/public")
server.listen 3000

# Connect to DB
mongoose.connect 'mongodb://localhost/spa'

module.exports = server
require('./app/core/routes') server