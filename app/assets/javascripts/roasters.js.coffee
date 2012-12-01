# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@RoastersCtlr = ($http, $scope) ->
  $http.get("/roasters/#{client.get('current_roaster')._id}.json").success (roaster) ->
    console.log 'hi'
    $scope.roaster = roaster
    $scope.coffee_types = $scope.roaster.coffee_types
    $scope.coffee_groups = _.toArray(_.groupBy($scope.coffee_types, (a, b) ->
      Math.floor(b/3)
    ))


    $scope.average_rankings = ->
      avg = {}
      _.each $scope.coffee_types, (coffee) ->
        avg[coffee._id] = {}
        _.reduce coffee.rankings, (ranking) ->
          _.each ranking.data, (taste, score) ->
            avg[coffee._id][taste] += score
          , 0
      _.map avg, (coffee_if, rankings) ->
        _.map avg, (taste, score) ->
          avg[taste] = score / $scope.coffee.rankings.size
    $scope.current_coffee = {}
    $scope.show_coffee = (id) ->
      $scope.current_coffee = id
