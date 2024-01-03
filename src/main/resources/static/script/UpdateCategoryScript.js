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

            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            $.ajax({
                type: 'PUT',
                url: url,
                data: formData,
                beforeSend: function (xhr) {
                    // Sử dụng tên HTTP header chuẩn và giá trị token
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success:  (data) => {
                    alert('Đã cập nhật thành công!');
                    window.location.href="/admin/category?parent=" + data;
                    // Có thể thực hiện các hành động khác sau khi cập nhật thành công
                },
                error: (jqXHR) => {
                    alert(jqXHR.responseText)
                }
            });
        }

    });
});

function confirmDelete(productId) {
    var result = confirm("Bạn có muốn xóa sản phẩm này?");
    if (result) {
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
        $.ajax({
            type: 'DELETE',
            url: '/admin/product/delete-product/' + productId,
            beforeSend: function (xhr) {
                // Sử dụng tên HTTP header chuẩn và giá trị token
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success: function () {
                alert("Đã xóa sản phẩm")
                window.location.reload();
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    }
}