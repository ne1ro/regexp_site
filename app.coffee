######
#  Main server app file
######
express = require 'express'
app = express()

PORT = 3000

app.get '/', (req, res) ->
  res.send 'It works!'

app.listen PORT