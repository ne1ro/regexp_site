app = angular.module("spaApp", [
  'ui.router'
  'restangular'
]).config ($stateProvider, $urlRouterProvider, $locationProvider, RestangularProvider) ->
  # Set HTML5 route mode
  $locationProvider.html5Mode true

  # 404
  $urlRouterProvider.otherwise "/"

  # API base URL
  RestangularProvider.setBaseUrl '/api'

  # Configure routes
  $stateProvider.state("index",
    url: "/",
    templateUrl: "views/main.html",
    controller: 'MainCtrl'
  )