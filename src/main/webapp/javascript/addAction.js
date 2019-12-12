$(document).ready(function ($) {
    $('#addActionSaveButton').click(function (e) {
        addNewAction();
    });
});
function addNewAction(){
    var formData = {
        actionType: $('#selectboxActionTypeAdd').val(),
        notes: $('#tboxActionNotesAdd').val(),
        status: $('#selectActionStatusAdd').val(),
        contactId: $('#editContactId').val(),
        dueDate: $('#dateActionDue').val()
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