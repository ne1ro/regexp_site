######
#  Tab controller
######
class TabCtrl extends BaseCtrl
  @register 'Restangular', '$stateParams'

  initialize: ->
    # Get tab by id
    @Restangular.one("tab/#{@$stateParams.id}").get().then ((res) =>
      @$scope.tab = res
    ), (err) =>
      @$log.error 'Tab GET error', err


  # Search web page by regexp
  search: (data) ->
    # Put data
    @Restangular.one("tab/#{data._id}").customPUT(data).then ((res) =>
      if res?
        # Get results by query
        @Restangular.one('result').customPOST(data).then ((results) =>
          if results.length > 0
            @$scope.results = results
        ), (err) =>
          @$log.error 'Result POST error', err
    ), (err) =>
      @$log.error 'Tab PUT error', err
