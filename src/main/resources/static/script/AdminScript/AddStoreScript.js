$(document).ready(() => {
    $("#form").submit(() => {
        let validation = true

        if ($("#name").val() === ""){
            $("#nameError").text("Chưa nhập tên cửa hàng")
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


        if($("#time").val() === ""){
            $("#timeError").text("Chưa nhập thời gian hoạt động")
            validation = false
        }else {
            $("#timeError").text("")
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

        if($("#api").val() === ""){
            $("#apiError").text("Chưa nhập link google map")
            validation = false
        }else {
            $("#apiError").text("")
        }

        if($("#city").val() === ""){
            $("#cityError").text("Chưa chọn thành phố")
            validation = false
        }else {
            $("#cityError").text("")
        }

        return validation;
    })
})