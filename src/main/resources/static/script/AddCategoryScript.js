$(document).ready(() => {
    $("#form").submit((event) => {
        event.preventDefault();

        if ($("#catId").val() === "" ||
            $("#cat_name").val() === "" ) {
            alert("Nhập sai hoặc thiếu thông tin");
            return;
        }
        alert("Thêm thành công!")
        $("#form")[0].submit();
    });
});