######
# Main server app file
######
class App
  constructor: ->
    express = require 'express'
    @server = express()

    # Configure Express.js application
    @server.use '/', express.static("#{__dirname}/public")
    @server.listen 3000

    require('./app/core/routes.coffee') @server


module.exports = new App