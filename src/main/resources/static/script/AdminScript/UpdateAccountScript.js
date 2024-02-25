$(document).ready(() => {
    const csrfToken = $("meta[name='_csrf']").attr("content");
    const csrfHeader = $("meta[name='_csrf_header']").attr("content");

    $("#form").submit(() => {
        let validation = true
        if ($("#user-name").val() === "") {
            $("#username-error").text("Chưa nhập tên đăng nhập")
            validation = false;
        } else {
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
        if (email === "") {
            $("#email-error").text("Chưa nhập email")
            validation = false
        } else if (!emailRegex.test(email)) {
            $("#email-error").text("Email không đúng định dạng")
            validation = false
        } else {
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


    $("#form-change-pass").submit((event) => {
        event.preventDefault();

        let validation = true

        if ($("#old-password").val() === "") {
            $("#old-password-error").text("Chưa nhập mật khẩu cũ")
            validation = false
        } else {
            $("#old-password-error").text("")
        }

        if ($("#new-password").val() === "") {
            $("#new-password-error").text("Chưa nhập mật khẩu mới")
            validation = false
        } else if ($("#new-password").val().length < 6 || $("#new-password").val().length > 25) {
            validation = false
            $("#new-password-error").text("Mật khẩu có độ dài từ 6-25 ký tự")
        } else {
            $("#new-password-error").text("")
        }

        if ($("#new-password").val() !== $("#new-password-again").val()) {
            $("#new-password-again-error").text("Nhập lại không khớp")
            validation = false
        } else {
            $("#new-password-again-error").text("")
        }


        if (validation) {
            const formData = $('#form-change-pass').serialize(); // Lấy dữ liệu form
            const url = $('#form-change-pass').attr('action'); // Lấy URL của form
            $.ajax({
                type: 'PUT',
                url: url,
                data: formData,
                beforeSend: function (xhr) {
                    // Sử dụng tên HTTP header chuẩn và giá trị token
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: (data) => {
                    if (data === "Mật khẩu cũ không chính xác") {
                        $("#old-password-error").text(data);
                    } else {
                        window.location.href = "/admin/account/update-account?" + data + "&alert=oke"
                    }

                },
                error: (jqXHR) => {
                    $("#change-pass-error").text("Có lỗi")
                }
            });
        }
    })

    $("#reset-pass").click(() =>{
        const accountId = $("#reset-pass").attr("data-account-id")
        $.ajax({
            type: "PUT",
            url: "/admin/account/reset-password",
            data: {accountId:accountId},
            beforeSend: function (xhr) {
                // Sử dụng tên HTTP header chuẩn và giá trị token
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success: (data) => {
                $("#myModal").modal('show')
                $("#modal-content").text(data)
            },
            error: (jqXHR) => {
                $("myModal").modal('show')
                $("modal-content").text(jqXHR.responseText)
            }
        });
    })
});
