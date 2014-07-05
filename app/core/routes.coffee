######
# Routes and resources config
######
module.exports = class Routes
  constructor: (app) ->
    @resources = ['tab', 'result']

    app.get '/tabs.json', (req, res) ->
      res.send
        tabs: []