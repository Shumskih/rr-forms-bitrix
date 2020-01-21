$(function() {
    $(document).on("click", ".call_form", function(e) {
        e.preventDefault();

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

    $(document).on("click", ".close_form", function(e) {
        e.preventDefault();
        $(".modal_background").hide();
    });
});