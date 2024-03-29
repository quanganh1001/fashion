$(document).ready(function () {
    $('#slider').slick({
        infinite: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        touchMove: true,
        autoplaySpeed: 3000,
        prevArrow: '.slick-prev',
        nextArrow: '.slick-next',
        asNavFor: "#thumbnail_slider",
    });
    $("#thumbnail_slider").slick({
        infinite: false,
        slidesToShow: 4,
        slidesToScroll: 3,
        touchMove: true,
        autoplaySpeed: 3000,
        prevArrow: '.slick-prev-thumb',
        nextArrow: '.slick-next-thumb',
        asNavFor: "#slider",
        focusOnSelect: true,
        centerPadding :'50%'
    });


    $('.color').click(function (event) {
        $("#quantity").val(1)


        $("#no-submit").removeClass("hidden")
        $("#submit").addClass("hidden")

        $('.color').removeClass('btn btn-dark checkedColor');

        $(this).addClass('btn btn-dark checkedColor');


        var input = $(this).find('input[name="color"]');
        input.prop('checked', true);

        var colorId = event.currentTarget.getAttribute("data-color-id");
        var productId = event.currentTarget.getAttribute("data-product-id");

        $.ajax({
            type: 'GET',
            url: "/products/detail",
            data: {colorId: colorId, productId: productId},
            success: function (data) {
                $("#detail").html(data)
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });

        $.ajax({
            type: 'GET',
            url: "/products/size",
            data: {colorId: colorId, productId: productId},
            success: function (data) {
                $("#selectSize").html(data)
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });

    });


    $("#quantity").keyup(() => {
        const productDetail = $("#productDetail-code").val();
        const quantity = $("#quantity").val();
        if (quantity > 0 && productDetail != null) {
            $("#submit").removeClass("hidden")
            $("#no-submit").addClass("hidden")
        } else {

            $("#no-submit").removeClass("hidden")
            $("#submit").addClass("hidden")
        }
    })

    $("#submit").click(() => {
        const quantity = $("#quantity").val();
        const prDetailId = $("#productDetail-id").text()

        $.ajax({
            type: 'GET',
            url: "/carts/addToCart",
            data: {prDetailId: prDetailId, quantity: quantity},
            success: ((data) => {
                $("#header").html(data)
            }),
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });


    })
});
