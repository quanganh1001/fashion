$(document).ready(() => {
    $("#button").click(() => {
        if ($("#productDetailId").val() === "" ||
            $("#code").val() === "" ||
            $("#quantity").val() === "" ||
            isNaN($("#quantity").val())) {
            alert("Nhập sai hoặc thiếu thông tin");
            return;
        }else {
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
                    window.location.href="/admin/product/update-product/" + data;
                    // Có thể thực hiện các hành động khác sau khi cập nhật thành công
                },
                error: (jqXHR) => {
                    console.log(jqXHR)
                    alert(jqXHR.responseText)
                }
            });
        }
    });
});
