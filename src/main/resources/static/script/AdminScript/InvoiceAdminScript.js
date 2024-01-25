$(document).ready(() => {
    $("#changeAccount").change((event) => {
        const newSelectAccount = $("#changeAccount").val();
        const filterStatus = $("#table").attr("data-filterStatus")
        $.ajax({
            type: 'GET',
            url: "/admin/invoice/change-list-invoice",
            data: {selectAccount : newSelectAccount, filterStatus: filterStatus},
            success:  (data) => {
                $("#list-invoice").html(data)
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    })

    $(".filter").click( (event) => {
        const newFilterStatus = $(event.target).attr("data-filter-status")
        const selectAccount = $("#table").attr("data-selectAccount");
        $.ajax({
            type: 'GET',
            url: "/admin/invoice/change-list-invoice",
            data: { selectAccount : selectAccount, filterStatus: newFilterStatus},
            success:  (data) => {
                $("#list-invoice").html(data)
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    })
})