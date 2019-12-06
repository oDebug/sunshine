$(document).ready(function ($) {
    $('#addSaveButton').click(function (e) {
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
            phoneType: $('#selectboxPhoneTypeAdd').val(),
            extenstion: $('#tboxExtensionAdd').val()
        };
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
});

function typeChangeAdd() {
    var x = document.getElementById("selectboxTypeAdd").value;
    var y = document.getElementById("lboxTypeDescriptionsAdd");

    if (x == "Church") {
        y.setAttribute("list", "churchTypeDescriptionsAdd");
    } else if (x == "Business") {
        y.setAttribute("list", "businessTypeDescriptionsAdd");
    } else if (x == "School") {
        y.setAttribute("list", "schoolTypeDescriptionsAdd");
    } else if (x == "Person") {
        y.setAttribute("list", "personTypeDescriptionsAdd");
    } else if (x == "Organization") {
        y.setAttribute("list", "orgTypeDescriptionsAdd");
    } else if (x == "Other") {
        y.setAttribute("list", "");
    }
}
