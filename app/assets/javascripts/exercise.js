document.addEventListener('DOMContentLoaded', function(){
	console.log("loaded")
	var el = document.querySelector("#new_exercise")
	el.addEventListener("click", appendExercise)
});

function appendExercise(event){
	event.preventDefault();
	if (event.target.name === "commit"){
	var params = []
	var form = document.querySelector("#new_exercise")
	var fm = form.querySelectorAll("input")	
	appendExerciseTable(fm)
	// $.ajax({
 //    url:"/workouts/31/exercises",
 //    method:"POST",
 //    data: {name: fm[0].value, sets: fm[1].value, reps: fm[2].value, weight: fm[3].value, tempo: fm[4].value  },
 //    dataType: 'json'
 //  }).success(function(data) {
 //    appendExerciseTable(data);
 //  }).fail(function(){console.log("FAILURE")})
	}//end if statent
}

function appendExerciseTable(fm){
	var tbody = document.querySelector("#exercise_table_body");
	var tr = document.createElement("tr");
	for (var i = 2; i<fm.length - 1; i++){ 
 		var td = document.createElement("td");
 		var node = document.createTextNode(fm[i].value);
 		td.appendChild(node);
 		tr.appendChild(td);
	 }
	 tbody.appendChild(tr);
}