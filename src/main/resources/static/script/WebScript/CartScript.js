$(document).ready(() => {
    $(".quantity").change(function (input) {
        const prDetailCode = input.target.getAttribute("data-prDetail");
        if ($(input.target).val() < 1){
            $(input.target).val(1);
        }
        const quantity = $(input.target).val()
        const price = $("#" + prDetailCode + "-price").attr("data-price");
        const totalPrice = quantity * price;
        $("#" + prDetailCode + "P").text(totalPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }).replace('₫', 'đ'));
        $.ajax({
            type: 'GET',
            data: {prDetailCode: prDetailCode, quantity: quantity},
            url: '/carts/update',
            success: (data) => {
                $("#InfoCart").html(data)
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    })

    $("#btn-submit").click(()=>{
        const result = confirm("Bạn chắc chắn muốn đặt hàng chứ?");
        if (result){
            if ($("#name").val() === "" ||
                $("#phone").val() === "" || isNaN($("#phone").val()) ||
                $("#address").val() === ""){
                alert("Nhập sai hoặc thiếu thông tin")
            }else {
                const shippingFee = $("#shipping-fee").attr("data-shipping");
                const formData = $('#form').serializeArray(); // Lấy dữ liệu form
                formData.push({ name: 'shippingFee', value: shippingFee });

                const url = $('#form').attr('action'); // Lấy URL của form
                const csrfToken = $("meta[name='_csrf']").attr("content");
                const csrfHeader = $("meta[name='_csrf_header']").attr("content");

                $.ajax({
                    type: 'POST',
                    url: url,
                    data: formData,
                    beforeSend: function (xhr) {
                        // Sử dụng tên HTTP header chuẩn và giá trị token
                        xhr.setRequestHeader(csrfHeader, csrfToken);
                    },
                    success:  (data) => {
                        alert("Đặt hàng thành công!")
                        window.location.href="/checkout?invoiceId="+data;
                    },
                    error: (jqXHR) => {
                        alert(jqXHR.responseText)
                    }
                });
            }

        }

    })
})