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
        if (oldStatus === 4 && newStatus <= 3) {
            select.value = oldStatus
            alert('Đơn đã gửi thì không thể đổi trạng thái về lúc chưa gửi');
        }
        // kiểm tra nếu đơn chưa gửi thì không thể chuyển trạng thái thành công hoặc hoàn
        else if (oldStatus <= 2 && newStatus >= 4) {
            select.value = oldStatus
            alert("Đơn chưa gửi không thể cập nhập trạng thái đang chuyển, thành công hoặc hoàn")
        } else if (oldStatus === 5 || oldStatus === 6) {
            select.value = oldStatus
            alert("Đơn hàng đã thành công hoặc hoàn thì không thể cập nhập trạng thái")
        }
    })

    $("#btn-submit").click(() => {
        const formData = $('#form').serialize();
        const url = $('#form').attr('action');
        const account = $("#account-id").val();
        const name = $("#name").val();
        const phone = $("#phone").val();
        const newStatus = $("#changeStatus").val();

        if ( name === "" || phone === "" || isNaN(phone)) {
            alert("Nhập thiếu hoặc sai thông tin")
        }else if(account === "" && newStatus >= 3){
            alert("Chưa chia nguồn thì không thể lên đơn")
        }else {
            $.ajax({
                type: 'PUT',
                url: url,
                data: formData,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: (data) => {
                    alert('Đã cập nhật đơn hàng thành công!');
                    window.location.reload();
                },
                error: (jqXHR) => {
                    alert(jqXHR.responseText)
                }
            });
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


