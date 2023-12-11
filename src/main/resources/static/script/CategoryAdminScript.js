function confirmDelete(button) {
    var catId = button.getAttribute('data-catId')
    var parentId = button.getAttribute('data-parentId')
    var result = confirm("Bạn có muốn xóa danh mục này?");
    if (result) {
        $.ajax({
            type: 'DELETE',
            url: "/admin/category/delete-cat",
            data: {catId:catId},
            success:  (data) => {
                alert('Đã xóa thành công!');
                window.location.href="/admin/category?parent="+parentId;

            },
            error: function (error) {
                alert('Có lỗi xảy ra khi tạo đơn hàng!' + error);
            }
        });
    }
}