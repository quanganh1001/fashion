$(document).ready(()=>{
    $("#form-update-info").submit(()=>{
        let validation = true

        if ($("#name").val() === "") {
            $("#name-error").text("Chưa nhập tên")
            validation = false
        } else {
            $("#name-error").text("");
        }

        const email = $("#email").val()
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if(email === ""){
            $("#email-error").text("Chưa nhập email")
            validation = false
        }else if(!emailRegex.test(email)){
            $("#email-error").text("Email không đúng định dạng")
            validation = false
        }else {
            $("#email-error").text("")
        }

        if ($("#phone").val() === "") {
            $("#phone-error").text("Chưa nhập số điện thoại")
            validation = false
        } else if (!$("#phone").val().match(/^[0-9]{10}$/)) {
            $("#phone-error").text("Số không hợp lệ")
            validation = false
        } else {
            $("#phoneError").text("");
        }


        if ($("#address").val() === "") {
            validation = false
            $("#address-error").text("Chưa nhập địa chỉ")
        } else {
            $("#address-error").text("");
        }

        return validation;
    })

})