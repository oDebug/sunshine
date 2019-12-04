$(document).ready(function ($) {
    $('#editSaveButton').click(function (e) {
        updateContact();
    });
    $('#addActionButton').click(function(e) {
        $('#addActionModal').modal('show');
    })
});

function clearEditForm() {
    $('#editContactId').val("");
    $('#tboxNameEdit').val("");
    $('#selectboxTypeEdit').val("");
    $('#tboxDenomination').val("");
    $("#websiteCard").val("");
    $('#tboxStreetEdit').val("");
    $('#tboxCityEdit').val("");
    $('#tboxZipEdit').val("");
    $('#tboxAddressDescrEdit').val("");
    $('#tboxEmailEdit').val("");
    $('#tboxSuiteEdit').val("");
    $('#tboxPhoneEdit').val("");
    $('#tboxPhoneTypeEdit').val("");
    $('#tlistStatesEdit').val("");
    $('#selectboxAddressesEdit').empty();
    $('#selectboxPhonesEdit').empty();
}
function populateEditForm(data) {
    clearEditForm();
    $('#editContactId').val(data.id);
    $('#tboxNameEdit').val(data.name);
    $('#selectboxTypeEdit').val(data.type);
    $('#tboxEmailEdit').val(data.email);
    $('#tboxStreetEdit').val(data.addresses[0].street);
    $('#tboxSuiteEdit').val(data.addresses[0].suite);
    $('#tboxCityEdit').val(data.addresses[0].city);
    $('#listStatesEdit').val(data.addresses[0].state);
    $('#tboxZipEdit').val(data.addresses[0].postalCode);
    $('#tboxAddressDescrEdit').val(data.addresses[0].addressType);

    for (var x = 0; x < data.addresses.length; x++) {
        //fill list with addresses
        $('#selectboxAddressesEdit').append(new Option(data.addresses[x].addressType), x);
    }

    $('#tboxPhoneEdit').val(data.phones[0].phone);
    $('#tboxPhoneTypeEdit').val(data.phones[0].type);

    for (var x = 0; x < data.phones.length; x++) {
        //fill list with phone numbers
        $('#selectboxPhonesEdit').append(new Option(data.phones[x].type, x));
    }

    $('#selectboxPhonesEdit').append(new Option("New...", "new"));

    generateActionsTableBody(data.actions);

    // generateWebsiteList(data);

}

function generateActionsTableBody(data) {
    $("#actionTableBody").empty(); //empty the table with id="tableResults"
    var table = $("#actionTableBody"); //store reference to table

    for (var i = 0; i < data.length; i++) {
        table.append(createActionTableRow(data[i]));
    }
}

function createActionTableRow(data) {
    var trElement = "<tr id='action" + data.id + "'>";
    trElement += "<td>" + data.createDate + "</td>";
    trElement += "<td>" + data.actionType + "</td>";
    trElement += "<td><input type='text' class='form-control' value='" + data.notes + "'/></td>";
    trElement += "<td><select class='custom-select'>";
    if (data.status === 'Completed') {
        trElement += "<option selected='Completed'>Completed</option>";
        trElement += "<option value='Follow Up'>Follow Up</option>";
    } else {
        trElement += "<option value='Completed'>Completed</option>";
        trElement += "<option selected='Follow Up'>Follow Up</option>";
    }
    trElement += "</select></td>";
    trElement += "</tr>";

    return trElement;
}

function generateWebsiteList(data) {
    // $('#websiteEdit').attr('value', data.socialMedia[0].socialMediaAddress);

    for (x = 0; x < data.socialMedia.length; x++) {
        $("#websiteCard").append(populateWebsites(data.socialMedia, x));
    }
    $("#websiteCard").append(addWebsiteListNew());
}

function addWebsite() {
    var website = $("#websiteEditNew").value;
    //Store website

    //clear and update Website card
    $("#websiteCard").empty();

}

//num is the index of the row item, not the ID.
function deleteWebsite(num, id) {
    alert(num + ", " + id);
    //call function to remove website

    var rowToRemove = "formRowWebsite" + num.toString();
    $("#" + rowToRemove).remove();
}

function typeChange() {
    var x = document.getElementById("selectboxTypeEdit").value;
    var y = document.getElementById("lboxTypeDescriptions");

    if (x == "Church") {
        y.setAttribute("list", "churchTypeDescriptions");
    } else if (x == "Business") {
        y.setAttribute("list", "businessTypeDescriptions");
    } else if (x == "School") {
        y.setAttribute("list", "schoolTypeDescriptions");
    } else if (x == "Person") {
        y.setAttribute("list", "personTypeDescriptions");
    } else if (x == "Organization") {
        y.setAttribute("list", "orgTypeDescriptions");
    } else if (x == "Other") {
        y.setAttribute("list", "");
    }
}

function fullAddress(data) {
    return data.street + ", " + data.city + " " + data.state + ", " + data.postalCode;
}

function populateWebsites(data, num) {
    var tbox = "tboxWebsiteEdit" + num;
    var websiteElement = '<div class="form-row" id="formRowWebsite' + num + '">';
    websiteElement += '<div class="form-group input-group col">';
    websiteElement += '<input type="text" class="form-control" name="websiteEdit' + num + '" id="' + tbox + '" value="' + data[num].socialMediaAddress + '" placeholder="https://example.com">';
    websiteElement += '<div class="input-group-append">';
    websiteElement += '<button class="btn btn-outline-primary" type="button" onclick="updateWebsite(' + num + ',  ' + data[num].id + ')">Update</button>';
    websiteElement += '<a class="btn btn-primary" href="' + data[num].socialMediaAddress + '" role="button">GO</a>';
    websiteElement += '<button class="btn btn-outline-danger" type="button" onclick="deleteWebsite(' + num + ',  ' + data[num].id + ')">Delete</button>';
    websiteElement += '</div></div></div>';

    return websiteElement;
}

function openEditForm(id) {
    $.ajax({
        url: "getContact",
        type: "GET",
        data: {id: id},
        success: function (data) {
            clearEditForm();
            populateEditForm(data);
            $('#editContactModal').modal('show');
            $('.nav-tabs a[href="#edit"]').tab('show');
        }
    })
}

function updateContact() {
    // var addressArray = getAddresses();
    // var phoneArray = getPhones();
    // var actionArray = getActions();

    // var formData = {
    //     name: $('#tboxNameEdit').val(),
    //     type: $('#selectboxTypeEdit').val(),
    //     email: $('#tboxEmailEdit').val(),
    //     description: $('#lboxTypeDescriptions').val(),
    //     street: $('#tboxStreetEdit').val(),
    //     suite: $('#tboxSuiteEdit').val(),
    //     city: $('#tboxCityEdit').val(),
    //     state: $('#listStatesEdit').val(),
    //     zip: $('#tboxZipEdit').val(),
        // addresses: addressArray,
        // phones: phoneArray,
        // actions: actionArray,
}

// function getAddresses() {
//     var addresses = new Array();
//     var divs = $('.address-edit-div').
//
//     return addresses;
// }