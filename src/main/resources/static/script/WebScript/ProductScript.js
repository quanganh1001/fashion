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
        const productDetail = $("#productDetail-code").val()
        const quantity = $("#quantity").val();

        if (quantity > 0 && productDetail != null) {
            $("#submit").removeClass("hidden")
            $("#no-submit").addClass("hidden")
        } else {
            $("#no-submit").removeClass("hidden")
            $("#submit").addClass("hidden")
        }

        // Loại bỏ lớp 'bg-success' từ tất cả các label
        $('.color').removeClass('bg-success text-light checkedColor');

        // Thêm lớp 'bg-success' cho label được bấm vào
        $(this).addClass('bg-success text-light checkedColor');

        // Tìm input con và thay đổi trạng thái checked
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
                alert("Đã thêm vào giỏ hàng");
                $("#header").html(data)
            }),
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });


    })
});