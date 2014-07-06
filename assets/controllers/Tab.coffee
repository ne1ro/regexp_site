######
#  Tab controller
######
class TabCtrl extends BaseCtrl
  @register 'Restangular', '$stateParams', '$rootScope'

  initialize: ->
    @$scope.limit = 10
    @$scope.page = 0

    # Get tab by id
    @Restangular.one("tab/#{@$stateParams.id}").get().then ((res) =>
      @$scope.tab = res
      if res.results.length > 0
        @$scope.tab.results = JSON.parse res.results[0].result
    ), (err) =>
      @$log.error 'Tab GET error', err


  # Search web page by regexp
  search: (tabData) ->
    # Put data
    data = _.pick tabData, 'regex', 'url', 'title', '_id'
    @Restangular.one("tab/#{data._id}").customPUT(data).then ((res) =>
      if res?
        # Get results by query
        @Restangular.one('result').customPOST(data).then ((tab) =>
          @$scope.tab = tab
          if tab.results.length > 0
            @$scope.tab.results = JSON.parse tab.results[0].result
          @$rootScope.$emit 'updateTab'
        ), (err) =>
          @$log.error 'Result POST error', err
    ), (err) =>
      @$log.error 'Tab PUT error', err
