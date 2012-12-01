# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

################################ TWEAKABLE VARS ##########################################

@RankingCtrlr = ($scope, $http) ->
  $scope.ranking = client.get('current_ranking')
  $scope.render = (selector) ->
    # Sizes
    bigRadius = 150
    pointRadius = 3
    right = bigRadius
    down = 350
    scoreRange = bigRadius * 0.8

    # Colors
    lightest = "#F2DFBC"
    light = "#C2BD86"
    mid = "#A84B3A"
    mid2 = "#8D9E71"
    dark = "#541E32"

    # Background
    num_lines = 6

    # Data

    MAX_VALUE = 10

    rankings = _.map client.get('current_ranking').data, (rank, name) ->
      { label: name, score: rank }

    ###########################################elect(selector).append("svg") #############################################

    console.log rankings
    svg = d3.select(selector).append("svg")
      
    edgePosition = (r, rad, score) ->
      inset = r - score
      y = inset * Math.sin(rad)
      x = inset * Math.cos(rad)
      x: x + right
      y: y + down

    points = rankings.length
    TOTAL_RADIANS = 2 * Math.PI
      
    nodes = for i in [0..points-1]
      rad = TOTAL_RADIANS / points * i
      score = (MAX_VALUE - rankings[i].score) / MAX_VALUE * bigRadius;
      node = edgePosition(bigRadius, rad, score)
      x: node.x
      y: node.y
      r: pointRadius
      color: mid2
        
    # Background

    background = for i in [0..num_lines]
      distance = bigRadius / num_lines * i
      r: distance
      
    svg.selectAll('background')
      .data(background)
      .enter().append('circle')
      .attr('r', (d) -> d.r)
      .attr('cx', right)
      .attr('cy', down)
      .style('fill', 'none')
      .style('stroke', lightest)
      .style('stroke-width', 0.2)
      
    # Lines                            
    last = nodes[nodes.length - 1]
    neighbors = [last].concat(nodes) # to close the loop
    svg.selectAll("line")
      .data(nodes).enter()
      .append("line")
      .attr("x1", (d) -> d.x)
      .attr("y1", (d) -> d.y)
      .attr("x2", (d, i) -> neighbors[i].x)
      .attr("y2", (d, i) -> neighbors[i].y)
      .style("stroke", mid)
      .style("stroke-width", 1.5)

    # Dots
    svg.selectAll("vertex")
      .data(nodes)
      .enter().append("circle")
      .attr("r", (d) -> d.r)
      .attr("cx", (d) -> d.x)
      .attr("cy", (d) -> d.y)
      .style("fill", (d) -> d.color)

    # labels
      
    labels = for i in [0..points-1]
      rad = (TOTAL_RADIANS / points) * i
      node = edgePosition(bigRadius, rad, 0)
      x: node.x
      y: node.y
    
    svg.selectAll("text")
      .data(labels).enter()
      .append("text")
      .style("fill", light)
      .text (d,i) ->
        rankings[i].label
      .attr("x", (d) -> d.x)
      .attr("y", (d) -> d.y)
      .attr("text-anchor", "middle")
    true
  $scope.render('#ranking')
