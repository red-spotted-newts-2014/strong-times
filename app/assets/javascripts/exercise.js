document.addEventListener('DOMContentLoaded', function(){
	console.log("loaded")
// 	var el = document.querySelector("#new_exercise")
// 	el.addEventListener("click", appendExercise)


// function appendExercise(event){
// 	 event.preventDefault();
// 	if (event.target.name === "commit"){
// 	var params = []
// 	var form = document.querySelector("#new_exercise")
// 	var fm = form.querySelectorAll("input")
// 	// appendExerciseTable(fm)
// 	console.log(fm)
// 	 var block = {exercise:{name: fm[2].value, sets: fm[3].value, reps: fm[4].value, weight: fm[5].value, tempo: fm[6].value  }}
// 	 $.ajax({
//     url:"/workouts/2/exercises",
//      method:"POST",
//      data: block,
//      dataType: 'json'
//    }).done(function(data) {
//      appendExerciseTable(fm);
//   }).fail(function(){console.log("FAILURE")})
// 	}//end if statement
// }

// function appendExerciseTable(fm){
// 	var tbody = document.querySelector("#exercise_table_body");
// 	var tr = document.createElement("tr");
// 	for (var i = 2; i<fm.length - 1; i++){
//  		var td = document.createElement("td");
//  		var node = document.createTextNode(fm[i].value);
//  		td.appendChild(node);
//  		tr.appendChild(td);
// 	 }
// 	 tbody.appendChild(tr);
// }

$(function () {
    $('#heatmap').highcharts({
        chart: {
            type: 'areaspline'
        },
        title: {
            text: 'Average fruit consumption during one week'
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            verticalAlign: 'top',
            x: 150,
            y: 100,
            floating: true,
            borderWidth: 1,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
        },
        xAxis: {
            categories: [
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday'
            ],
            plotBands: [{ // visualize the weekend
                from: 4.5,
                to: 6.5,
                color: 'rgba(68, 170, 213, .2)'
            }]
        },
        yAxis: {
            title: {
                text: 'Fruit units'
            }
        },
        tooltip: {
            shared: true,
            valueSuffix: ' units'
        },
        credits: {
            enabled: false
        },
        plotOptions: {
            areaspline: {
                fillOpacity: 0.5
            }
        },
        series: [{
            name: 'John',
            data: [3, 4, 3, 5, 4, 10, 12]
        }, {
            name: 'Jane',
            data: [1, 3, 4, 3, 3, 5, 4]
        }]
    });
});
 });
