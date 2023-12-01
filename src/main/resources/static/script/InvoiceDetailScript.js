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

function saveNote(button) {
    var detailId = button.getAttribute('data-detail-id');
    var quantityElement = $('#input' + detailId);
    var newQuantity = quantityElement.val();

    $.ajax({
        type: 'POST',
        url: '/admin/invoiceDetail/update-quantity', // Replace with your actual endpoint-->
        data: {detailId: detailId, newQuantity: newQuantity},
        success: function () {
            toggleEditMode(button);
            window.location.reload();

        },
        error: function () {
            alert('Failed to update quantity.');
        }
    });
}

function confirmDelete(detailId) {
    var result = confirm("Bạn có muốn xóa sản phẩm này này?");
    if (result) {
        window.location.href = '/admin/invoiceDetail/delete/' + detailId;
    }
}