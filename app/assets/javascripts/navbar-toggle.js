$(document).on('page:change', function() {
  var btnNavbarToggle = $('#js-navbar-toggle');

  btnNavbarToggle.on('click', function(e) {
    $('#js-navbar-nav').animate({height: 'toggle'});

    /*$('#js-navbar-mobile--horz').animate({
      left: "0px"
    }, 200);

    $('body').animate({
      left: "285px"
    }, 200);*/
  });
});
