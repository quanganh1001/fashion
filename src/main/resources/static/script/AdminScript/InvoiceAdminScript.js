$(document).ready(() => {
    $("#changeAccount").change((event) => {
        const newSelectAccount = $("#changeAccount").val();
        const filterStatus = $("#table").attr("data-filterStatus")
        $.ajax({
            type: 'GET',
            url: "/admin/invoice/change-list-invoice",
            data: {selectAccount: newSelectAccount, filterStatus: filterStatus},
            success: (data) => {
                $("#list-invoice").html(data)
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    })

    $(".filter").click(function (event) {
        const newFilterStatus = $(event.target).attr("data-filter-status")
        const selectAccount = $("#table").attr("data-selectAccount");
        $.ajax({
            type: 'GET',
            url: "/admin/invoice/change-list-invoice",
            data: {selectAccount: selectAccount, filterStatus: newFilterStatus},
            success: (data) => {
                $("#list-invoice").html(data)
                const id = $(this).attr("id");
                $(".filter").removeClass("bg-dark text-white ")
                if (newFilterStatus === id) {
                    $(this).addClass("bg-dark text-white");
                }
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    })
})