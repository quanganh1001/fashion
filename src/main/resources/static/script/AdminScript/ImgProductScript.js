$(document).ready(() =>{
    const productId = $("#bg1").attr("data-product-id")
    $('#bg1').change(()=>{

        const csrfToken = $("meta[name='_csrf']").attr("content");
        const csrfHeader = $("meta[name='_csrf_header']").attr("content");
        // Thêm mã CSRF vào headers của yêu cầu AJAX
        const headers = {};
        headers[csrfHeader] = csrfToken;
        $.ajax({
            url: '/admin/imgProduct/img-bg',
            type: 'POST',
            data: {imageName: $('#bg1').val(),numberBackground:1,productId:productId},
            headers:headers,
            success: function (response) {
                if(response.endsWith('.mp4')){
                    $("#vdbg1").removeClass("hidden")
                    $("#vdbg1").prop("src","/admin/imgProduct?imageName="+response)
                    $("#imgbg1").addClass("hidden")
                }else {
                    $("#imgbg1").removeClass("hidden")
                    $("#imgbg1").prop("src","/admin/imgProduct?imageName="+response)
                    $("#vdbg1").addClass("hidden")
                }
                $("#modal-content").text("Thành công")
                $("#myModal").modal('show')
            },
            error: function (xhr, status, error) {
                // Xử lý lỗi
            }
        });

    })

    $('#bg2').change(()=>{

        const csrfToken = $("meta[name='_csrf']").attr("content");
        const csrfHeader = $("meta[name='_csrf_header']").attr("content");
        // Thêm mã CSRF vào headers của yêu cầu AJAX
        const headers = {};
        headers[csrfHeader] = csrfToken;
        $.ajax({
            url: '/admin/imgProduct/img-bg',
            type: 'POST',
            data: {imageName: $('#bg2').val(),numberBackground:2,productId:productId},
            headers:headers,
            success: function (response) {
                $("#imgbg2").prop("src","/admin/imgProduct?imageName="+response)
                $("#modal-content").text("Thành công")
                $("#myModal").modal('show')
            },
            error: function (xhr, status, error) {
                // Xử lý lỗi
            }
        });

    })
})