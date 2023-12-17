function confirmDelete(accountId) {

    var result = confirm("Bạn có muốn xóa tài khoản nyaf?");
    if (result) {
        $.ajax({
            type: 'DELETE',
            data:{accountId:accountId},
            url: '/admin/account/delete-account',
            success:  () =>{
                alert("Đã xóa tài khoản")
                window.location.href="/admin/account";
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