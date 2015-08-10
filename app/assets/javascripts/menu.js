$(document).ready(function(){
  $(".menu_1").on('click', function(e) {
    e.preventDefault();
    $(".menu_1").removeClass('.active');
    $(this).addClass('.active');
  });
});
