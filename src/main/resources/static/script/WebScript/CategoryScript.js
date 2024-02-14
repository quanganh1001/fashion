$(document).ready(function () {
    $(".product-image-bg1").mouseenter(function () {
        let productId = $(this).attr("data-product-id");
        $(this).toggleClass("hidden");
        $(".product-image-bg2").each(function () {
            if ($(this).attr("data-product-id") === productId) {
                $(this).toggleClass("hidden");
            }
        });
    });

    $(".product-image-bg2").mouseleave(function () {
        let productId = $(this).attr("data-product-id");
        $(this).toggleClass("hidden");
        $(".product-image-bg1").each(function () {
            if ($(this).attr("data-product-id") === productId) {
                $(this).toggleClass("hidden");
            }
        });
    });

    $("#filter").change(() =>{
        const filter = $("#filter").val()
        const minPrice = $("#minPrice").val()
        const maxPrice = $("#maxPrice").val()
        const catId = $("#filter").attr("data-cat-id")
        const key = $("#filter").attr("data-key")
        $.ajax({
            url: '/category/filter',
            type: 'GET',
            data: {filter:filter,minPrice:minPrice,maxPrice:maxPrice,catId:catId,key:key},
            success: function (response) {
                $("#list-product").html(response)
            },
            error: function (xhr, status, error) {
                // Xử lý lỗi
            }
        });
    });


});