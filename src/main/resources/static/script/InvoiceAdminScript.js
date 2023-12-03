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
        url: '/admin/invoice/update-invoice', // Replace with your actual endpoint-->
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

$(document).ready(() =>{
    $(".filter").click(() =>{
        // Lấy giá trị của thuộc tính data-filter của phần tử được click
        var filterStatus = $(this).data('filter');
        console.log(filterStatus)
        // Xử lý sự kiện ở đây
        $.ajax({
            type: 'GET',
            url: "/admin/invoice/filter/" + filterStatus + "?key=", // Replace with your actual endpoint-->
            success:  ()=> {
                window.location.href="/admin/invoice/filter/" + filterStatus + "?key=";
            },
            error:  () =>{
                alert('Failed to update status.');
            }
        });
    });
});

