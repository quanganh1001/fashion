$(document).ready(() => {
    $("#form-login").attr("action", "/login?url=" + encodeURIComponent(window.location.pathname));

    $("#form").submit(() => {
        let validation = true
        if($("#username").val() === ""){
            $("#usernameError").text("Chưa nhập username")
            $("#error").addClass("hidden")
            validation = false
        }else {
            $("#usernameError").text("")
        }

        if ($("#password").val() === ""){
            $("#passwordError").text("Chưa nhập mật khẩu")
            $("#error").addClass("hidden")
            validation = false
        }
        else {
            $("#passwordError").text("")
        }

        return validation;
    })
})