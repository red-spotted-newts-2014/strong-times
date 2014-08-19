document.addEventListener('DOMContentLoaded', function(){
	console.log("loaded")

	svgBodyElements.abs()
	var numSets = $(".num_sets").data("sets")
	$( "#abs" ).css("opacity", numSets/(numSets + 1));

});


var svgBodyElements = (function (){

	return{
	  abs: function(){
			var svg = document.querySelector(".svg-container")
			console.log(svg)
			var img = document.createElement("img")

			img.setAttribute("src", "/assets/abs.svg")
			img.id="abs";


			svg.appendChild(img)
			console.log(img)
	  }
  };
})();
