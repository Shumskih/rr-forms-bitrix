
; /* Start:"a:4:{s:4:"full";s:48:"/local/templates/blog_rr/script.js?1579604337896";s:6:"source";s:34:"/local/templates/blog_rr/script.js";s:3:"min";s:0:"";s:3:"map";s:0:"";}"*/
$(function() {
    // вызываем форму
    $(document).on("click", ".call_form", function(e) {
        e.preventDefault();// отменяем переход по ссылке

        var th= $(this);
        if(th.hasClass("disabled"))
            return false;

        th.addClass("disabled");

        $.ajax({
            url: "/include/",
            type: "POST",
            data: th.serialize(),
            success: function(data) {
                $("body").append(data);
                $(".modal_background").css({"display":"flex"});
                $(".modal_form").fadeIn();
                th.removeClass("disabled");
            }
        });
    });

    // а это для закрытия формы
    $(document).on("click", ".close_form", function(e) {
        e.preventDefault();
        $(".modal_background").hide();
    });
});
/* End */
;; /* /local/templates/blog_rr/script.js?1579604337896*/
