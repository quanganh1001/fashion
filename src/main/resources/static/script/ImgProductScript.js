$(document).ready(function () {
    // Thực hiện khi thay đổi option trong select
    $('#bg1').change(function () {
        // Lấy giá trị của option được chọn
        var selectedImage = $(this).val();
        var productId = document.getElementById("productId").value;
        console.log(selectedImage)
        console.log(productId)
        // Cập nhật đường dẫn ảnh trong #selectedImage
        $('#imgbg1').attr('src', '/admin/imgProduct/imgbg/' + selectedImage + '?imbg=1&productId=' +
            productId);
        alert("Đỏi ảnh nền thành công")
    });
});
$(document).ready(function () {
    // Thực hiện khi thay đổi option trong select
    $('#bg2').change(function () {
        // Lấy giá trị của option được chọn
        var selectedImage = $(this).val();
        var productId = document.getElementById("productId").value;
        console.log(productId)
        // Cập nhật đường dẫn ảnh trong #selectedImage
        $('#imgbg2').attr('src', '/admin/imgProduct/imgbg/' + selectedImage + '?imbg=2&productId=' +
            productId);
        alert("Đỏi ảnh nền thành công")
    });
});

function confirmDelete(fileImg) {
    console.log(fileImg)
    var result = confirm("Bạn có muốn xóa ảnh này này?");
    if (result) {
        $.ajax({
            type: 'GET',
            url: '/admin/imgProduct/delete/' + fileImg,
            success: function () {
                window.location.reload()
            },
            error: function () {
                alert('Failed to delete.');
            }
        });
    }
}