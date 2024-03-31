$(document).ready(() =>{
    $("#form").submit(()=>{
        $("#loading-add").removeClass("hidden")
    })

    $('form#form-delete').submit(function(event) {
        $(this).find('#loading-delete').removeClass('hidden');
    })

    $('.choose-bg').click(function (){
        const csrfToken = $("meta[name='_csrf']").attr("content");
        const csrfHeader = $("meta[name='_csrf_header']").attr("content");
        // Thêm mã CSRF vào headers của yêu cầu AJAX
        const headers = {};
        headers[csrfHeader] = csrfToken;

        const imageName = $(this).attr("data-imageName")
        const productId = $(this).attr("data-product-id")

        $.ajax({
            url: '/admin/imgProduct/img-bg',
            type: 'POST',
            data: {imageName: imageName,productId:productId},
            headers:headers,
            success: function (response) {
                if(response.endsWith('.mp4')){
                    $("#vdbg1").removeClass("hidden")
                    $("#vdbg1").prop("src",response)
                    $("#imgbg1").addClass("hidden")
                }else {
                    $("#imgbg1").removeClass("hidden")
                    $("#imgbg1").prop("src",response)
                    $("#vdbg1").addClass("hidden")
                }
                $("#modal-content").text("Đặt ảnh nền thành công")
                $("#myModal").modal('show')
            },
            error: function (xhr, status, error) {
                // Xử lý lỗi
            }
        });

    })
})