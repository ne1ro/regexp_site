# Navigation tabs
class NavTabsCtrl extends BaseCtrl
  @register 'Restangular', '$state', '$rootScope'

  # Get all the tabs
  _getTabs: =>
    @Restangular.all('tabs').getList().then ((res) =>
      @$scope.tabs = res
    ), (err) =>
      @$log.error 'Tabs GET error', err


  initialize: ->
    @_getTabs()

    # Update tab
    @$rootScope.$on 'updateTab', (event, tab) =>
      @_getTabs()


  # Create new tab
  save: (title) =>
    if title.length > 0
      @Restangular.one('tab').customPOST(title: title).then ((res) =>
        @$scope.tabs.push res
        @$state.go 'tab', {id: res._id}
      ), (err) =>
        @$log.error 'Tabs POST error', err


  # Remove tab by id
  remove: (id, index) =>
    @Restangular.one("tab/#{id}").customDELETE().then ( =>
      @$scope.tabs.splice index, 1
      @$state.go 'index'
    ), (err) =>
      @$log.error 'Tabs DELETE error', err
