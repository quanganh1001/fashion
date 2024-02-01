$(document).ready(() => {
    $("#form").submit(() => {
        let validation = true

        if ($("#cat-id").val() === ""){
            $("#idError").text("Chưa nhập mã danh mục")
            validation = false
        }else {
            $("#idError").text("")
        }

        if($("#cat-name").val() === ""){
            $("#nameError").text("Chưa nhập tên danh mục")
            validation = false
        }else {
            $("#nameError").text("")
        }


        return validation;
    })
})