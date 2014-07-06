# Navigation tabs
class NavTabsCtrl extends BaseCtrl
  @register 'Restangular', '$state'

  initialize: ->
    # Get all the tabs
    @Restangular.all('tabs').getList().then ((res) =>
      @$scope.tabs = res
    ), (err) =>
      @$log.error 'Tabs GET error', err


  # Create new tab
  save: (title) =>
    if title.length > 0
      @Restangular.one('tab').customPOST(title: title).then ((res) =>
        @$scope.tabs.push res
      ), (err) =>
        @$log.error 'Tabs POST error', err


  # Remove tab by id
  remove: (id, index) =>
    @Restangular.one("tab/#{id}").customDELETE().then ( =>
      @$scope.tabs.splice index, 1
    ), (err) =>
      @$log.error 'Tabs DELETE error', err