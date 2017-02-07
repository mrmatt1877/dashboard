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

function draw(data) {
    
    var oranges = data.end_time;
    console.log(oranges);
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
