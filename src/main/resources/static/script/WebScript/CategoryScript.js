$(document).ready(function () {
    $('.hover').hover(
        function () {
            var hoverSrc = $(this).find('.product-image').data('hover-src');
            $(this).find('.product-image').attr('src', hoverSrc);
            $(this).find('.add-to-cart-btn').removeClass("hidden");
        },
        function () {
            var defaultSrc = $(this).find('.product-image').data('default-src');
            $(this).find('.product-image').attr('src', defaultSrc);
            $(this).find('.add-to-cart-btn').addClass("hidden");
        }
    );
});