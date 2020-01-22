
; /* Start:"a:4:{s:4:"full";s:48:"/local/templates/blog_rr/script.js?1579599262476";s:6:"source";s:34:"/local/templates/blog_rr/script.js";s:3:"min";s:0:"";s:3:"map";s:0:"";}"*/
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
;; /* /local/templates/blog_rr/script.js?1579599262476*/
