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

