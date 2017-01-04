$(document).on('page:change', function() {
  $("#feedback-validate").validate({
    rules:{
      name:{
        required: true,
      },
      email:{
        required: true,
        email: true,
      },
      message:{
        required: true,
      },
    },
    messages:{
      name:{
        required: "Пожалуйста, укажите свое имя",
      },
      email:{
        required: "Пожалуйста, укажите свой e-mail",
        email: "Пожалуйста, введите корректный e-mail",
      },
      message:{
        required: "Пожалуйста, введите текст сообщения",
      },
    }
  });
});

$(document).on('page:change', function() {
  $("#call-back-validate").validate({
    rules:{
      name:{
        required: true,
      },
      phone:{
        required: true,
      },
    },
    messages:{
      name:{
        required: "",
      },
      phone:{
        required: " ",
      },
    }
  });
});

$(document).on('page:change', function() {
  $("#js-price-request-validate").validate({
    rules:{
      name:{
        required: true,
      },
      phone:{
        required: true,
      },
      vin:{
        required: true,
      },
    },
    messages:{
      name:{
        required: "",
      },
      phone:{
        required: "",
      },
      vin:{
        required: "",
      },
    }
  });
});
