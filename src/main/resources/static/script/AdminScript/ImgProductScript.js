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
            $('#imgbg2').attr('src', '/admin/imgProduct/imgbg/' + selectedImage + '?imbg=2&productId=' +
                productId);
        }else if(selectedImage.endsWith(".mp4")){
            console.log("ay"+selectedImage)
            $('#imgbg2').addClass('hidden')
            $('#vdbg2').removeClass('hidden')
            $('#vdbg2').attr('src', '/admin/imgProduct/imgbg/' + selectedImage + '?imbg=2&productId=' +
                productId);
        }
        alert("Đổi thành công")
    });
});
