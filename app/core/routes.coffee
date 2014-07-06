######
#  Routes and resources config
######
module.exports = (app) ->
  resources = ['tab', 'result']
  actions =
    'get': 'show'
    'delete': 'destroy'
    'patch': 'update'

  # Extend app with the CRUD actions
  for res in resources
    @[res] = require "../controllers/#{res}s"

    for verb, action of actions
      app[verb] "/#{res}/:id.json", (request, response) =>
        @[res][action] request, response

    # Index action
    app.get "/#{res}s.json", (request, response) =>
      @[res].index request, response

    # Create action
    app.post "/#{res}.json", (request, response) =>
      @[res].create request, response