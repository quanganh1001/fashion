$("#btn").click(() => {
    var result = confirm("Bạn có chắc chắn muốn gửi hàng loạt?");
    if (result) {
        const content = $("#content").val()
        const subject = $("#subject").val()
        if(subject === ""){
            $("#object").addClass("bg-danger")
        } else if (content === ""){
            $("#content").addClass("bg-danger")
        }else {
            $.ajax({
                type: 'get',
                data: {content: content,subject:subject},
                url: '/admin/email/send',
                success: (response) => {
                    $("#myModal").modal('show')
                    $("#modal-content").text(response)
                },
                error: (jqXHR) => {
                    alert(jqXHR.responseText)
                }
            });
        }

    }
})