app = angular.module("spaApp", [
  'ui.router'
  'restangular'
]).config(($stateProvider, $urlRouterProvider, $locationProvider, RestangularProvider) ->
  # Set HTML5 route mode
  # $locationProvider.html5Mode true

  # 404
  $urlRouterProvider.otherwise "/"

  # API base URL
  RestangularProvider.setBaseUrl '/api'

  # Configure routes
  $stateProvider.state("index"
    url: "/"
    templateUrl: "views/main.html"
    controller: 'MainCtrl'
  ).state("tab"
    url: "/tab/:id"
    templateUrl: "views/tab.html"
    controller: 'TabCtrl'
  )

).run ($rootScope, $state) ->
  # Set active state param
  $rootScope.$on '$stateChangeSuccess', (event, state, params) ->
    $rootScope.state = state
