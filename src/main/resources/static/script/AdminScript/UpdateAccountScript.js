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

    $("#form").submit(()=>{
        let validation = true
        if($("#user-name").val()===""){
            $("#username-error").text("Chưa nhập tên đăng nhập")
            validation=false;
        }else {
            $("#username-error").text("")
        }

        if ($("#name").val() === "") {
            $("#name-error").text("Chưa nhập tên")
            validation = false
        } else {
            $("#name-error").text("");
        }

        const email = $("#email").val()
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if(email === ""){
            $("#email-error").text("Chưa nhập email")
            validation = false
        }else if(!emailRegex.test(email)){
            $("#email-error").text("Email không đúng định dạng")
            validation = false
        }else {
            $("#email-error").text("")
        }

        if ($("#phone").val() === "") {
            $("#phone-error").text("Chưa nhập số điện thoại")
            validation = false
        } else if (!$("#phone").val().match(/^[0-9]{10}$/)) {
            $("#phone-error").text("Số không hợp lệ")
            validation = false
        } else {
            $("#phoneError").text("");
        }


        if ($("#address").val() === "") {
            validation = false
            $("#address-error").text("Chưa nhập địa chỉ")
        } else {
            $("#address-error").text("");
        }

        return validation;
    })
});
