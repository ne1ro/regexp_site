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
          regex = new RegExp(req.body.regex, 'gi')
          indexes = []
          indexes.push result.index while (result = regex.exec(body))
          matches = body.match regex

          # Map matches with indexes
          results = _.map matches, (match, i) ->
            lIndex = if indexes[i] - 10 < 0 then 0 else indexes[i] - 10
            rIndex = if indexes[i] + match.length + 10 > body.length - 1  \
              then body.length - 1 else indexes[i] + 10 + match.length

            {
              value: match
              index: indexes[i]
              body: body
              text: body[lIndex .. rIndex]
            }

          console.log results

        else
          res.send 500
