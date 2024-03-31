
$(document).ready(()=>{
    $('form#form-delete').submit(function(event) {
        $(this).find('#loading-delete').removeClass('hidden');
    })
})