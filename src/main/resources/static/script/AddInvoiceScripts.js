$(document).ready(() => {
    $("#btn-submit").click(function (){
        var formData = $('#form').serialize(); // Lấy dữ liệu form
        var url = $('#form').attr('action'); // Lấy URL của form
        if ($("#name").val() === "" || $("#phone").val() === "" || isNaN($("#phone").val())){
            alert("Nhập sai hoặc thiếu thông tin")
        }
        else {
            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                success:  (data) => {
                    alert('Đã tạo đơn hàng thành công!');
                    window.location.href="/admin/invoiceDetail?invoiceId="+data;

                },
                error: function (error) {
                    alert('Có lỗi xảy ra khi tạo đơn hàng!' + error);
                }
            });
        }

    })
})