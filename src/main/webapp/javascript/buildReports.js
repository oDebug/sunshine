//toggles the forms for the reports
$("#reportType input").on('click',(function() {
    var reportType = "";
     reportType = $("#reportType input:checked").val();


    if (reportType == "Action") {
        $("#frmActionReport").removeClass("d-none");
    } else {
        $("#frmActionReport").addClass("d-none");
    }
})
)

$("#buildActionReport").click(function() {


        var actionTypeForm = $("#actionTypeSelect:checked").val() || [] ;
        var contactTypeForm = $("#contactTypeSelect:checked").val() || [] ;

            $("#contactTypeAlert").removeClass('d-none');
            console.log("Action Types: " + actionTypeForm.join());
            $.get("/actionReport", {actionType : actionTypeForm.join(),
                                    contactType : contactTypeForm.join()},function(htmlpage) {
                $("html").empty();
                $("html").append(htmlpage);
            });

    })








