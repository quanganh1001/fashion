$(document).ready(() => {
    $("#btn-submit").click(()=>{
        if ($("#colorId").val() === "" || $("#name").val() === ""){
            alert("Nhập sai hoặc thiếu thông tin")
        }
        else {
            var formData = $('#form').serialize(); // Lấy dữ liệu form
            var url = $('#form').attr('action'); // Lấy URL của form

            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                success:  (data) => {
                    alert('Đã tạo thành công!');
                    window.location.href="/admin/color";
                },
                error: (jqXHR, textStatus, errorThrown) => {
                    if (jqXHR.status === 409) {
                        alert('Lỗi xảy ra: Đã có màu này rồi');
                    } else {
                        alert('Có lỗi xảy ra! ' + textStatus + ': ' + errorThrown);
                    }
                }
            });
        }
    })
})