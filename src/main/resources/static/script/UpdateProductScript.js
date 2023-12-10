function confirmDelete(button) {
    var result = confirm("Bạn có muốn xóa sản phẩm này?");
    if (result) {
        var productDetailId = button.getAttribute('data-prDetail-id')
        var productId = button.getAttribute('data-product-id')
        $.ajax({
            type: 'DELETE',
            url: '/admin/productDetail/delete/prDetail',
            data: {prDetailId:productDetailId},
            success:  (data) => {
                alert('Đã xóa!');
                window.location.href="/admin/product/update-product/" + productId;

            },
            error:  (error) => {
                alert('Có lỗi!');
            }
        });
    }
}
$(document).ready(() => {
    $("#form").submit((event) => {
        event.preventDefault();

        if ($("#pr_name").val() === "" ||
            $("#price").val() === "" ||
            $("#category").val() === "" ||
            $("#brand").val() === "" ||
            $("#imgSize").val() === "" ||
            isNaN($("#price").val()) ||
            isNaN($("#discount_price").val())) {

            alert("Nhập sai hoặc thiếu thông tin");
            return;
        }
        alert("Sửa thành công!")
        $("#form")[0].submit();
    });
});
