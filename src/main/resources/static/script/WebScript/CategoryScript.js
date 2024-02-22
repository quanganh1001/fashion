$(document).ready(function () {
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