$(document).ready(() => {
    $("#form").submit(() => {
        let validation = true

        if ($("#color-id").val() === ""){
            $("#idError").text("Chưa nhập mã màu")
            validation = false
        }else {
            $("#idError").text("")
        }

        if($("#name").val() === ""){
            $("#nameError").text("Chưa nhập tên màu")
            validation = false
        }else {
            $("#nameError").text("")
        }

        return validation;
    })
})