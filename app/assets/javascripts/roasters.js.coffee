# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@RoastersCtlr = ($http, $scope) ->
  $http.get("/roasters/#{client.get('current_roaster')._id}.json").success (roaster) ->
    $scope.roaster = roaster
    $scope.roaster.coffee_types = _.map $scope.roaster.coffee_types, (coffee, v) ->
      avg = _.reduce(
        coffee.rankings,
        (sum, ranking) -> sum + ranking.overall,
        0)
      avg = (avg / coffee.rankings.length).toFixed(2)
      _.defaults coffee, average_rating: avg

    $scope.current_coffee = $scope.roaster.coffee_types[0]
    $scope.coffee_groups = _.toArray(_.groupBy($scope.roaster.coffee_types, (a, b) ->
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
    $scope.show_coffee = (coffee) ->
      $scope.current_coffee = coffee
      data = _.find($scope.average_rankings(), (obj, id) -> id == coffee._id)
      ranks = _.map data, (v, k) ->
        {label: k, score: v}
      console.log ranks
      selector = '#average_ranking'
      $(selector).html('')
      client.render_graph(selector, ranks, bigRadius: 80)

$('#coffee_details').css({
  width: 'auto',
  'margin-left': ->
    -($(this).width() / 2)
})
