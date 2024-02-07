$(document).ready(function () {
    $('.a-product-slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 5000,
        infinite: true,
        arrows: false,
        responsive: [
            {
                breakpoint: 800,
                settings: {
                    slidesToShow: 3
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 3
                }
            }
        ]
    });

    $('.color').click(function (event) {
        $("#quantity").val(1)


        $("#no-submit").removeClass("hidden")
        $("#submit").addClass("hidden")

        $('.color').removeClass('bg-success text-light checkedColor');

        $(this).addClass('bg-success text-light checkedColor');


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