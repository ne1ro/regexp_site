######
#  Results actions
######
_ = require 'lodash'
request = require 'request'
Result = require '../models/result'
Tab = require '../models/tab'

module.exports =
# Create new result
  create: (req, res) =>
    # Clear previous results
    Tab.findById req.body._id, (err, tab) ->
      res.send 500 if err?

      # Get HTML by the URL
      request.get req.body.url, (err, response, body) ->
        if not err and response.statusCode is 200
          regex = new RegExp(req.body.regex, 'g')
          match = regex.exec body
          console.log match
        else
          res.send 500
