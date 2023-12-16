function confirmDelete(productId) {

    var result = confirm("Bạn có muốn xóa sản phẩm này?");
    if (result) {
        $.ajax({
            type: 'DELETE',
            url: '/admin/product/delete-product/' + productId,
            success: function () {
                alert("Đã xóa sản phẩm")
                window.location.href="/admin/product";
            },
            error: function (error) {
                alert(error);
            }
        });
    }
}