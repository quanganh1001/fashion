
$(document).ready(() =>{
    $(".filter").click(function () {
        // Lấy giá trị của thuộc tính data-filter của phần tử được click
        var filterStatus = $(this).data('filter');
        console.log(filterStatus)
        // Xử lý sự kiện ở đây
        $.ajax({
            type: 'GET',
            url: "/admin/invoice/filter/" + filterStatus + "?key=", // Replace with your actual endpoint-->
            success:  ()=> {
                window.location.href="/admin/invoice/filter/" + filterStatus + "?key=";
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    });
});

