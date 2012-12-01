# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@RoastersCtlr = ($http, $scope) ->
  $http.get("/roasters/#{client.get('current_roaster')._id}.json").success (roaster) ->
    $scope.roaster = roaster
    $scope.coffee_types = $scope.roaster.coffee_types
    $scope.coffee_groups = _.toArray(_.groupBy($scope.coffee_types, (a, b) ->
      Math.floor(b/3)
    ))

    $scope.average_rankings = ->
      avg = {}
      _.each $scope.roaster.coffee_types, (coffee) ->
        avg[coffee._id] = {}
        _.each(coffee.rankings, (ranking) ->
          _.each ranking.data, (score, taste) ->
            avg[coffee._id][taste] = 0 unless avg[coffee._id][taste]
            avg[coffee._id][taste] += score
          , 0)
      _.each avg, (ranks, coffee_id) ->
        console.log coffee_id
        _.each avg[coffee_id], (score, taste) ->
          num_rankings = _.find($scope.roaster.coffee_types, (coffee) ->
            coffee._id == coffee_id
          ).rankings.length
          console.log num_rankings
          avg[coffee_id][taste] = avg[coffee_id][taste] / num_rankings
      avg
    $scope.current_coffee = {}
    $scope.show_coffee = (id) ->
      $scope.current_coffee = id
