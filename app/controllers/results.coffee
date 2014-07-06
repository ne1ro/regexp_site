######
#  Results actions
######
_ = require 'lodash'
result = {}
results = []

module.exports =
# Show all results
  index: (req, res) =>
    res.send results


# Create new result
  create: (req, res) =>