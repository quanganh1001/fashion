$(document).ready(() => {
    $("#btn-submit").click(() => {
        let validation = true

        if ($("#cat-id").val() === ""){
            $("#idError").text("Chưa nhập mã danh mục")
            validation = false
        }else {
            $("#idError").text("")
        }

        if($("#cat-name").val() === ""){
            $("#nameError").text("Chưa nhập tên danh mục")
            validation = false
        }else {
            $("#nameError").text("")
        }

        if(validation){
            // Lấy mã CSRF từ thẻ meta
            const csrfToken = $("meta[name='_csrf']").attr("content");
            const csrfHeader = $("meta[name='_csrf_header']").attr("content");
            // Thêm mã CSRF vào headers của yêu cầu AJAX
            const headers = {};
            headers[csrfHeader] = csrfToken;
            const formData = $('#form').serializeArray(); // Lấy dữ liệu form
            const url = $('#form').attr('action'); // Lấy URL của form
            const fileInput = $("#fileInput")
            const parentId = $("#parent-id").val() == null ? "" : $("#parent-id").val();

            const catBackground = fileInput[0].files[0]==null? null :fileInput[0].files[0].name

            formData.push({name:"catBackground", value:catBackground});

            $.ajax({
                url: url,
                type: 'POST',
                data: formData,
                headers:headers,
                success: function (response) {
                    console.log(response)
                    if (response === "no"){
                        window.location.href = "/admin/category?parent=" + parentId + "&success=success";
                    }else {
                        // tạo file mới
                        const form = new FormData();
                        const file = fileInput[0].files[0] == null? null:fileInput[0].files[0];
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
                    $("#modal-content").text(xhr.responseText)
                    $('#myModal').modal('show');
                }
            });
        }


    })
})