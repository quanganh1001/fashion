$(document).ready(() => {
    $("#btn-submit").click(()=>{
        if ($("#userName").val() === "" || $("#role").val() === ""){
            alert("Nhập sai hoặc thiếu thông tin")
        }
        else {
            var formData = $('#form').serialize(); // Lấy dữ liệu form
            var url = $('#form').attr('action'); // Lấy URL của form
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            console.log(url)
            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                beforeSend: function (xhr) {
                    // Sử dụng tên HTTP header chuẩn và giá trị token
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success:  (data) => {
                    alert('Đã tạo thành công! Mật khẩu mặc định là: 123456');
                    window.location.href="/admin/account";
                },
                error: (jqXHR, textStatus, errorThrown) => {
                    if (jqXHR.status === 409) {
                        alert('Lỗi xảy ra: Đã có tài khoản này rồi');
                    }else if(jqXHR.status === 409) {
                        alert('Lỗi xảy ra: Không thể set quyền ADMIN');
                    }
                    else
                    {
                        alert('Có lỗi xảy ra! ' + textStatus + ': ' + errorThrown);
                    }
                }
            });
        }
    })
})