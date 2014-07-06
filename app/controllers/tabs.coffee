######
#  Tabs actions
######
_ = require 'lodash'
tab = {}
tabs = []

module.exports =
  # Show all tabs
  index: (req, res) =>
    res.send tabs


  # Show only one tab
  show: (req, res) =>
    res.send tab


  # Create new tab
  create: (req, res) =>


  # Destroy tab by id
  destroy: (req, res) =>