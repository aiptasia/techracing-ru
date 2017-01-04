$(document).on('page:change', function() {
  $( ".modalClose" ).click(function() {
    $(".modal").css("opacity", 0);
    $(".modal").css("pointer-events", "none");
  });
});
