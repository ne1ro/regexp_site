######
# Routes and resources config
######
module.exports = (app) ->
  resources = ['tab']
  actions =
    'get': 'show'
    'delete': 'destroy'

  # Extend app with the CRUD actions
  for res in resources
    resCtrl = require "../controllers/#{res}s"

    for verb, action of actions
      app[verb] "/#{res}/:id.json", (request, response) =>
        resCtrl[action] request, response

    # Index action
    app.get "/#{res}s.json", (request, response) =>
      resCtrl.index request, response

    # Create action
    app.post "/#{res}.json", (request, response) =>
      resCtrl.create request, response