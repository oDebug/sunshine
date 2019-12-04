$(document).ready(function ($) {
    $('#editSaveButton').click(function (e) {
        updateContact();
    });
    $('#addActionButton').click(function (e) {
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
    populateAddresses(data.addresses);
    // populatePhones(data.phones);

    $('#tboxStreetEdit').val(data.addresses[0].street);
    $('#tboxSuiteEdit').val(data.addresses[0].suite);
    $('#tboxCityEdit').val(data.addresses[0].city);
    $('#listStatesEdit').val(data.addresses[0].state);
    $('#tboxZipEdit').val(data.addresses[0].postalCode);
    $('#tboxAddressDescrEdit').val(data.addresses[0].addressType);

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

function populateAddresses(data) {
    $('#addressesCard').empty();
    var card = $('#addressesCard');

    for (var i = 0; i < data.length; i++) {
        card.append(createAddressItem(data[i]));
        $('#selectboxAddressesEdit').append(new Option(data[i].addressType), i);
        if (i === 0) {
            $('#selectboxAddressesEdit').val(data[i].addressType)

            var selectedAddress =  $('#' + data[i].addressType + 'Address');
            selectedAddress.show();
        }
    }


}

function changeAddress() {
    $('.addressItem').each(function() {
        $(this).hide();
    });
    var selectedAddress =  $('#' + $('#selectboxAddressesEdit').val() + 'Address')
    selectedAddress.show();
}

function createAddressItem(data) {
    var dataElement = "<div class='addressItem' style='display: none' id='" + data.addressType + "Address'>";
    dataElement += "<div class='form-row'>";
    dataElement += "<div class='form-group col-md-6'>";
    dataElement += "<label>Street</label>";
    dataElement += "<input type='text' class='form-control' name='streetEdit' id='tboxStreetEdit' value='" + data.street + "'>";
    dataElement += "</div>";
    dataElement += "<div class='form-group col-md-2'>";
    dataElement += "<label>Suite</label>";
    dataElement += "<input type='text' class='form-control' name='suiteEdit' id='tboxSuiteEdit' value='" + data.suite + "'>";
    dataElement += "</div>";
    dataElement += "<div class='form-group col-md-4'>";
    dataElement += "<label>City</label>";
    dataElement += "<input type='text' class='form-control' name='cityEdit' id='tboxCityEdit' value='" + data.city + "'>";
    dataElement += "</div>";
    dataElement += "</div>";
    dataElement += "<div class='form-row'>";
    dataElement += "<div class='form-group col-md-3'>";
    dataElement += "<label>State</label>";
    dataElement += "<input class='form-control' list='states' name='stateEdit' id='listStatesEdit' value='" + data.state + "'>";
    dataElement += "<datalist id='states'><option value='MO'><option value='IL'></datalist>";
    dataElement += "</div>";
    dataElement += "<div class='form-group col-md-2'>";
    dataElement += "<label>Zip</label>";
    dataElement += "<input type='text' class='form-control' name='zipEdit' id='tboxZipEdit' value='" + data.zip + "'>";
    dataElement += "</div>";
    dataElement += "<div class='form-group col-md-5'>";
    dataElement += "<label>Descr.</label>";
    dataElement += "<input type='text' class='form-control' name='addressDescrEdit' id='tboxAddressDescrEdit' value='" + data.addressType + "'>";
    dataElement += "</div>";
    dataElement += "<div class='form-group col-md-2 align-self-end'>";
    dataElement += "<button type='button' id='editSaveButton' class='btn btn-outline-success mt-2 mx-0'>Save</button>";
    dataElement += "</div>";
    dataElement += "</div>";
    dataElement += "</div>";

    return dataElement;
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