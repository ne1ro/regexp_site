######
#  Routes and resources config
######
module.exports = (app) ->
  resources = ['result', 'tab']

  # Extend app with the CRUD actions
  for res in resources
    @[res] = require "../controllers/#{res}s"

    # Show action
    app.get "/api/#{res}/:id", (request, response) =>
      @[res].show request, response

    # Update action
    app.put "/api/#{res}/:id", (request, response) =>
      @[res].update request, response

    # Destroy action
    app.delete "/api/#{res}/:id", (request, response) =>
      @[res].destroy request, response

    # Index action
    app.get "/api/#{res}s", (request, response) =>
      @[res].index request, response

    # Create action
    app.post "/api/#{res}", (request, response) =>
      @[res].create request, response
