$(document).ready(function ($) {
    $('#addSaveButton').click(function (e) {
        var form = $("form#frmAddContact");
        var formData = {
            name: $('#tboxNameAdd').val(),
            type: $('#selectboxTypeAdd').val(),
            email: $('#tboxEmailAdd').val(),
            description: $('#lboxTypeDescriptions').val(),
            street: $('#tboxStreetAdd').val(),
            suite: $('#tboxSuiteAdd').val(),
            city: $('#tboxCityAdd').val(),
            state: $('#listStatesAdd').val(),
            zip: $('#tboxZipAdd').val(),
            addressType: $('#tboxAddressDescrAdd').val(),
            phone: $('#tboxPhoneAdd').val(),
            phoneType: $('#tboxPhoneTypeAdd').val()
        }
        $.ajax({
            url: "/addContact",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(formData),
            type: "POST",
            success: function (data) {
                $('#inputContact').modal('hide');
                window.location = 'searchContacts';
                alert('Contact added successfully');
            }
        })
    })
})