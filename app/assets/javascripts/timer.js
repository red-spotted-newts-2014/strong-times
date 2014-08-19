
var seconds = 10;

function timerBody() {
  seconds--
 console.log(seconds)
if (seconds === 0) {
  clearInterval(timer)
}
}

timer = setInterval( timerBody, 1000
  )
