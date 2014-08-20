var time
$(document).ready(function() {

  $(".timer_button").on('click', function(event) {
    event.preventDefault();

    time = $(".rest_time").data("rest")
    $('#toggler').attr('checked', true)
    // console.log(time)
    incrementSums = timerColor(time, 190, 70, 127)
    colorUpDown($(".modal-box"), incrementSums[0], 290, "r")
    colorUpDown($(".modal-box"), incrementSums[0], 70, "g")
    colorUpDown($(".modal-box"), incrementSums[0], 127, "b")
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
        $('#toggler').attr('checked', false)
      }
      time--
    }

  });
});
$(".modal")

function timerColor(seconds, red, green, blue) {
  var value = seconds*1000
  var red_inc = Math.floor(value/red)
  var blue_inc = Math.floor(value/blue)
  var green_inc = Math.floor(value/green)
  return [red_inc, green_inc, blue_inc]
}

function colorUpDown(object, everyMilSecs, totalInc, color) {
  console.log(totalInc)
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


$(".modal-box").css("background-color","rgb(15,162,219)")

$.fn.getRGBBackgroundColor = function() {
  var rgb = $(this).css('background-color');
  var hex_rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
  return hex_rgb.slice(1,4).map(function(x){return parseInt(x)})
}
