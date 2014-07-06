######
#  Results actions
######
_ = require 'lodash'
result = {}
results = []

module.exports =
# Show all tabs
  index: (req, res) =>
    res.send results


# Show only one tab
  show: (req, res) =>
    res.send result


# Create new tab
  create: (req, res) =>


    # Destroy tab by id
  destroy: (req, res) =>