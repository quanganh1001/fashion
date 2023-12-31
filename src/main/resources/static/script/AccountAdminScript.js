function deleteAccount(button) {
    var result = confirm("Bạn có muốn xóa tài khoản này?");
    if (result) {
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");

        var accountId = button.getAttribute("data-accountId");

        $.ajax({
            type: 'DELETE',
            data: { accountId: accountId },
            url: '/admin/account/delete-account',
            beforeSend: function (xhr) {
                // Sử dụng tên HTTP header chuẩn và giá trị token
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success: () => {
                alert("Đã xóa tài khoản");
                window.location.href = "/admin/account";
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    }
}

