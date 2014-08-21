document.addEventListener('DOMContentLoaded', function(){
	console.log("loaded")

	var muscle = document.querySelector(".viewMuscles")
	muscle.addEventListener("click", renderMuscleGroup)
});

var renderMuscleGroup = function (event) {
	var muscles = document.querySelector("#muscle_table_body")
	var actual = []
	for(var x = 0; x < muscles.rows.length; x++){
			actual.push(parseInt(muscles.rows[x].cells[1].innerHTML))
		for (var i = 0; i < 2; i++) {
			var numSets = muscles.rows[x].cells[1].innerHTML

			var expSets = Math.exp(numSets/10)/ (Math.exp(numSets/10) + 1)
			console.log(actual)

			if (muscles.rows[x].cells[i].innerHTML === "chest"){
				svgBodyElements.chest(expSets)
			}else if(muscles.rows[x].cells[i].innerHTML === "shoulders"){
				svgBodyElements.shoulders(expSets)
			}else if(muscles.rows[x].cells[i].innerHTML === "thighs"){
				svgBodyElements.thighs(expSets)
			}else if(muscles.rows[x].cells[i].innerHTML === "calves"){
				svgBodyElements.calves(expSets)
			} else if(muscles.rows[x].cells[i].innerHTML === "glutes"){
				svgBodyElements.glutes(expSets)
			}	else if(muscles.rows[x].cells[i].innerHTML === "triceps"){
				svgBodyElements.triceps(expSets)
			}else if (muscles.rows[x].cells[i].innerHTML === "back"){
				svgBodyElements.back(expSets)
			}else if (muscles.rows[x].cells[i].innerHTML === "abs"){
				svgBodyElements.abs(expSets)
			}else if(muscles.rows[x].cells[i].innerHTML === "biceps"){
				svgBodyElements.leftBisep(expSets)
				svgBodyElements.rightBisep(expSets)
			}
		}
	}

console.log(actual)
$(function () {

    $('#line-chart').highcharts({

        chart: {
            polar: true,
            type: 'line'
        },

        title: {
            text: 'Workout Trend Report',
            x: -80
        },

        pane: {
            size: '90%'
        },

        xAxis: {
            categories: ['Abs', 'Squats', 'Biceps', 'Glutes',
                    'Calves', 'Chest'],
            tickmarkPlacement: 'on',
            lineWidth: 0
        },

        yAxis: {
            gridLineInterpolation: 'polygon',
            lineWidth: 0,
            min: 0
        },

        // tooltip: {
        //     shared: true,
        //     pointFormat: '<span style="color:{series.color}">{series.name}: <b>${point.y:,.0f}</b><br/>'
        // },

        legend: {
            align: 'right',
            verticalAlign: 'top',
            y: 70,
            layout: 'vertical'
        },

        series: [{
            name: 'Actual',
            data: actual,
            pointPlacement: 'on'
        }, {
            name: 'Forcast',
            data: [6, 4, 2, 10, 20],
            pointPlacement: 'on'
        }]

    });
});
}

var svgBodyElements = (function (){

	return{
	  abs: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/abs.svg")
			img.id="abs";
			img.style.opacity = expSets
			svg.appendChild(img)
	  },
	   chest: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/chest.svg")
			img.id="chest";
			img.style.opacity = expSets
			svg.appendChild(img)
	  },
	  leftBisep: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/leftBisep.svg")
			img.id="leftBisep";
			img.style.opacity = expSets
			svg.appendChild(img)
	  },
	   rightBisep: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/rightBisep.svg")
			img.id="rightBisep";
			img.style.opacity = expSets
			svg.appendChild(img)
	  },
	   shoulders: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/shoulders.svg")
			img.id="shoulders";
			img.style.opacity = expSets
			svg.appendChild(img)
	  },
	   thighs: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/thighs.svg")
			img.id="thighs";
			img.style.opacity = expSets
			svg.appendChild(img)
	  },
	   back: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/back.svg")
			img.id="back";
			img.style.opacity = expSets
			svg.appendChild(img)
	  },
	   calves: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/calves.svg")
			img.id="calves";
			img.style.opacity = expSets
			svg.appendChild(img)
	  },
	   glutes: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/glutes.svg")
			img.id="glutes";
			img.style.opacity = expSets
			svg.appendChild(img)
	  },
	  triceps: function(expSets){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/triceps.svg")
			img.id="triceps";
			img.style.opacity = expSets
			svg.appendChild(img)
	  }
	}
})();
