$(document).ready(function($) {
    $('#addAddressSaveButton').click(function (e) {
        var address = {
            contactId: $('#editContactId').val(),
            street: $('#tboxStreetAdd').val(),
            suite: $('#tboxSuiteAdd').val(),
            city: $('#tboxCityAdd').val(),
            state: $('#listStatesAdd').val(),
            postalCode: $('#tboxZipAdd').val(),
            addressType: $('#selectboxAddressTypeAdd').val()
        }
        saveAddress(address);
    });
})
function saveAddress(address) {
    $.ajax({
        url: "addAddress",
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(address),
        success: function (data) {
            populateAddresses(data);
            $('#addAddressModal').modal('hide');
        }
    })
}