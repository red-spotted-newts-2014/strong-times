var time
$(document).ready(function() {

  $(".timer_button").on('click', function(event) {
    event.preventDefault();

    time = $(".timer_input").val()

    var timeFunc = function(){timerBody(time)}
    var timer = setInterval( timeFunc, 1000)
    function timerBody(seconds) {
      if (seconds === 0) {
        clearInterval(timer)
      }
      time--
    }
  });
});

