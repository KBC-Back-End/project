/**
 * 
 */
 
 var dday = new Date("November 18, 2021, 0:00:00").getTime();

setInterval(function() {
  var today = new Date().getTime();
  var gap = dday - today;
  var day = Math.ceil(gap / (1000 * 60 * 60 * 24));
  var hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
  var sec = Math.ceil((gap % (1000 * 60)) / 1000);

  document.getElementById("count").innerHTML = "2022 수능"+"<br>"+"D-DAY " +"<br>"+ day + "일 " + hour + "시간 " + min + "분 " + sec + "초 ";
}, 1000);