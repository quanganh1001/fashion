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
    $("#button").click(() => {
        if ($("#pr_name").val() === "" ||
            $("#price").val() === "" ||
            $("#category").val() === "" ||
            $("#brand").val() === "" ||
            $("#imgSize").val() === "" ||
            isNaN($("#price").val()) ||
            isNaN($("#discount_price").val())) {
            alert("Nhập sai hoặc thiếu thông tin");
            return;
        }else {
            var formData = $('#form').serialize(); // Lấy dữ liệu form
            var url = $('#form').attr('action'); // Lấy URL của form

            $.ajax({
                type: 'PUT',
                url: url,
                data: formData,
                success:  (data) => {
                    alert('Đã cập nhật thành công!');
                    window.location.reload();
                    // Có thể thực hiện các hành động khác sau khi cập nhật thành công
                },
                error:  (error) => {
                    alert('Có lỗi xảy ra khi cập nhật!');
                }
            });
        }
    });
});
