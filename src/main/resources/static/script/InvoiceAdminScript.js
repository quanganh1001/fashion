function toggleEditMode(button) {
    // console.log(button)
    var invoiceId = button.getAttribute('data-invoice-id');

    var noteElement = $('#note' + invoiceId);
    var inputElement = $('#input' + invoiceId);
    var doneElement = $('#done' + invoiceId);
    var editElement = $('#edit' + invoiceId);
    var cancelElement = $('#cancel' + invoiceId);
    // Toggle edit mode

    inputElement.toggleClass('hidden');
    noteElement.toggleClass('hidden');
    doneElement.toggleClass('hidden');
    editElement.toggleClass('hidden');
    cancelElement.toggleClass('hidden');
}

function saveNote(button) {
    var invoiceId = button.getAttribute('data-invoice-id');
    var noteElement = $('#input' + invoiceId);
    var newNote = noteElement.val();
    var noteElement = $('#note' + invoiceId);

    $.ajax({
        type: 'POST',
        url: '/admin/invoices/update-note', // Replace with your actual endpoint-->
        data: {invoiceId: invoiceId, newNote: newNote},
        success: function () {
            toggleEditMode(button);
            window.location.reload();

        },
        error: function () {
            alert('Failed to update note.');
        }
    });
}

function changeStatus(newStatus,invoiceId){
    console.log(invoiceId)
    console.log(newStatus)
    // var status = select;
    //
    $.ajax({
        type: 'POST',
        url: '/admin/invoices/update-status', // Replace with your actual endpoint-->
        data: {invoiceId: invoiceId, newStatus: newStatus},
        success: function () {
            window.location.reload()
            alert("Cập nhập trạng thái thành công!");
        },
        error: function () {
            alert('Failed to update status.');
        }
    });
}
