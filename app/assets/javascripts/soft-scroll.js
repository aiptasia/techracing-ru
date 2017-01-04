$(document).on('page:change', function() {
  $("#js-call-back").on('click', function(e) {
    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href')).offset().top}, 500);
    return false;
  });
});
