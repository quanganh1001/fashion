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
                window.location.href="/admin/product";
            },
            error: (jqXHR, textStatus, errorThrown) => {
                if (jqXHR.status === 400){
                    alert(errorThrown);
                }else {
                    alert('Có lỗi xảy ra! ' + textStatus + ': ' + errorThrown);
                }
            }
        });
    }
}