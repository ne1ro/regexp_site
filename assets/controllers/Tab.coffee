######
#  Tab controller
######
class TabCtrl extends BaseCtrl
  @register 'Restangular', '$stateParams'

  initialize: ->
    # Get tab by id
    @Restangular.one("tab/#{@$stateParams.id}").get().then ((res) =>
      console.log res
      @$scope.tab = res
    ), (err) =>
      @$log.debug 'Tab GET error', err
