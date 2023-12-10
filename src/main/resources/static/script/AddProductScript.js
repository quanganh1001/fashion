$(document).ready(() => {
    $("#submit").click(() => {
        if ($("#product_id").val() === "" ||
            $("#pr_name").val() === "" ||
            $("#price").val() === "" ||
            $("#category").val() === "" ||
            $("#brand").val() === "" ||
            $("#imgSize").val() === "" ||
            isNaN($("#price").val())||
            isNaN($("#discount_price").val()) )
            alert("Nhập sai hoặc thiếu thông tin")
        else {
            var formData = $('#form').serialize();
            var url = $('#form').attr('action');

            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                success: (data) => {
                    alert('Đã tạo sản phẩm thành công!');
                    window.location.href = "/admin/product/update-product/" + data;

                },
                error: function (error) {
                    alert('Có lỗi xảy ra khi tạo sản phẩm!' + error);
                }
            });
        }
    })
})
