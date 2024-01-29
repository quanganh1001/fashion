$(document).ready(() => {
    $("#reset-button").click(() => {
        var result = confirm("Bạn có muốn đặt lại mật khẩu cho tài khoản này?");
        if (result) {
            var accountId = $("#reset-button").data("account-id");
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            $.ajax({
                type: 'PUT',
                data: {accountId: accountId},
                url: '/admin/account/reset-password',
                beforeSend: function (xhr) {
                    // Sử dụng tên HTTP header chuẩn và giá trị token
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: () => {
                    alert("Đã reset mật khẩu tài khoản. Mật khẩu mặc định là: 123456")
                },
                error: (jqXHR) => {
                    alert(jqXHR.responseText)
                }
            });
        }
    })

    $("#change-pw-btn").click(() => {
        var accountId = $("#change-pw-btn").data("account-id");
        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var newPasswordAgain = $("#newPasswordAgain").val();

        if (oldPassword === '' || oldPassword == null ||
            newPassword === '' || newPassword ==null ||
            newPasswordAgain ==='' || newPasswordAgain == null||
            newPassword !== newPasswordAgain)
        {
            alert("Nhập thiếu dữ liệu hoặc mật khẩu mới không khớp!")
        }else if (newPassword.length < 6){
            alert("Mật khẩu phải có ít nhất 6 ký tự")
        }
        else {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            $.ajax({
                type: 'PUT',
                data: {accountId: accountId,oldPassword:oldPassword,newPassword:newPassword},
                url: '/admin/account/change-password',
                beforeSend: function (xhr) {
                    // Sử dụng tên HTTP header chuẩn và giá trị token
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: () => {
                    alert("Đã thay đổi mật khẩu")
                    window.location.reload();
                },
                error: (jqXHR) => {
                    alert(jqXHR.responseText)
                }
            });
        }


    })
});
