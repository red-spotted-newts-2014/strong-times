document.addEventListener('DOMContentLoaded', function(){
	console.log("loaded")

	svgBodyElements.abs()

});


var svgBodyElements = (function (){
	return{
	  abs: function(){
			var svg = document.querySelector(".svg-container")
			var img = document.createElement("img")
			img.setAttribute("src", "abs.svg")
			img.id="abs";
			svg.appendChild(img)
	  }
  };
})();