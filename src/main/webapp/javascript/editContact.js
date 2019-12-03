function clearEditForm() {
    $('#tboxNameEdit').attr('value', "");
    $('#selectboxTypeEdit').attr('value', "");
    // $('#tboxDenomination').attr('value', "");
    $("#websiteCard").empty();
    $('#tboxStreetEdit').attr('value', "");
    $('#tboxCityEdit').attr('value', "");
    $('#tboxZipEdit').attr('value', "");
    $('#tboxAddressDescrEdit').attr('value', "");
    //$('#tboxEmailEdit').attr('value', "");
    //$('#tboxSuiteEdit').attr('value', "");
    $('#tboxPhoneEdit').attr('value', "");
    $('#tboxPhoneTypeEdit').attr('value', "");
    $('#tlistStatesEdit').attr('value', "");
    $('#selectboxAddressesEdit').empty();
    $('#selectboxPhonesEdit').empty();
};

function populateEditForm(data) {
    clearEditForm();
    $('#tboxNameEdit').attr('value', data.name);
    $('#selectboxTypeEdit').attr('value', data.type);
    //$('#tboxEmailEdit').attr('value', data.email);
    $('#tboxStreetEdit').attr('value', data.addresses[0].street);
    //$('#tboxSuiteEdit').attr('value', data.type);
    $('#tboxCityEdit').attr('value', data.addresses[0].city);
    $('#listStatesEdit').attr('value', data.addresses[0].state);
    $('#tboxZipEdit').attr('value', data.addresses[0].postalCode);
    $('#tboxAddressDescrEdit').attr('value', data.addresses[0].description);

    for (var x = 0; x < data.addresses.length; x++) //fill list with addresses
    {
        $('#selectboxAddressesEdit').append(new Option(fullAddress(data.addresses[x]), x));
    }

    $('#tboxPhoneEdit').attr('value', data.phones[0].phone);
    $('#tboxPhoneTypeEdit').attr('value', data.phones[0].type);

    for (var x = 0; x < data.phones.length; x++) //fill list with phone numbers
    {
        $('#selectboxPhonesEdit').append(new Option(data.phones[x].phone, x));
    }

    $('#selectboxPhonesEdit').append(new Option("New...", "new"));

    // generateWebsiteList(data);

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