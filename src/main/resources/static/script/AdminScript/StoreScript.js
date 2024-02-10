$(document).ready(()=>{
    $("#changeCity").change(function (select) {
        const cityId = $(select.target).val();
        $.ajax({
            type: 'GET',
            url: '/admin/store/change-map',
            data: {cityId: cityId},
            success: (data) => {
                $("#store-info").html(data)
            },
            error: (jqXHR) => {
                alert(jqXHR.responseText)
            }
        });
    })
})