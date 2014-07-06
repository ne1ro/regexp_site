######
#  Results actions
######
_ = require 'lodash'

module.exports =
# Show all results
  index: (req, res) =>
    res.send []


# Create new result
  create: (req, res) =>
