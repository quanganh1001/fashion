$(document).ready(() => {
    const csrfToken = $("meta[name='_csrf']").attr("content");
    const csrfHeader = $("meta[name='_csrf_header']").attr("content");
    $("#btn-submit").click(() => {
        if ($("#name").val() === "" ||
            $("#address").val() === "" ||
            $("#time").val() === "" ||
            $("#phone").val() === "" ||
            $("#api").val() === "" ||
            $("#city").val() === "")
            alert("Nhập sai hoặc thiếu thông tin")
        else {
            const formData = $('#form').serialize();
            const url = $('#form').attr('action');

            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: () => {
                    alert('Đã thêm thành công!');
                    window.location.reload();
                },
                error: (jqXHR) => {
                    alert(jqXHR.responseText)
                }
            });
        }
    })

})