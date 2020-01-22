$(function() {
    $(document).on("click", ".call_form", function(e) {
        e.preventDefault();

        var th= $(this);
        if(th.hasClass("disabled"))
            return false;

        th.addClass("disabled");

        $.ajax({
            url: "/i/",
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

$(function() {
    // вызываем форму
    $(document).on("click", ".call_form2", function(e) {
    	e.preventDefault();// отменяем переход по ссылке

    	var this_ = $(this);
    	if(this_.hasClass("disabled"))
    		return false;
        
        this_.addClass("disabled");

        $.ajax({
            url: "/ajax/index.php",
            type: "POST",
            data: {},
            success: function(data) {
            	$("body").append(data);
            	$(".modal_background2").css({"display":"flex"});
            	$(".modal_form2").fadeIn();
        	this_.removeClass("disabled");
            }
        });
    });

    // а это для закрытия формы
    $(document).on("click", ".close_form2", function(e) {
        e.preventDefault();
        $(".modal_background2").hide().remove();
    });
});