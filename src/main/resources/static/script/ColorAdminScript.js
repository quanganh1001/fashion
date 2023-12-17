function confirmDelete(colorId) {

    var result = confirm("Bạn có muốn xóa mã màu này?");
    if (result) {
        $.ajax({
            type: 'DELETE',
            data:{colorId:colorId},
            url: '/admin/color/delete-color',
            success:  () =>{
                alert("Đã xóa mã màu")
                window.location.href="/admin/color";
            },
            error: (jqXHR, textStatus, errorThrown) => {
                if (jqXHR.status === 404) {
                    alert('Không thể xóa');
                } else {
                    alert('Có lỗi xảy ra! ' + textStatus + ': ' + errorThrown);
                }
            }
        });
    }
}