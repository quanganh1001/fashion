$(document).ready(() => {
    $("#btn-submit").click(() => {
        let validation = true

        if ($("#cat-name").val() === "") {
            $("#cat-name-error").text("Chưa nhập tên sản phẩm")
            validation = false
        } else {
            $("#cat-name-error").text("")
        }

        if ($("#cat-id").val() === $("#parent-id").val()) {
            $("#parent-cat-error").text("Mã sản phẩm và danh mục cha không được trùng nhau")
            validation = false
        } else {
            $("#parent-cat-error").text("")
        }

        if (validation) {
            $("#loading").removeClass("hidden")
            const oldCatBg = $("#btn-submit").attr("data-cat-bg")
            const catId = $("#cat-id").val()
            const parentId = $("#cat-parent").val() == null ? "" : $("#cat-parent").val();
            const fileInput = $("#fileInput")
            const url = $("#form").attr("action")
            const formData = $("#form").serializeArray()
            const catBackground = fileInput[0].files[0] == null ? null : fileInput[0].files[0].name

            formData.push({name: "catBackground", value: catBackground});

            // Lấy mã CSRF từ thẻ meta
            const csrfToken = $("meta[name='_csrf']").attr("content");
            const csrfHeader = $("meta[name='_csrf_header']").attr("content");
            // Thêm mã CSRF vào headers của yêu cầu AJAX
            const headers = {};
            headers[csrfHeader] = csrfToken;

            $.ajax({
                url: url,
                type: 'PUT',
                data: formData,
                headers: headers,
                success: function (response) {
                    if (response === "no") {
                        window.location.href = "/admin/category?parent=" + parentId + "&success=success";
                    } else {
                        if (catBackground != null) {
                            // tạo file mới
                            const form = new FormData();
                            const file = fileInput[0].files[0] == null ? null : fileInput[0].files[0];
                            if (file != null) {
                                form.append('file', file);
                                form.append('catId', catId);
                                form.append('oldCatBg',oldCatBg)
                                $.ajax({
                                    url: '/admin/category/update-file',
                                    type: 'POST',
                                    data: form,
                                    headers: headers,
                                    processData: false,
                                    contentType: false,
                                    success: function (response) {
                                        window.location.href = "/admin/category?parent=" + parentId + "&success=success";

                                    },
                                    error: function (xhr, status, error) {
                                        $("#modal-content").text(xhr.responseText)
                                        $("#myModal").modal('show')
                                    }
                                });
                            }
                        } else return window.location.href = "/admin/category?parent=" + parentId + "&success=success";
                    }

                },
                error: function (xhr, status, error) {
                    $("#modal-content").text(xhr.responseText)
                    $("#myModal").modal('show')
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