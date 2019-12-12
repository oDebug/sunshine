$(document).ready(function ($) {
    $('#addPhoneSaveButton').click(function (e) {
        var phone = {
            id: $('#phoneIdAdd').val(),
            phone: $('#tboxPhoneAdd').val().replace(/\D/g, ''),
            extension: $('#tboxExtensionAdd').val(),
            contactId: $('#editContactId').val(),
            type: $('#selectboxPhoneTypeAdd').val()
        }
        savePhone(phone);
    });
    clearPhoneForm();
})

function savePhone(phone) {
    $.ajax({
        url: "addPhone",
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(phone),
        success: function (data) {
            populatePhones(data);
            $('#editContactModal').modal('show');
        }
    })
}

function clearPhoneForm() {
    $('#phoneIdAdd').val("");
    $('#tboxPhoneAdd').val("");
    $('#tboxExtensionAdd').val("");
    $('#editContactId').val("");
    $('#SelectboxPhoneTypeAdd').val("");
}