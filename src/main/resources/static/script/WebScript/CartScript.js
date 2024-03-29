$(document).ready(() => {
    $(".quantity").change(function (input) {
        const prDetailCode = input.target.getAttribute("data-prDetail");
        if ($(input.target).val() < 1) {
            $(input.target).val(1);
        }
        const quantity = $(input.target).val()
        const price = $("#" + prDetailCode + "-price").attr("data-price");
        const totalPrice = quantity * price;
        $("#" + prDetailCode + "P").text(totalPrice.toLocaleString('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).replace('₫', 'đ'));
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

    $("#form").submit(function () {
        let validation = true
        if ($("#name").val() === "") {
            $("#nameError").text("Chưa nhập tên")
            validation = false
        } else {
            $("#nameError").text("")
        }

        if ($("#phone").val() === "") {
            $("#phoneError").text("Chưa nhập số điện thoại")
            validation = false
        } else if (!$("#phone").val().match(/^[0-9]{10}$/)) {
            $("#phoneError").text("Số không hợp lệ")
            validation = false
        } else {
            $("#phoneError").text("");
        }

        if ($("#address").val() === "") {
            validation = false
            $("#addressError").text("Chưa nhập địa chỉ")
        } else {
            $("#addressError").text("");
        }


        if(validation){
            const paymentMethodRadios = document.getElementsByName('paymentMethod');

            for (let i = 0; i < paymentMethodRadios.length; i++) {
                if (paymentMethodRadios[i].checked) {
                    var selectedPaymentMethod = paymentMethodRadios[i].value;
                    break;
                }
            }

            if (selectedPaymentMethod === "vnpay") {
                var formData = $("#form").serialize();
                // formData.push({ name: "isPaid", value: "true" });
                // formData = $.param(formData); // Chuyển đổi mảng formData thành chuỗi truy vấn
                $.ajax({
                    type: 'GET',
                    url: "/api/vnpay/create-payment",
                    data: formData,
                    success: (data) => {
                        console.log(data)
                        window.location.href = data;
                    },
                    error: (jqXHR) => {
                        alert(jqXHR.responseText)
                    }
                });
                return false;
            }else if(selectedPaymentMethod === "cash"){
                return true;
            }else {
                $("#modal-content").text("Chưa chọn hình thức thanh toán")
                $('#myModal').modal('show');
                return false;
            }
        }else return false

    })
})