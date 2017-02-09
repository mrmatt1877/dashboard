 $.ajax({
       type: "GET",
       contentType: "application/json; charset=utf-8",
       url: 'data',
       dataType: 'json',
       success: function (json_data) {
           draw(json_data);
       },
       error: function (result) {
           error();
       }
   });

function draw(json_data) {
    
    
    var oranges2 =[];
    for (var i = 0; i < json_data.length; i++){
        var t = json_data[i].start_time.split(/[- T : Z]/);
        var t2 = json_data[i].end_time.split(/[- T : Z]/);

        // Apply each element to the Date function
        var secondsTwo = (t[3] * 60) + (t[4] * 1);
        var secondsOne = (t2[3] * 60) + (t2[4] * 1);
        
        var f = json_data[i].date.split(/[-]/);
        var theDay = f[2] + 11
        console.log( theDay );
        
        var completionTime = (secondsOne - secondsTwo);
        oranges2 += '{"completion_time": ' + '"' + completionTime + '"' + " , " + '"date": ' + '"' + theDay + '"' + "}, ";
    }
    console.log( oranges2 );
    
    
                function InitChart() {
                    var oranges = [
                        {"completion_time": "400" , "date": "2911"},
                        {"completion_time": "650" , "date": "0811"},
                        {"completion_time": "720" , "date": "1911"},
                        {"completion_time": "540" , "date": "1511"},
                        {"completion_time": "600" , "date": "2911"},
                        {"completion_time": "690" , "date": "811"},
                        {"completion_time": "120" , "date": "3911"},
                        {"completion_time": "540" , "date": "0511"},
                        {"completion_time": "625" , "date": "2211"},
                        {"completion_time": "610" , "date": "0211"},
                        {"completion_time": "120" , "date": "2211"},
                        {"completion_time": "140" , "date": "2511"},
                        {"completion_time": "620" , "date": "1911"},
                        {"completion_time": "60" , "date": "1811"},
                        {"completion_time": "120" , "date": "1911"},
                        {"completion_time": "540" , "date": "1511"}];
                    
                    var vis = d3.select("#graph"),
                        WIDTH = 500,
                        HEIGHT = 500,
                        MARGINS = {
                            top: 20,
                            right: 20,
                            bottom: 20,
                            left: 50
                        },
                        xScale = d3.scale.linear().range([MARGINS.left, WIDTH - MARGINS.right]).domain([60, 800]),
                        yScale = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([500, 3000]),
                        xAxis = d3.svg.axis()
                        .scale(xScale),
                        yAxis = d3.svg.axis()
                        .scale(yScale)
                        .orient("left");
                    
                    vis.append("svg:g")
                        .attr("class", "x axis")
                        .attr("transform", "translate(0," + (HEIGHT - MARGINS.bottom) + ")")
                        .call(xAxis);
                    vis.append("svg:g")
                        .attr("class", "y axis")
                        .attr("transform", "translate(" + (MARGINS.left) + ",0)")
                        .call(yAxis);
                    var lineGen = d3.svg.line()
                        .x(function(d) {
                            return xScale(d.completion_time);
                        })
                        .y(function(d) {
                            return yScale(d.date);
                        })
                        .interpolate("basis");
                    vis.append('svg:path')
                        .attr('d', lineGen(oranges))
                        .attr('stroke', 'green')
                        .attr('stroke-width', 2)
                        .attr('fill', 'none');
                }
                InitChart();
    
    
    
    /*var color = d3.scale.category20b();
    var width = 420,
        barHeight = 20;
 
    var x = d3.scale.linear()
        .range([0, width])
        .domain([0, d3.max(data)]);
 
    var chart = d3.select("#graph")
        .attr("width", width)
        .attr("height", barHeight * (data.end_time - data.start_time));
 
    var bar = chart.selectAll("g")
        .data(data)
        .enter().append("g")
        .attr("transform", function (d, i) {
                  return "translate(0," + i * barHeight + ")";
              });
 
    bar.append("rect")
        .attr("width", x)
        .attr("height", barHeight - 1)
        .style("fill", function (d) {
                   return color(d)
               })
 
    bar.append("text")
        .attr("x", function (d) {
                  return x(d) - 10;
              })
        .attr("y", barHeight / 2)
        .attr("dy", ".35em")
        .style("fill", "white")
        .text(function (d) {
                  return d;
              });*/
}
 
function error() {
    console.log("error")
}
