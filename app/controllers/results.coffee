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
    if req.body.results.length > 0
      Tab.findById req.body._id, (err, tab) ->
        res.send 500 if err?
        tab.results = []
        tab.save (err) -> res.send 500 if err?

    # Get HTML by the URL
    request.get req.body.url, (err, response, body) ->
      if not err and response.statusCode is 200
        console.log body
      else
        res.send 500
