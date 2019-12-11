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
);

$("#buildActionReport").click(function() {


    var actionTypeArray = $("#actionTypeSelect").val() || [] ;
    var contactTypeArray = $("#contactTypeSelect").val() || [] ;
    var actionStatusArray = $("#actionStatusSelect").val() || [] ;
    var actionStartDate = $("#actionStartDate").val();
    var actionEndDate = $("#actionEndDate").val() ;


    // if (contactTypeArray.length > 0) {

    var Table = function(){
        $('table.display').DataTable({
            "paging": false,
            "searching": false,
            "info": false,
            dom: 'Bfrtip',
            buttons: [
                'csv',
                {
                    extend: 'pdf',
                    text: 'Create PDF'
                },

            ],
            colReorder: true
        });
    }
            $("#contactTypeAlert").removeClass('d-none');
            console.log("Contact Types: " + contactTypeArray.join());
            console.log("contact Type length : " + contactTypeArray.length);
            console.log("Action Types: " + actionTypeArray.join());
            console.log("Action Type length : " + actionTypeArray.length);
            console.log("Action Types: " + actionTypeArray.join());
            console.log("Action Type length : " + actionTypeArray.length);
            console.log("Action Status: " + actionStatusArray.join());
            console.log("Action Status length : " + actionStatusArray.length);
            console.log("Start Date: " + actionStartDate);
            console.log("Start Date length : " + actionStartDate.length);
            console.log("End Date: " + actionEndDate);
            console.log("End Date length : " + actionEndDate.length);
            console.log(isValid());



            $.get("/actionReport", {actionType : actionTypeArray.join(),
                                    contactType : contactTypeArray.join()},
                function(htmlpage) {

                $("html").empty();
                    $("table.display").dataTable({
                        "aaData": htmlpage,
                        "columns" [{
                            "data": "Action.id"
                        }]
                });
                $("html").append(htmlpage);
                console.log("success");



            });

    });


function isValid() {
    var actionTypeArray = $("#actionTypeSelect").val() || [] ;
    var contactTypeArray = $("#contactTypeSelect").val() || [] ;
    var actionStatusArray = $("#actionStatusSelect").val() || [] ;
    var actionStartDate = $("#actionStartDate").val();
    var actionEndDate = $("#actionEndDate").val() ;
    if (contactTypeArray.length > 0 &&
        actionTypeArray.length > 0 &&
        actionStatusArray.length > 0 &&
        actionStartDate.length > 0 &&
        actionEndDate.length)  {
        return true;
    } else {
        return false;
    }
}








