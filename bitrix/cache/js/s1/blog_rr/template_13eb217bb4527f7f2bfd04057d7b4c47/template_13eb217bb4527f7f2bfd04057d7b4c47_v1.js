
; /* Start:"a:4:{s:4:"full";s:48:"/local/templates/blog_rr/script.js?1579579404764";s:6:"source";s:34:"/local/templates/blog_rr/script.js";s:3:"min";s:0:"";s:3:"map";s:0:"";}"*/
$(function() {
    $(document).on("click", ".call-form", function(e) {
        e.preventDefault();

        let this_ = $(this);
        if(this_.hasClass("disabled"))
            return false;

        this_.addClass("disabled");

        $.ajax({
            url: "form.php",
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

    $(document).on("click", ".close_form", function(e) {
        e.preventDefault();
        $(".modal_background").hide().remove();
    });
});
/* End */
;; /* /local/templates/blog_rr/script.js?1579579404764*/
