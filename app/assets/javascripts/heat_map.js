document.addEventListener('DOMContentLoaded', function(){
	console.log("loaded")

	// svgBodyElements.abs()
	var muscle = document.querySelector("#viewMuscles")
	muscle.addEventListener("click", renderMuscleGroup)
});

var renderMuscleGroup = function (event) {
	var muscles = document.querySelector("#muscle_table_body")

	for(var x = 0; x < muscles.rows.length; x++){
		for (var i = 0; i < 2; i++) {

			var numSets = muscles.rows[x].cells[1].innerHTML
			var expSets = numSets/ (numSets )

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
			}
		}
	}
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
