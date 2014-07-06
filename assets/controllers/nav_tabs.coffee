# Navigation tabs
class NavTabsCtrl extends BaseCtrl
  @register 'Restangular'

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
        @$log.debug 'res', res
        @$scope.tabs.push
          title: title
      ), (err) =>
        @$log.error 'Tabs POST error', err