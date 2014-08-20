document.addEventListener('DOMContentLoaded', function(){
	console.log("loaded")

	svgBodyElements.abs()

	var numSets = $(".num_sets").data("sets")
	$( "#abs" ).css("opacity", numSets/(numSets + 0));

	svgBodyElements.chest()
	svgBodyElements.leftBisep()
	svgBodyElements.rightBisep()
	svgBodyElements.shoulders()
	svgBodyElements.thighs()
});


var svgBodyElements = (function (){

	return{
	  abs: function(){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/abs.svg")
			img.id="abs";
			svg.appendChild(img)
	  },
	   chest: function(){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/chest.svg")
			img.id="chest";
			svg.appendChild(img)
	  },
	  leftBisep: function(){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/leftBisep.svg")
			img.id="leftBisep";
			svg.appendChild(img)
	  },
	   rightBisep: function(){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/rightBisep.svg")
			img.id="rightBisep";
			svg.appendChild(img)
	  },
	   shoulders: function(){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/shoulders.svg")
			img.id="shoulders";
			svg.appendChild(img)
	  },
	   thighs: function(){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "/assets/thighs.svg")
			img.id="thighs";
			svg.appendChild(img)
	  }
  };
})();
