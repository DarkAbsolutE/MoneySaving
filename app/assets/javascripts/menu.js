$(document).ready(function(){
  $(".menu_1").on('click', function(e) {
    e.preventDefault();
    $(".menu_1").removeClass('.active');
    $(this).addClass('.active');
  });
});

$(function () {
  $("#title_employees1").animate({
    "margin-left": "18px"
  }, "slow");

  $(".nav li").on("click", function() {
    $(".nav li").removeClass("active");
    $(this).addClass("active");
  });
});

$(function () {
  $("#title_employees2").animate({
    "margin-left": "-18px"
  }, "slow");

  $(".nav li").on("click", function() {
    $(".nav li").removeClass("active");
    $(this).addClass("active");
  });
});
