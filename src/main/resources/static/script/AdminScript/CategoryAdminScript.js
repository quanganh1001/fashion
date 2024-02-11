
function confirmDelete(button) {
    var catId = button.getAttribute('data-catId')
    var parentId = button.getAttribute('data-parentId')
    var result = confirm("Bạn có muốn xóa danh mục này?");
    if (result) {
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
        $.ajax({
            type: 'DELETE',
            url: "/admin/category/delete-cat",
            data: {catId:catId},
            beforeSend: function (xhr) {
                // Sử dụng tên HTTP header chuẩn và giá trị token
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success:  (data) => {
                alert('Đã xóa thành công!');
                window.location.href="/admin/category?parent="+data;
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    }
}