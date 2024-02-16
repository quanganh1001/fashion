$(document).ready(()=>{
    $(".unread").click(function(){
        const id = $(this).data("id");
        const csrfToken = $("meta[name='_csrf']").attr("content");
        const csrfHeader = $("meta[name='_csrf_header']").attr("content");
        // Thêm mã CSRF vào headers của yêu cầu AJAX
        const headers = {};
        headers[csrfHeader] = csrfToken;
        $.ajax({
            url: '/admin/feedback/read',
            type: 'PUT',
            data: {id:id},
            headers:headers,
            success: function (response) {
                $("#feedback-column-"+id).text(response)
            },
            error: function (xhr, status, error) {
                // Xử lý lỗi
            }
        });
    })
})