$(document).ready(() => {
    $("#form").submit(() => {
        let validation = true

        if ($("#product-id").val() === ""){
            $("#idError").text("Chưa nhập mã sản phẩm")
            validation = false
        }else {
            $("#idError").text("")
        }

        if($("#pr-name").val() === ""){
            $("#nameError").text("Chưa nhập tên sản phẩm")
            validation = false
        }else {
            $("#nameError").text("")
        }


        if (!$("#price").val().match(/^[0-9]+$/)){
            $("#priceError").text("Giá tiền không hợp lệ")
            validation = false
        }
        else {
            $("#priceError").text("")
        }

        if($("#discount-price").val() !== "" && !$("#discount-price").val().match(/^[0-9]+$/)){
            $("#discountError").text("Giá tiền không hợp lệ")
            validation = false
        }else {
            $("#discountError").text("")
        }

        if($(".category").val() === "" ){
            $("#categoryError").text("Chưa chọn danh mục")
            console.log("fds")
            validation = false
        }else {
            $("#categoryError").text("")
        }

        if($("#brand").val() === "" ){
            $("#brandError").text("Chưa nhập thương hiệu")
            validation = false
        }else {
            $("#brandError").text("")
        }


        return validation;
    })

});
