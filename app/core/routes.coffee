######
# Routes and resources config
######
module.exports = class Routes
  constructor: (app) ->
    resources = ['tab', 'result']
    actions =
      'get': 'show'
      'post': 'create'
      'delete': 'destroy'

    # Extend app with the CRUD actions
    for res in resources
      for verb, action of actions
        app[verb] "/#{res}.json", (request, response) ->
          response.send 200

      app.get "/#{res}s.json", (request, response) ->
        response.send 200