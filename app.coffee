######
# Main server app file
######
express = require 'express'
server = express()

# Configure Express.js application
server.use '/', express.static("#{__dirname}/public")
server.listen 3000

module.exports = server
require('./app/core/routes') server