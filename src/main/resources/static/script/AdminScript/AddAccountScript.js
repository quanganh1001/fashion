$("#form").submit(()=>{
    let validation = true
    if($("#user-name").val()===""){
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

    if ($("#phone").val() === "") {
        $("#phone-error").text("Chưa nhập số điện thoại")
        validation = false
    } else if (!$("#phone").val().match(/^[0-9]{10}$/)) {
        $("#phone-error").text("Số không hợp lệ")
        validation = false
    } else {
        $("#phone-error").text("");
    }

    const email = $("#email").val()
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if(email === ""){
        $("#email-error").text("Chưa nhập email")
    }else if(!emailRegex.test(email)){
        $("#email-error").text("Email không đúng định dạng")
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