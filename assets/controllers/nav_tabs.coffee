# Navigation tabs
class NavTabsCtrl extends BaseCtrl
  @register 'Restangular'

  initialize: ->
    @$scope.tabs = []