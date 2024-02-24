$("#form").submit((event)=>{
    let validation = true
    if($("#username").val()===""){
        $("#username-error").text("Chưa nhập tên đăng nhập")
        validation=false;
    }else {
        $("#username-error").text("")
    }

    if ($("#name").val() === "") {
        $("#name-error").text("Chưa nhập tên")
        validation = false
    } else {
        $("#name-error").text("");
    }

    if ($("#password").val() === "") {
        $("#password-error").text("Chưa nhập mật khẩu")
        validation = false
    }else if ($("#password").val().length < 6 || $("#password").val().length > 25){
        $("#password-error").text("Mật khẩu phải có độ dài từ 6-25 ký tự")
        validation = false
    }else {
        $("#password-error").text("");
    }

    if ($("#password-again").val() ===""){
        $("#password-again-error").text("Chua nhập lại mật khẩu")
        validation = false
    }else if ($("#password").val() !== $("#password-again").val()) {
        $("#password-again-error").text("Nhập lại mật khẩu không khớp")
        validation = false
    }else {
        $("#password-again-error").text("");
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

    if ($("#address").val() === "") {
        validation = false
        $("#address-error").text("Chưa nhập địa chỉ")
    } else {
        $("#address-error").text("");
    }

    return validation;
})