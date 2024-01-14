$(document).ready(() => {
    $("#btn-submit").click(function (){
        var formData = $('#form').serialize(); // Lấy dữ liệu form
        var url = $('#form').attr('action'); // Lấy URL của form
        if ($("#name").val() === "" || $("#phone").val() === "" || isNaN($("#phone").val())){
            alert("Nhập sai hoặc thiếu thông tin")
        }
        else {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            var accountId = $("#btn-submit").attr("data-account-id")
            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                beforeSend: function (xhr) {
                    // Sử dụng tên HTTP header chuẩn và giá trị token
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success:  (data) => {
                    alert('Đã tạo đơn hàng thành công!');
                    window.location.href="/admin/invoiceDetail?invoiceId="+data+"&accountId="+accountId ;

                },
                error: (jqXHR) => {
                    alert(jqXHR.responseText)
                }
            });
        }

    })
})