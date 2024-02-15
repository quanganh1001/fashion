$(document).ready(() =>{
    $("#form").submit(() => {
        let validation = true
        if ($("#name").val() === "") {
            $("#name-error").text("Chưa nhập tên")
            validation = false
        }else {
            $("#name-error").text("")
        }

        if ($("#phone").val() === "") {
            $("#phone-error").text("Chưa nhập số điện thoại")
            validation = false
        } else if (!$("#phone").val().match(/^[0-9]{10}$/)) {
            $("#phone-error").text("Số không hợp lệ")
            validation = false
        } else {
            $("#phone-error").text("");
        }


        if ($("#feedback").val() === "") {
            $("#feedback-error").text("Chưa nhập phản hồi")
            validation = false
        } else {
            $("#feedback-error").text("");
        }

        return validation;
    })
})