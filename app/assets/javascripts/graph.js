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
    
    console.log(json_data);
    
                function InitChart() {
                    
                    var width = 900,
                        height = 600,
                        padding = 100;
                        
                    // create an svg container
                    var vis = d3.select("#graph").
                        append("svg:svg")
                            .attr("width", width)
                            .attr("height", height);
                            
                    // define the y scale  (vertical)
                    var yScale = d3.scale.linear()
            	        .domain([10, 1000])    // values between 0 and 100
            		.range([height - padding, padding]);   // map these to the chart height, less padding.  
                             //REMEMBER: y axis range has the bigger number first because the y value of zero is at the top of chart and increases as you go down.
            		    
                    // define the x scale (horizontal)
                    var mindate = new Date(2017,0,1),
                        maxdate = new Date(2017,12,31);
                        
                    var xScale = d3.time.scale()
            	        .domain([mindate, maxdate])    // values between for month of january
            		.range([padding, width - padding * 2]);   // map these the the chart width = total width minus padding at both sides
            		    
            	
                    // define the y axis
                    var yAxis = d3.svg.axis()
                        .orient("left")
                        .scale(yScale);
                    
                    // define the y axis
                    var xAxis = d3.svg.axis()
                        .orient("bottom")
                        .scale(xScale);
                        
                    // draw y axis with labels and move in from the size by the amount of padding
                    vis.append("g")
                        .attr("transform", "translate("+padding+",0)")
                        .call(yAxis);
            
                    // draw x axis with labels and move to the bottom of the chart area
                    vis.append("g")
                        .attr("class", "xaxis")   // give it a class so it can be used to select only xaxis labels  below
                        .attr("transform", "translate(0," + (height - padding) + ")")
                        .call(xAxis);
                        
                    // now rotate text on x axis
                    // solution based on idea here: https://groups.google.com/forum/?fromgroups#!topic/d3-js/heOBPQF3sAY
                    // first move the text left so no longer centered on the tick
                    // then rotate up to get 45 degrees.
                   vis.selectAll(".xaxis text")  // select all the text elements for the xaxis
                      .attr("transform", function(d) {
                          return "translate(" + this.getBBox().height*-2 + "," + this.getBBox().height + ")rotate(-45)";
                    });
                    
                    
                    var lineGen = d3.svg.line()
                        .x(function(d) {
                            var dt = new Date(d.date)
                            return xScale(dt);
                        })
                        .y(function(d) {
                            return yScale(d.completion_time);
                        })
                        .interpolate("basis");
                    vis.append('svg:path')
                        .attr('d', lineGen(json_data))
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
