######
# Main server app file
######
express = require 'express'
app = express()

# Configure Express.js application
PORT = 3000
app.use '/', express.static("#{__dirname}/public")

# Send index.html in other routes
app.all '/*', (req, res) ->
  res.sendfile 'index.html'

app.listen PORT