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

function changeStatus(select) {
    var invoiceId = select.getAttribute("data-invoice-id");
    var oldStatus = select.getAttribute("data-old-status")
    var newStatus = select.value;
    console.log(invoiceId)
    // kiểm tra nếu đơn đã gửi thì không thể chuyển trạng thái về chưa gửi
    if ((oldStatus >= 3 && oldStatus <= 6) && (newStatus >= 0 && newStatus <= 2)) {
        select.value = oldStatus
        alert('Đơn đã gửi thì không thể đổi trạng thái về lúc chưa gửi');
    }

    // kiểm tra nếu đơn chưa gửi thì không thể chuyển trạng thái thành công hoặc hoàn
    else if ((oldStatus >= 0 && oldStatus <= 2) && (newStatus >= 4 && newStatus <= 6)) {
        select.value = oldStatus
        alert("Đơn chưa gửi không thể cập nhập trạng thái đang chuyển, thành công hoặc hoàn")
    } else if ((oldStatus === 5 || oldStatus === 6)) {
        select.value = oldStatus
        alert("Đơn hàng đã thành công hoặc hoàn thì không thể cập nhập trạng thái")
    }
}

$(document).ready(() => {
    $("#plus").click(() => {


        $.ajax({
            type: 'GET',
            url: "/admin/invoice/filter/" + filterStatus + "?key=", // Replace with your actual endpoint-->
            success: () => {
                window.location.href = "/admin/invoice/filter/" + filterStatus + "?key=";
            },
            error: () => {
                alert('Failed to update status.');
            }
        });
    });
});


function submitForm() {
    var formData = $('#form').serialize(); // Lấy dữ liệu form
    var url = $('#form').attr('action'); // Lấy URL của form

    $.ajax({
        type: 'PUT',
        url: url,
        data: formData,
        success: function (data) {
            alert('Đã cập nhật đơn hàng thành công!');
            window.location.reload();
            // Có thể thực hiện các hành động khác sau khi cập nhật thành công
        },
        error: function (error) {
            alert('Có lỗi xảy ra khi cập nhật đơn hàng!');
        }
    });
}

