function updateTotalBill(invoiceId) {
    $.ajax({
        type: 'GET',
        url: "/admin/invoiceDetail/update-total-bill",
        data: {invoiceId: invoiceId},
        success: (data) => {
            $("#totalBill").text(data.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace('₫', 'đ'))
        },
        error: (error) => {
            console.log(error)
        }
    })
}


$(document).ready(() => {
    const csrfToken = $("meta[name='_csrf']").attr("content");
    const csrfHeader = $("meta[name='_csrf_header']").attr("content");
    const invoiceId = $("#input-plus").attr("data-invoice-id");

    $("#changeStatus").change((select) => {
        const oldStatus = $(select.currentTarget).attr("data-old-status")
        const newStatus = $(select.currentTarget).val();
        // kiểm tra nếu đơn đã gửi thì không thể chuyển trạng thái về chưa gửi
        if (oldStatus == 4 && newStatus <= 3) {
            $(select.currentTarget).val(oldStatus);
            alert('Đơn đã gửi thì không thể đổi trạng thái về lúc chưa gửi');
        } else if (oldStatus == 3 && newStatus >= 5) {
            console.log(newStatus)
            $(select.currentTarget).val(oldStatus);
            alert('Đơn chưa gửi thì không thể đổi trạng thái thành công hoặc hoàn');
        }
        // kiểm tra nếu đơn chưa gửi thì không thể chuyển trạng thái thành công hoặc hoàn
        else if (oldStatus <= 2 && newStatus >= 4) {
            $(select.currentTarget).val(oldStatus);
            alert("Đơn chưa gửi không thể cập nhập trạng thái đang chuyển, thành công hoặc hoàn")
        } else if (oldStatus == 5 || oldStatus == 6) {
            $(select.currentTarget).val(oldStatus);
            alert("Đơn hàng đã thành công hoặc hoàn thì không thể cập nhập trạng thái")
        }
    })

    $("#plus").click(() => {
        $("#plus-cancel").removeClass("hidden")
        $("#plus").addClass("hidden")
        $("#input-plus").removeClass("hidden")
    })

    $("#plus-cancel").click(() => {
        $("#plus-cancel").addClass("hidden")
        $("#plus").removeClass("hidden")
        $("#input-plus").addClass("hidden")
        $("#list-result").addClass("hidden")
    })

    var inputValue = ""
    $("#input-plus").keyup(() => {
        inputValue = $("#input-plus").val();
        if (inputValue != null && inputValue !== "") {
            $("#list-result").removeClass("hidden")
            $.ajax({
                type: 'GET',
                url: "/admin/invoiceDetail/searchProduct",
                data: {invoiceId: invoiceId, key: inputValue},
                success: function (data) {
                    $("#list-result").html(data)
                },
                error: (jqXHR) => {
                    alert(jqXHR.responseText)
                }
            });
        } else {
            $("#list-result").addClass("hidden")
        }
    })
})


