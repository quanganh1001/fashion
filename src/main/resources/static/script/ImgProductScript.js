$(document).ready(function () {
    // Thực hiện khi thay đổi option trong select
    $('#bg1').change(function () {
        // Lấy giá trị của option được chọn
        var selectedImage = $(this).val();
        console.log(selectedImage)
        var productId = document.getElementById("productId").value;
        console.log(selectedImage)
        console.log(productId)
        if(selectedImage.endsWith(".jpg")){
            $('#vdbg1').addClass('hidden')
            $('#imgbg1').removeClass('hidden')
            $('#imgbg1').attr('src', '/admin/imgProduct/imgbg/' + selectedImage + '?imbg=1&productId=' +
                productId);
        }else if(selectedImage.endsWith(".mp4")){
            console.log("ay"+selectedImage)
            $('#imgbg1').addClass('hidden')
            $('#vdbg1').removeClass('hidden')
            $('#vdbg1').attr('src', '/admin/imgProduct/imgbg/' + selectedImage + '?imbg=1&productId=' +
                productId);
        }
        alert("Đổi thành công")
    });

    $('#bg2').change(function () {
        // Lấy giá trị của option được chọn
        var selectedImage = $(this).val();
        var productId = document.getElementById("productId").value;
        console.log(productId)

        if(selectedImage.endsWith(".jpg")){
            $('#vdbg2').addClass('hidden')
            $('#imgbg2').removeClass('hidden')
            $('#imgbg2').attr('src', '/admin/imgProduct/imgbg/' + selectedImage + '?imbg=1&productId=' +
                productId);
        }else if(selectedImage.endsWith(".mp4")){
            console.log("ay"+selectedImage)
            $('#imgbg2').addClass('hidden')
            $('#vdbg2').removeClass('hidden')
            $('#vdbg2').attr('src', '/admin/imgProduct/imgbg/' + selectedImage + '?imbg=1&productId=' +
                productId);
        }
        alert("Đổi thành công")
    });
});

function confirmDelete(button) {
    var imageName = button.getAttribute("data-image-name");
    var productId = button.getAttribute("data-product-id");
    console.log(imageName)
    var result = confirm("Bạn có muốn xóa ảnh này này?");
    if (result) {
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
        $.ajax({
            type: 'DELETE',
            url: '/admin/imgProduct/delete',
            data:{imageName:imageName},
            beforeSend: function (xhr) {
                // Sử dụng tên HTTP header chuẩn và giá trị token
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success: function () {
                alert("Đã xóa ảnh")
                window.location.href="/admin/imgProduct/add-img?productId="+productId;
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    }
}