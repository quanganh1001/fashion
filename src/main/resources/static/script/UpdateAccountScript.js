$(document).ready(() => {
    $("#button").click(() => {
        if ($("#userName").val() === "") {
            alert("Nhập sai hoặc thiếu thông tin");
            return;
        }else {
            var formData = $('#form').serialize(); // Lấy dữ liệu form
            var url = $('#form').attr('action'); // Lấy URL của form

            $.ajax({
                type: 'PUT',
                url: url,
                data: formData,
                success:  (data) => {
                    alert('Đã cập nhật thành công!');
                    window.location.href="/admin/account";
                    // Có thể thực hiện các hành động khác sau khi cập nhật thành công
                },
                error:  (error) => {
                    alert('Có lỗi xảy ra khi cập nhật!');
                }
            });
        }
    });
});
