######
# Routes and resources config
######
module.exports = class Routes
  constructor: (app) ->
    resources = ['tab', 'result']

    # Extend app with the CRUD actions
    for res in resources
      for action in ['get', 'post', 'patch', 'delete']
        app[action] "/#{res}.json", (request, response) ->
          response.send 200

      app.get "/#{res}s.json", (request, response) ->
        response.send 200