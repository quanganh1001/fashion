$(document).ready(() => {
    $("#btn-submit").click(()=>{
        if ($("#code").val() === "" || $("#quantity").val() === ""|| $("#color").val() =="" || isNaN($("#quantity").val())){
            alert("Nhập sai hoặc thiếu thông tin")
        }
        else {
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
                success:  (data) => {
                    alert('Đã tạo thành công!');
                    window.location.href="/admin/product/update-product/" + data;

                },
                error: (jqXHR, textStatus, errorThrown) => {
                    if (jqXHR.status === 409) {
                        alert('Lỗi xảy ra: Đã có sản phẩm này rồi');
                    } else {
                        alert('Có lỗi xảy ra khi tạo đơn hàng! ' + textStatus + ': ' + errorThrown);
                    }
                }
            });
        }
    })
})