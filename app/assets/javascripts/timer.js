var time
$(document).ready(function() {

  $(".timer_button").on('click', function(event) {
    event.preventDefault();

    time = $(".rest_time").data("rest")
    $('#toggler').attr('checked', true)
    console.log(time)

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
      console.log(seconds)
      if (seconds === 0) {
        clearInterval(timer)
        $('#toggler').attr('checked', false)
      }
      time--
    }

  });
});
$(".modal")

function timerColor(seconds, red, blue, green, obj) {
  var value = seconds*1000
  var red_inc = Math.floor(value/red)
  var blue_inc = Math.floor(value/blue)
  var green_inc = Math.floor(value/green)
  return [red_inc, blue_inc, green_inc]
}

function redUp(milSecs, totalInc) {


  setTimeout(redUp, milSecs)
}
function greenDown(milSecs, totalDec) {

}
function blueDown(milSecs, totalDec) {

}


$(".modal-box").css("background-color","rgb(15,162,219)")

$.fn.getHexBackgroundColor = function() {
  var rgb = $(this).css('background-color');
  var hex_rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
  return hex_rgb.slice(1,4).map(function(x){return parseInt(x)})
}
