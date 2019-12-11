$(document).ready(function ($) {
    $('#editSaveButton').click(function (e) {
        updateContact();
    });

    $('#addActionButton').click(function (e) {
        $('#addActionModal').modal('show');
    });

    $('#newAddressButton').click(function (e) {
        $('#addAddressModal').modal('show');
    });

    $('#newPhoneButton').click(function (e) {
        $('#addPhoneModal').modal('show');
    });

    $('#btnAddAlias').click(function (e) {
        addAlias();
    });

    $('#btnRemoveAlias').click(function (e) {
        removeAlias();
    });
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
    $('#summernote').summernote("reset");
}

function populateEditForm(data) {
    clearEditForm();
    $('#editContactId').val(data.id);
    $('#tboxNameEdit').val(data.name);
    $('#selectboxTypeEdit').val(data.type);
    $('#tboxEmailEdit').val(data.email);
    populateAddresses(data.addresses);
    populatePhones(data.phones);
    generateActionsTableBody(data.actions);
    $('#summernote').summernote("code", data.notes);
    $('#nameModalHeader').text(data.name);

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
    typeChange(); //Run method to properly set Description options
}
function populatePhones(data) {
    var sBox = $('#selectboxPhonesEdit');
    sBox.empty();
    $('#phonesCard').empty();

    var card = $('#phonesCard');

    for (var i = 0; i < data.length; i++) {
        card.append(createPhoneItem(data[i]));
        sBox.append(new Option(data[i].type), i);
        if (i === 0) {
            sBox.val(data[i].type)

            var selectedPhone =  $('#' + data[i].type + 'Phone');
            selectedPhone.show();
        }
    }
}
function changeAddress() {
    $('.addressItem').each(function() {
        $(this).hide();
    });
    var selectedAddress =  $('#' + $('#selectboxAddressesEdit').val() + 'Address') //#BusinessAddress, etc.
    selectedAddress.show();
}
function changePhone() {
    $('.phoneItem').each(function() {
        $(this).hide();
    });
    var selectedPhone =  $('#' + $('#selectboxPhonesEdit').val() + 'Phone')
    selectedPhone.show();
}
function createAddressItem(data) {
    var address = data.street + ", " + data.city + " " + data.state + ", " + data.postalCode;
    var mapLink = "https://www.google.com/maps/search/?api=1&query=" + decodeURIComponent(address);
    if(data.suite == null)
    {
        data.suite = "";
    }

    var dataElement = "<div class='addressItem' style='display: none' id='" + data.addressType + "Address'>";
    dataElement += "<div class='form-row align-items-end'>";
    dataElement += "<div class='form-group col-md-6'>";
    dataElement += "<input hidden type='text' id='addressIdEdit' value='" + data.id + "'></input>";
    dataElement += "<label>Street</label>";
    dataElement += "<input type='text' class='form-control' name='streetEdit' id='tboxStreetEdit' value='" + data.street + "'>";
    dataElement += "</div>";
    dataElement += "<div class='form-group col-md-2'>";
    dataElement += "<label>Suite</label>";
    dataElement += "<input type='text' class='form-control' name='suiteEdit' id='tboxSuiteEdit' value='" + data.suite + "'>";
    dataElement += "</div>";

    dataElement += "<div class='form-group col-md-2 pb-3 pl-3'>";
    dataElement += "<a id='mapLinkEdit' class='map-link' target='_blank' href='" + mapLink + "'><i class='fas fa-map-marked-alt'></i></a>";
    dataElement += "</div>";

    dataElement += "</div>";
    dataElement += "<div class='form-row'>";
    dataElement += "<div class='form-group col-md-4'>";
    dataElement += "<label>City</label>";
    dataElement += "<input type='text' class='form-control' name='cityEdit' id='tboxCityEdit' value='" + data.city + "'>";
    dataElement += "</div>";
    dataElement += "<div class='form-group col-md-3'>";
    dataElement += "<label>State</label>";
    dataElement += "<input class='form-control' list='states' name='stateEdit' id='listStatesEdit' value='" + data.state + "'>";
    dataElement += "<datalist id='states'><option value='MO'><option value='IL'></datalist>";
    dataElement += "</div>";
    dataElement += "<div class='form-group col-md-2'>";
    dataElement += "<label>Zip</label>";
    dataElement += "<input type='text' class='form-control' name='zipEdit' id='tboxZipEdit' value='" + data.postalCode + "'>";
    dataElement += "</div>";
    // dataElement += "<div class='form-group col-md-5'>";
    // dataElement += "<label>Descr.</label>";
    // dataElement += "<input type='text' class='form-control' name='addressDescrEdit' id='tboxAddressDescrEdit' value='" + data.addressType + "'>";
    // dataElement += "</div>";
    dataElement += "<div class='form-group col-md-2 align-self-end'>";
    dataElement += "<button type='button' id='editSaveButton' class='btn btn-outline-success mt-2 mx-0'>Save</button>";
    dataElement += "</div>";
    dataElement += "</div>";
    dataElement += "</div>";

    return dataElement;
}
function createPhoneItem(data) {
    var dataElement = "<div class='phoneItem' style='display: none' id='" + data.type + "Phone'>";
        dataElement += "<div class='form-row'>";
            dataElement += "<div class='form-group col-md-6'>";
                dataElement += "<input hidden type='text' id='phoneIdEdit' value='" + data.id + "'>";
                dataElement += "<input hidden type='text' id='phoneTypeEdit' value='" + data.type + "'>";
                dataElement += "<label>Phone</label>";
                dataElement += "<input type='text' class='form-control' name='phoneEdit' id='tboxPhoneEdit' value='" + data.phone +"'>";
            dataElement += "</div>"; //closing form group div
            dataElement += "<div class='form-group col-md-6'>";
                dataElement += "<label>Ext.</label>";
                dataElement += "<input type='text' class='form-control' name='extensionEdit' id='tboxExtensionEdit' value='" + data.extension + "'>";
            dataElement += "</div>"; //closing form group div
        dataElement += "</div>"; //closing form-row div
        dataElement += "<div class='form-row'>";
            dataElement += "<div class='form-group col-md-2 align-self-end mx-0 px-0'>";
                dataElement += "<button id='btnPhoneUpdate' type='button'class='btn btn-outline-success mt-2 mx-0'>Save</button>";
            dataElement += "</div>";

        dataElement += "</div>" ;
    dataElement += "</div>";

    return dataElement.trim();
}
function generateActionsTableBody(data) {
    $("#actionTableBody").empty(); //empty the table with id="tableResults"
    var table = $("#actionTableBody"); //store reference to table

    for (var i = 0; i < data.length; i++) {
        table.append(createActionTableRow(data[i]));
    }
}
function createActionTableRow(data) {
    if(data.dueDate == null)
    {
        data.dueDate = "N/A";
    }


    var trElement = "<tr id='action" + data.id + "'>";
    trElement += "<td>" + data.createDate + "</td>";
    trElement += "<td>" + data.actionType + "</td>";
    trElement += "<td><input type='text' class='form-control' value='" + data.notes + "'/></td>";
    trElement += "<td><select class='custom-select'>";
    if (data.status === 'Completed') {
        trElement += "<option selected='Completed'>Completed</option>";
        trElement += "<option value='Follow Up'>Follow Up</option>";
        trElement += "<option value='Cancelled'>Cancelled</option>";
    } else if(data.status === 'Follow Up'){
        trElement += "<option value='Completed'>Completed</option>";
        trElement += "<option selected='Follow Up'>Follow Up</option>";
        trElement += "<option value='Cancelled'>Cancelled</option>";
    }
    else {
        trElement += "<option value='Completed'>Completed</option>";
        trElement += "<option value='Follow Up'>Follow Up</option>";
        trElement += "<option selected='Cancelled'>Cancelled</option>";
    }
    trElement += "</select></td>";
    trElement += "<td>" + data.dueDate + "</td>";
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
            //geocodeAddress(data);
            $('#editContactModal').modal('show');
            $('.nav-tabs a[href="#edit"]').tab('show');
        }
    })
}

function updateContact() {
    if($('#tboxNameEdit').val() == "")
    {
        $("#validateNameEdit").removeClass("d-none");
        return;
    }

    var contact = getContact();
    var addressArray = getAddresses();
    var phoneArray = getPhones();
    var formData = {
        contact: contact,
        addresses: addressArray,
        phones: phoneArray
};
    $.ajax({
        url: "/updateContact",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(formData),
        type: "POST",
        success: function (data) {
            $('#editContactModal').modal('hide');
            showResults($('#search-string').val());
            alert('Contact updated successfully');
        }
    })
}

function hideValidationEdit()
{
    if(!$("#validateNameEdit").hasClass("d-none"))
    {
        $("#validateNameEdit").addClass("d-none");
    }
}

function getAddresses() {
    var addresses = new Array();
    $('.addressItem').each(function() {
        var formData = {
            id: $(this).find('#addressIdEdit').val(),
            street: $(this).find('#tboxStreetEdit').val(),
            suite: $(this).find('#tboxSuiteEdit').val(),
            city: $(this).find('#tboxCityEdit').val(),
            state: $(this).find('#listStatesEdit').val(),
            postalCode: $(this).find('#tboxZipEdit').val(),
            addressType: $(this).attr('id').replace('Address','')
        }
        addresses.push(formData);
    });

    return addresses;
}

function getPhones() {
    var phones = new Array();
    $('.phoneItem').each(function() {
        var formData = {
            id: $(this).find('#phoneIdEdit').val(),
            phone: $(this).find('#tboxPhoneEdit').val(),
            extension: $(this).find('#tboxExtensionEdit').val(),
            phoneType: $(this).find('#phoneTypeEdit').val()
        }
        phones.push(formData);
    });

    return phones;
}

function getContact() {
    var contact = {
        id: $('#editContactId').val(),
        name: $('#tboxNameEdit').val(),
        type: $('#selectboxTypeEdit').val(),
        email: $('#tboxEmailEdit').val(),
        description: $('#lboxTypeDescriptions').val(),
        notes: $('#summernote').summernote('code')
    }
    return contact;
}
// function geocodeAddress(data) //THIS NOW WORKS
// {
//     var geocoder = new google.maps.Geocoder();
//     var address = data.addresses[0].street + ", " + data.addresses[0].city + " " + data.addresses[0].state + ", " + data.addresses[0].postalCode;
//     var coords;
//     var bounds = new google.maps.LatLngBounds();
//     document.getElementById('mapTabAddress').innerText = address;
//
//     geocoder.geocode({'address': address}, function(results, status) //Geocode
//     {
//         if (status === 'OK')
//         {
//             coords = results[0].geometry.location;
//
//             var map = new google.maps.Map(document.getElementById('mapPane'), {
//                 center: coords,
//                 zoom: 14
//             });
//
//             var marker = new google.maps.Marker({map: map, position: coords});
//
//         }
//         else
//         {
//             alert('Geocode was not successful for the following reason: ' + status);
//         }
//     });
// };

function removeAddress() {
    var addrType =  $('#selectboxAddressesEdit').val();
    var addrId = $('#' + addrType + 'Address').find($('#addressIdEdit')).val();
    $.ajax({
        url: "deleteAddress",
        type: "POST",
        data: {id: addrId},
        success: function (data) {
            $('#selectboxAddressesEdit').empty();
            $('#addressesCard').empty();
            populateAddresses(data)
            alert('Address Deleted')
        },
        fail: function(data) {
            alert(data)
        }
    })
};

function removePhone() {
    var phnType =  $('#selectboxPhonesEdit').val();
    var phnId = $('#' + phnType + 'Phone').find($('#phoneIdEdit')).val();
    $.ajax({
        url: "deletePhone",
        type: "POST",
        data: {id: phnId},
        success: function (data) {
            $('#selectboxPhonesEdit').empty();
            $('#phonesCard').empty();
            populatePhones(data)
            alert('Phone Number Deleted')
        },
        fail: function(data) {
            alert(data)
        }
    })
}

function removeAlias(){
    var formData = {
        aliasId: $("#inputGroupAliases").val() //get selected alias to remove (alias.id)

    };
    $.ajax({
        url: "/removeAlias",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(formData),
        type: "POST",
        success: function (data) {
            //clear and update alias list in inputGroupAliases
        }
    })
}

function addAlias(){
    var formData = {
        alias: $("#tboxNewAlias").val(), //get selected alias to add (alias.id)
        id: $("#editContactId") //get id of contact to append alias to
    };
    $.ajax({
        url: "/addAlias",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(formData),
        type: "POST",
        success: function (data) {
            //clear and update alias list in inputGroupAliases
        }
    })
}

function populateAliases(data) //pass list of aliases associated with contact
{
    $('#inputGroupAliases').empty();
    var list = $('#inputGroupAliases');
    list.append("<option selected>Choose...</option>"); //Always add this option first

    for (var i = 0; i < data.length; i++) //create options
    {
        list.append("<option value='" + data.id.trim() +  "'>" + data.name + "</option>"); // <option value="1">Alias 1</option>, etc.
    }

}