######
#  Tabs actions
######
_ = require 'lodash'
Tab = require '../models/tab'

module.exports =
  # Show all tabs
  index: (req, res) ->
    Tab.find {}, (err, tabs) ->
      unless err?
        res.send tabs
      else
        res.send 500


  # Show only one tab
  show: (req, res) ->
    Tab.findById req.params.id, (err, tab) ->
      if err?
        res.send 500
      else
        if tab?
          res.send tab
        else
          res.send 404


  # Update tab data
  update: (req, res) ->
    Tab.update _id: req.params.id, req.body, (err) ->
      if err?
        res.send 500
       else
        res.send 200


  # Create new tab
  create: (req, res) ->
    tab = new Tab
      title: req.body.title

    tab.save (err) ->
      if err?
        res.send 500
      else
        res.send tab


  # Destroy tab by id
  destroy: (req, res) =>
    Tab.findById req.params.id, (err, tab) ->
      if err?
        res.send 500
      else
        tab.remove()
        res.send 200
