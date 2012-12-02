# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

################################ TWEAKABLE VARS ##########################################

@RankingCtrlr = ($scope, $http) ->
  $scope.ranking = client.get('current_ranking')
  $scope.render = (selector) ->
    client.render_graph selector, _.map client.get('current_ranking').data, (rank, name) ->
      { label: name, score: rank }
  if $('#ranking')
    $scope.render('#ranking')

$(document).ready ->
  $.widget( "custom.catcomplete", $.ui.autocomplete, {
    _renderMenu: ( ul, items ) ->
      that = this
      currentCategory = ""
      $.each items, ( index, item ) ->
        if ( item.category != currentCategory )
          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" )
          currentCategory = item.category
        that._renderItemData( ul, item )
  })
  roasters = client.get 'roasters'
  $("input#roaster_autocomplete").catcomplete(
    source: roasters
    focus: ( event, ui ) ->
      $('#roaster_autocomplete').val(ui.item.label)
      $('#ranking_coffee_type_id').val(ui.item.value)
      false
    select: ( event, ui ) ->
      $('#roaster_autocomplete').val(ui.item.label)
      $('#ranking_coffee_type_id').val(ui.item.value)
      false
  )

@MyRankingsCtlr = ($http, $scope) ->
  $http.get("/rankings.json").success (rankings) ->
    $scope.rankings = rankings
    $scope.groups = _.toArray(_.groupBy($scope.rankings, (a, b) ->
      Math.floor(b/3)))
    $scope.render_graphs = ->
      _.each $scope.rankings, (ranking) ->
        ranks = _.map(ranking.data, (v,k) -> {label: k, score: v})
        console.log ranks
        console.log ranking._id
        client.render_graph("#ranking_#{ranking._id}", ranks, bigRadius: 100)
