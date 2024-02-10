$(document).ready(function () {
    $(".product-image-bg1").mouseenter(function() {
        let productId = $(this).attr("data-product-id");
        $(this).toggleClass("hidden");
        $(".product-image-bg2").each(function() {
            if ($(this).attr("data-product-id") === productId) {
                $(this).toggleClass("hidden");
            }
        });
    });

    $(".product-image-bg2").mouseleave(function() {
        let productId = $(this).attr("data-product-id");
        $(this).toggleClass("hidden");
        $(".product-image-bg1").each(function() {
            if ($(this).attr("data-product-id") === productId) {
                $(this).toggleClass("hidden");
            }
        });
    });
});