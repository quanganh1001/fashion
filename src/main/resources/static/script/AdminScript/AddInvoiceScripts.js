$(document).ready(() => {
    $("#form").submit(() => {
        let validation = true

        if ($("#name").val() === ""){
            $("#nameError").text("Chưa nhập tên khách hàng")
            validation = false
        }else {
            $("#nameError").text("")
        }

        if($("#address").val() === ""){
            $("#addressError").text("Chưa nhập địa chỉ")
            validation = false
        }else {
            $("#addressError").text("")
        }

        if ($("#phone").val() === "") {
            $("#phoneError").text("Chưa nhập số điện thoại")
            validation = false
        }else if (!$("#phone").val().match(/^[0-9]{10}$/)){
            $("#phoneError").text("Số không hợp lệ")
            validation = false
        } else {
            $("#phoneError").text("");
        }

        return validation;
    })
})