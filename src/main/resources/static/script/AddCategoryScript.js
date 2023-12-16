$(document).ready(() => {
    $("#btn-submit").click(() => {
        console.log("fds")
        if ($("#catId").val() === "" ||
            $("#cat_name").val() === "") {

            alert("Nhập sai hoặc thiếu thông tin");
        } else {
            var formData = $('#form').serialize(); // Lấy dữ liệu form
            var url = $('#form').attr('action'); // Lấy URL của form

            $.ajax({
                type: 'POST',
                url: url,
                data: formData,
                success: (data) => {
                    alert('Đã thêm thành công!');
                    console.log(data)
                    window.location.href = "/admin/category?parent=" + data;
                    // Có thể thực hiện các hành động khác sau khi cập nhật thành công
                },
                error: (error) => {
                    alert('Có lỗi xảy ra khi cập nhật đơn hàng!');
                }
            })
        }
    })
})