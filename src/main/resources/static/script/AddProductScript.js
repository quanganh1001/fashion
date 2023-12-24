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
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                beforeSend: function (xhr) {
                    // Sử dụng tên HTTP header chuẩn và giá trị token
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: (data) => {
                    alert('Đã tạo sản phẩm thành công!');
                    window.location.href = "/admin/product/update-product/" + data;

                },
                error: (jqXHR, textStatus, errorThrown) => {
                    if (jqXHR.status === 409) {
                        alert('Lỗi xảy ra: Đã có sản phẩm này rồi');
                    } else {
                        alert('Có lỗi xảy ra khi tạo đơn hàng! ' + textStatus + ': ' + errorThrown);
                    }
                }
            });
        }
    })
})
