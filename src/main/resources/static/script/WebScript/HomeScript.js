$(document).ready(()=>{
    $('.slide').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        touchMove: true,
        autoplaySpeed: 3000,
        prevArrow: '.slick-prev',
        nextArrow: '.slick-next',
        dots: true,
        dotClass: 'slick-dots'
    });
})