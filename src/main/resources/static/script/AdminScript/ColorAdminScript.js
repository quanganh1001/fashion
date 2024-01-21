function confirmDelete(colorId) {

    var result = confirm("Bạn có muốn xóa mã màu này?");
    if (result) {
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
        $.ajax({
            type: 'DELETE',
            data:{colorId:colorId},
            url: '/admin/color/delete-color',
            beforeSend: function (xhr) {
                // Sử dụng tên HTTP header chuẩn và giá trị token
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success:  () =>{
                alert("Đã xóa mã màu")
                window.location.href="/admin/color";
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    }
}