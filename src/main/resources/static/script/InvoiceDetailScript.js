function toggleEditMode(button) {
    // console.log(button)
    var detailId = button.getAttribute('data-detail-id');

    var quantityElement = $('#quantity' + detailId);
    var inputElement = $('#input' + detailId);
    var doneElement = $('#done' + detailId);
    var editElement = $('#edit' + detailId);
    var cancelElement = $('#cancel' + detailId);
    // Toggle edit mode

    inputElement.toggleClass('hidden');
    quantityElement.toggleClass('hidden');
    doneElement.toggleClass('hidden');
    editElement.toggleClass('hidden');
    cancelElement.toggleClass('hidden');
}

function saveQuantity(button) {
    var detailId = button.getAttribute('data-detail-id');
    var quantityElement = $('#input' + detailId);
    var newQuantity = quantityElement.val();

    $.ajax({
        type: 'PUT',
        url: '/admin/invoiceDetail/update-quantity', // Replace with your actual endpoint-->
        data: {detailId: detailId, newQuantity: newQuantity},
        success: function () {
            toggleEditMode(button);
            window.location.reload();
        },
        error: function () {
            alert('fail');
        }
    });
}

function confirmDelete(detailId) {
    var result = confirm("Bạn có muốn xóa sản phẩm này này?");
    if (result) {
        $.ajax({
            url: '/admin/invoiceDetail/delete/' + detailId,
            type: 'DELETE',
            success: function (result) {
                // Xử lý kết quả sau khi xóa thành công
                alert("Xóa thành công!")
            },
            error: function (err) {
                // Xử lý lỗi nếu có
                console.error(err);
            }
        });
    }
}
