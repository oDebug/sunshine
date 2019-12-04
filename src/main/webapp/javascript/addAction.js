$(document).ready(function ($) {
    $('#addActionSaveButton').click(function (e) {
        addNewAction();
    });
})
function addNewAction(){
    var formData = {
        actionType: $('#selectboxActionTypeAdd').val(),
        notes: $('#tboxActionNotes').val(),
        status: $('#selectActionStatus').val(),
        contactId: $('#editContactId').val()
    };
    $.ajax({
        url: "/addAction",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(formData),
        type: "POST",
        success: function (data) {
            $("#actionTableBody").append(createActionTableRow(data));
            $('#addActionModal').modal('hide');
            alert('Action added successfully');
        }
    })
}