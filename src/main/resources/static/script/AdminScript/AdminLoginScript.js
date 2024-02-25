$(document).ready(() => {
    $("#form-login").attr("action", "/login?url=" + encodeURIComponent(window.location.pathname));

    $("#form").submit(() => {
        let validation = true
        if ($("#username").val() === "") {
            $("#usernameError").text("Chưa nhập username")
            $("#error").addClass("hidden")
            validation = false
        } else {
            $("#usernameError").text("")
        }

        if ($("#password").val() === "") {
            $("#passwordError").text("Chưa nhập mật khẩu")
            $("#error").addClass("hidden")
            validation = false
        } else {
            $("#passwordError").text("")
        }

        return validation;
    })

    const csrfToken = $("meta[name='_csrf']").attr("content");
    const csrfHeader = $("meta[name='_csrf_header']").attr("content");

    $("#btn-forgot").click(() => {
        let validation = true

        if ($("#input-forgot-password").val() === "") {
            $("#input-forgot-password-error").text("Chưa nhập email")
            validation = false
        } else {
            $("#input-forgot-password-error").text("")
        }

        if (validation) {
            $("#success").text("Đang gửi...")
            $.ajax({
                type: 'POST',
                url: "/admin/login/forgot-password",
                data: {inputValue: $("#input-forgot-password").val()},
                beforeSend: function (xhr) {
                    // Sử dụng tên HTTP header chuẩn và giá trị token
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: (data) => {
                    if (data === "Đã gửi tài khoản và mật khẩu mới về địa chỉ email đăng ký") {
                        $("#success").text(data)
                        $("#input-forgot-password-error").text("")
                    } else {
                        $("#success").text("")
                        $("#input-forgot-password-error").text(data)
                    }
                },
                error: (jqXHR) => {
                    alert(jqXHR.textContent)
                }
            });
        }
    })
})
