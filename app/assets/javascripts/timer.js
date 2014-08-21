

var time;
var currentTime;
var futureTime;
var realRestTime = 0;
var restPhases = 0;

$(document).ready(function() {

  $(".work_holder").on('click', function(event) {
    $(this).fadeOut('slow');
    setTimeout(function(){
      $(".timer_holder").fadeIn('slow')
      $(".exit_holder").fadeIn('slow')
      ;}, 500);
    $(".set_show").show('slow');
    $(".set_num").text("1");
  });

  $(".timer_button").on('click', function(event) {
    time = $(".rest_time").data("rest")
    currentTime =  new Date().getTime()
    // console.log(time)
    incrementSums = timerColor(time, 190, 70, 127)
    colorUpDown($(".modal-box"), incrementSums[0], 190, "r")
    colorUpDown($(".modal-box"), incrementSums[1], 70, "g")
    colorUpDown($(".modal-box"), incrementSums[2], 127, "b")

    var timeFunc = function(){
    var min = Math.floor(time/60);
    var secs = Math.floor((time-(60*min))/10);
    var sec = time%10;
    $(".minute").text(min);
    $(".seconds").text(secs);
    $(".second").val("").text(sec);
      timerBody(time)
    }

    var timer = setInterval( timeFunc, 1000);

    function timerBody(seconds) {
      // console.log(seconds)
      if (seconds === 0) {
        clearInterval(timer)
      }
      time--
    }
  });

  var sets = $(".set-amount").data("sets")

  $(".workout").on('click', function(event) {
    setTimeout(changeBack,1200);
    futureTime =  new Date().getTime();
    realRestTime += futureTime - currentTime;
    restPhases++
    console.log(restPhases)
    console.log(realRestTime)
    if (restPhases === sets){
      var finalRest = Math.floor(realRestTime/1000)
      $(".done-ex-input").show('slow');
      $(".content").hide();
      $("#exercise_history_rest").val(finalRest)
    }
    else {
    $(".set_num").val("").text(restPhases+1)
    }
  });
});


function timerColor(seconds, red, green, blue) {
  var value = seconds*1000
  var red_inc = Math.floor(value/red)
  var blue_inc = Math.floor(value/blue)
  var green_inc = Math.floor(value/green)
  return [red_inc, green_inc, blue_inc]
}
$("table").find("td")
function colorUpDown(object, everyMilSecs, totalInc, color) {
  // console.log(totalInc)
  totalInc--
  if (totalInc <= 0) {return}
  // console.log(object.getRGBBackgroundColor())
  if (color === "r"){
    var red = object.getRGBBackgroundColor()[0]+1
    var green = object.getRGBBackgroundColor()[1]
    var blue = object.getRGBBackgroundColor()[2]
  }
  else if (color === "g"){
    var red = object.getRGBBackgroundColor()[0]
    var green = object.getRGBBackgroundColor()[1]-1
    var blue = object.getRGBBackgroundColor()[2]
  }
  else if (color === "b"){
    var red = object.getRGBBackgroundColor()[0]
    var green = object.getRGBBackgroundColor()[1]
    var blue = object.getRGBBackgroundColor()[2]-1
  }
  object.css("background-color","rgb("+red+","+green+","+blue+")")
  setTimeout(function(){colorUpDown(object,everyMilSecs,totalInc, color)}, everyMilSecs)
}


function changeBack()
  {
    $(".modal-box").css("background-color","rgb(15,162,219)");
    time=0;
  }

$.fn.getRGBBackgroundColor = function() {
  var rgb = $(this).css('background-color');
  var hex_rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
  return hex_rgb.slice(1,4).map(function(x){return parseInt(x)})
}

