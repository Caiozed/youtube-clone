$(document).on('turbolinks:load', function(){
    $(".container").on("click", ".subscribe", function(e){
        var id = $(this).data("id");
        $(this).addClass("btn-default").removeClass("btn-primary subscribe");
        e.preventDefault();
        $.ajax({
            method: "POST",
            data: {channel_id: id},
            url: "/subscriptions"
        });
    });
    
    
    $(".navbar-toggler").on("click", function(){
        $(".sidebar").animate({width:'toggle'}, 250);
    });
});
