$(document).ready(() => {
    $("#form").submit((event) => {
        event.preventDefault();

        if ($("#catId").val() === "" ||
            $("#catName").val() === "")
            {
            alert("Nhập sai hoặc thiếu thông tin");
            return;
            }


        alert("Sửa thành công!")
        $("#form")[0].submit();
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