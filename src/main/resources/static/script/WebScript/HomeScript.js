$(document).ready(()=>{
    $('#banner-slider').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        touchMove: true,
        autoplaySpeed: 3000,
        prevArrow: '.slick-prev-slide',
        nextArrow: '.slick-next-slide',
        dots: true,
        dotClass: 'slick-dots',
        mobileFirst: true
    });

    $('#category-slider').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 2,
        touchMove: true,
        autoplaySpeed: 5000,
        prevArrow: '.slick-prev-cat',
        nextArrow: '.slick-next-cat',
        mobileFirst: true,
        swipeToSlide: false,
        Swipe: true,
        draggable: true,
    });

    $('#sale-slider').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 2,
        touchMove: true,
        autoplaySpeed: 5000,
        prevArrow: '.slick-prev-sale',
        nextArrow: '.slick-next-sale',
        mobileFirst: true,
        swipeToSlide: false,
        Swipe: true,
        draggable: true,
    });

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
})