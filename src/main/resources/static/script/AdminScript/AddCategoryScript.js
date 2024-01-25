$(document).ready(() => {
    $("#btn-submit").click(() => {
        console.log("fds")
        if ($("#catId").val() === "" ||
            $("#cat_name").val() === "") {

            alert("Nhập sai hoặc thiếu thông tin");
        } else {
            var formData = $('#form').serialize(); // Lấy dữ liệu form
            var url = $('#form').attr('action'); // Lấy URL của form

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
                    alert('Đã thêm thành công!');
                    window.location.href = "/admin/category?parent=" + data;
                    // Có thể thực hiện các hành động khác sau khi cập nhật thành công
                },
                error: (jqXHR) => {
                    alert(jqXHR.responseText)
                }
            })
        }
    })
})