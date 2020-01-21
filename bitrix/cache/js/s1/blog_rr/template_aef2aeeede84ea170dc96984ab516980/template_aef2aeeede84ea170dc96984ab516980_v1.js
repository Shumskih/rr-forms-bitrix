
; /* Start:"a:4:{s:4:"full";s:49:"/local/templates/blog_rr/script.js?15795996221386";s:6:"source";s:34:"/local/templates/blog_rr/script.js";s:3:"min";s:0:"";s:3:"map";s:0:"";}"*/
$(function() {
    // вызываем форму
    $(document).on("click", ".call_form", function(e) {
        e.preventDefault();// отменяем переход по ссылке

        var this_ = $(this);
        if(this_.hasClass("d-none"))
            return false;

        this_.addClass("d-none");

        $.ajax({
            url: this.action,
            type: "POST",
            data: {},
            success: function(data) {
                $("body").append(data);
                $(".modal_background").css({"display":"flex"});
                $(".modal_form").fadeIn();
                this_.removeClass("disabled");
            }
        });
    });

    // а это для закрытия формы
    $(document).on("click", ".close_form", function(e) {
        e.preventDefault();
        $(".modal_background").hide().remove();
    });
});



$(".popup-form").submit(function () {
    let th = $(this);
    $.ajax({
        type: "POST",
        url: this.action,
        data: th.serialize()
    }).done(function () {
        $("#popup-thanks").fadeIn();
        $("#popup-call").hide();
        setTimeout(function () {
            th.trigger("reset");
        }, 1000);
    });
    return false;
});

$("#popup-call .popup-block").on("click", ".call_form", function () {
    e.preventDefault();
});
/* End */
;; /* /local/templates/blog_rr/script.js?15795996221386*/
