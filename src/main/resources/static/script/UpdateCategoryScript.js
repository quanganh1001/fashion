$(document).ready(() => {
    $("#btn-submit").click(() => {
        if ($("#catId").val() === "" ||
            $("#catName").val() === "")
            {
            alert("Nhập sai hoặc thiếu thông tin");
            }
        else {
            var formData = $('#form').serialize(); // Lấy dữ liệu form
            var url = $('#form').attr('action'); // Lấy URL của form
            var catId = ""


            var parentIdString = $('#form').attr('data-parent-id');

            if (parentIdString === undefined) {
                catId = "";
            }else {
                var catIdMatch = parentIdString.match(/catId=([^,]+)/);
                catId = catIdMatch ? catIdMatch[1] : null;
            }
            $.ajax({
                type: 'PUT',
                url: url,
                data: formData,
                success:  (data) => {
                    alert('Đã cập nhật thành công!');
                    window.location.href="/admin/category?parent=" + catId;
                    // Có thể thực hiện các hành động khác sau khi cập nhật thành công
                },
                error:  (error) => {
                    alert('Có lỗi xảy ra khi cập nhật đơn hàng!');
                }
            });
        }

    });
});

function confirmDelete(productId) {
    console.log(productId)
    var result = confirm("Bạn có muốn xóa sản phẩm này?");
    if (result) {
        $.ajax({
            type: 'DELETE',
            url: '/admin/product/delete-product/' + productId,
            success: function () {
                alert("Đã xóa sản phẩm")
                window.location.reload()
            },
            error: function (error) {
                alert(error);
            }
        });
    }
}