######
#  Routes and resources config
######
module.exports = (app) ->
  # Extend app with the CRUD actions
  tabCtrl = require "../controllers/tabs"
  resultCtrl = require "../controllers/results"

  # Show action
  app.get "/api/tab/:id", (request, response) =>
    tabCtrl.show request, response

  # Update action
  app.put "/api/tab/:id", (request, response) =>
    tabCtrl.update request, response

  # Destroy action
  app.delete "/api/tab/:id", (request, response) =>
    tabCtrl.destroy request, response

  # Index action
  app.get "/api/tabs", (request, response) =>
    tabCtrl.index request, response

  # Create action
  app.post "/api/tab", (request, response) =>
    tabCtrl.create request, response

  # Create results
  app.post "/api/result", (request, response) =>
    resultCtrl.create request, response

  # Show results
  app.get "/api/results", (request, response) =>
    resultCtrl.index request, response
