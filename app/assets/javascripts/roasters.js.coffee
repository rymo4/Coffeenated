# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@RoastersCtlr = ($http, $scope) ->
  $http.get("/roasters/#{client.get('current_roaster')._id}.json").success (roaster) ->
    $scope.roaster = roaster
    $scope.top_coffees = _.sortBy($scope.roaster.coffee_types, (coffee) ->
      1 / coffee.average_rating
    ).slice(0,3)

    $scope.current_coffee = $scope.roaster.coffee_types[0]
    $scope.coffee_groups = _.toArray(_.groupBy($scope.roaster.coffee_types, (a, b) ->
      Math.floor(b/3)
    ))

    $scope.average_rankings = ->
      avg = {}
      _.each $scope.roaster.coffee_types, (coffee) ->
        avg[coffee._id] = coffee.average_rankings
      avg
    $scope.show_coffee = (coffee) ->
      $scope.current_coffee = coffee
      data = _.find($scope.average_rankings(), (obj, id) -> id == coffee._id)
      ranks = _.map data, (v, k) ->
        {label: k, score: v}
      console.log ranks
      selector = '#average_ranking'
      $(selector).html('')
      client.render_graph(selector, ranks, bigRadius: 80)

@RoastersCtlr.$inject = ['$http', '$scope']
