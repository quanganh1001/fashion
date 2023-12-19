$(document).ready(() => {
    $("#button").click(() => {
        if ($("#userName").val() === "") {
            alert("Nhập sai hoặc thiếu thông tin");
            return;
        } else {
            var formData = $('#form').serialize(); // Lấy dữ liệu form
            var url = $('#form').attr('action'); // Lấy URL của form

            $.ajax({
                type: 'PUT',
                url: url,
                data: formData,
                success: (data) => {
                    alert('Đã cập nhật thành công!');
                    window.location.href = "/admin/account";
                    // Có thể thực hiện các hành động khác sau khi cập nhật thành công
                },
                error: (error) => {
                    alert('Có lỗi xảy ra khi cập nhật!');
                }
            });
        }
    });

    $("#reset-button").click(() => {
        var result = confirm("Bạn có muốn đặt lại mật khẩu cho tài khoản này?");
        if (result) {
            var accountId = $("#reset-button").data("account-id");
            console.log($("#reset-button"))
            console.log(accountId)
            $.ajax({
                type: 'PUT',
                data: {accountId: accountId},
                url: '/admin/account/reset-password',
                success: () => {
                    alert("Đã reset mật khẩu tài khoản. Mật khẩu mặc định là: 123456")
                },
                error: (jqXHR, textStatus, errorThrown) => {
                    if (jqXHR.status === 404) {
                        alert('Không thể đặt lại mật khẩu');
                    } else {
                        alert('Có lỗi xảy ra! ' + textStatus + ': ' + errorThrown);
                    }
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
            $.ajax({
                type: 'PUT',
                data: {accountId: accountId,oldPassword:oldPassword,newPassword:newPassword},
                url: '/admin/account/change-password',
                success: () => {
                    alert("Đã thay đổi mật khẩu")
                    window.location.reload();
                },
                error: (jqXHR, textStatus, errorThrown) => {
                    if (jqXHR.status === 400) {
                        alert(errorThrown);
                    }else if (jqXHR.status === 409){
                        alert(errorThrown);
                    }else {
                        alert('Có lỗi xảy ra! ' + textStatus + ': ' + errorThrown);
                    }
                }
            });
        }


    })
});
