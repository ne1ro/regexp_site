######
# Main server app file
######
express = require 'express'
app = express()

# Configure Express.js application
PORT = 3000
app.use '/', express.static("#{__dirname}/public")
app.listen PORT

require('./app/core/routes.coffee') app
module.exports = app