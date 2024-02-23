$(document).ready(() => {
    $("#form").submit(() => {
        let validation = true

        if($("#code").val() === ""){
            $("#codeError").text("Chưa nhập mã sản phẩm")
            validation = false
        }else {
            $("#codeError").text("")
        }

        if (!$("#quantity").val().match(/^[0-9]+$/)){
            $("#quantityError").text("Số lượng không hợp lệ")
            validation = false
        }
        else {
            $("#quantityError").text("")
        }

        if ($(".color").val() === ""){
            $("#colorError").text("Chưa chọn màu sắc")
            validation = false
        }
        else {
            $("#colorError").text("")
        }

        if ($("#size").val() === ""){
            $("#sizeError").text("Chưa chọn size")
            validation = false
        }
        else {
            $("#sizeError").text("")
        }

        return validation;
    })

})