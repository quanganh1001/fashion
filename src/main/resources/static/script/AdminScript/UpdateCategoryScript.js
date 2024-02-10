$(document).ready(() => {
    $("#btn-submit").click(() => {
        let validation = true

        if($("#cat-name").val() === ""){
            $("#cat-name-error").text("Chưa nhập tên sản phẩm")
            validation = false
        }else {
            $("#cat-name-error").text("")
        }

        if(validation){
            const catBg =  $("#btn-submit").attr("data-cat-bg")

            // Lấy mã CSRF từ thẻ meta
            const csrfToken = $("meta[name='_csrf']").attr("content");
            const csrfHeader = $("meta[name='_csrf_header']").attr("content");

            // Thêm mã CSRF vào headers của yêu cầu AJAX
            const headers = {};
            headers[csrfHeader] = csrfToken;

            const url = $("#form").attr("action")

            const catBackground = $("#fileInput")[0].files[0]==null? "no" : $("#fileInput")[0].files[0].name
            console.log(catBackground)
            $.ajax({
                url: url,
                type: 'PUT',
                data: {catId: $("#cat-id").val(),catName: $("#cat-name").val(),catParent: $("#catParent").val(),isCatActive:$("#isActive").val(),catBackground:catBackground},
                headers:headers,
                success: function (response) {
                    console.log(response)
                    if($("#fileInput")[0].files[0]==null){
                        $.ajax({
                            url: '/admin/category/delete-file',
                            type: 'POST',
                            data: {catBackground:catBackground},
                            headers:headers,
                            success: function (response) {
                            },
                            error: function (xhr, status, error) {
                                // Xử lý lỗi
                            }
                        });
                        const form = new FormData();
                        const fileInput = document.getElementById('fileInput');
                        const file = fileInput.files[0] == null? catBg:fileInput.files[0];
                        // console.log(file)
                        if (file != null){
                            form.append('file', file, response);
                            $.ajax({
                                url: '/admin/category/update-file',
                                type: 'POST',
                                data: form,
                                headers:headers,
                                processData: false,
                                contentType: false,
                                success: function (response) {
                                    const parentId = $("#parent-id").val() == null ? "" : $("#parent-id").val();

                                    // Chuyển hướng trang
                                    window.location.href = "/admin/category?parent=" + parentId + "&success=success";

                                },
                                error: function (xhr, status, error) {
                                    // Xử lý lỗi
                                }
                            });
                        }

                    }

                },
                error: function (xhr, status, error) {
                    // Xử lý lỗi
                }
            });
        }
    })
});

function confirmDelete(productId) {
    var result = confirm("Bạn có muốn xóa sản phẩm này?");
    if (result) {
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
        $.ajax({
            type: 'DELETE',
            url: '/admin/product/delete-product/' + productId,
            beforeSend: function (xhr) {
                // Sử dụng tên HTTP header chuẩn và giá trị token
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success: function () {
                alert("Đã xóa sản phẩm")
                window.location.reload();
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    }
}