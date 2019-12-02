$(document).ready(function ($) {
    $('#contactTable').on("click", "#tableResults tr", function (e) {
        var id = $(this).attr('id');

        $.ajax({
            url: "getContact",
            type: "GET",
            data: {id: id},
            success: function (data) {
                clearEditForm();
                populateEditForm(data);
                $('#editContactModal').modal('show');
            }
        })
    })
    $("#submit-search").click(function (str) {
        showResults($('#search-string').val());
    });
    showResults("");

    // $('#saveContact').click(function () {
    //     var form = $("form#editContactModal");
    //     $.ajax({
    //         url: "/saveContact",
    //         data: form.serialize(),
    //         type: "POST",
    //         success: function (data) {
    //             window.location = 'searchContacts';
    //
    //         }
    //     })
    // });
});

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
    $('#tlistStates').attr('value', "");
    $('#selectboxAddressesEdit').empty();
    $('#selectboxPhonesEdit').empty();
}



function populateEditForm(data) {
    clearEditForm();
    $('#tboxNameEdit').attr('value', data.name);
    $('#selectboxTypeEdit').attr('value', data.type);
    //$('#tboxEmailEdit').attr('value', data.email);
    $('#tboxStreetEdit').attr('value', data.addresses[0].street);
    //$('#tboxSuiteEdit').attr('value', data.type);
    $('#tboxCityEdit').attr('value', data.addresses[0].city);
    $('#listStates').attr('value', data.addresses[0].state);
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

    generateWebsiteList(data);

}

function keyUpSearch(str) {
    //only run if string has 3+ chars. SOMEWHERE NEEDS TO BE ABLE TO SEARCH WITH 1 CHAR.
    if (str.toString().length > 2) {
        showResults(str);
    } else if (str === "") {
        showResults(str)
    }
}
$('#searchForm').submit(function(e) {
    e.preventDefault();
    var str = $('#search-string').val();
    showResults(str);
});

function showResults(str) {
    var url = "/listOrgs";
    $.ajax({
        url: url,
        type: "GET",
        data: {name: str},
        success: function (data) {
            generateTable(data);
        }
    })
}

function addContact() //dont use
{
    document.getElementById("frmAddContact").submit();
}


function generateTable(data) {
    $("#tableResults").empty(); //empty the table with id="tableResults"
    var table = $("#tableResults"); //store reference to table

    for (var i = 0; i < data.length; i++) //use data to fill rows
    {
        table.append(createRow(data[i]));
    }
}

function createRow(data) {
    geocodeAddress(data); //this is just for testing. Need to send the actual data of the row clicked on.

    var address = data.addresses[0].street + ", " + data.addresses[0].city + " " + data.addresses[0].state + ", " + data.addresses[0].postalCode;
    var mapLink = "https://www.google.com/maps/search/?api=1&query=" + decodeURIComponent(address);

    var trElement = "<tr class=\"clickable-row\" id=" + data.id + ">";
    trElement += "<td>" + data.id + "</td>";
    trElement += "<td>" + data.name + "</td>";
    trElement += "<td>" + data.type + "</td>";
    trElement += "<td>" + data.phones[0].phone + "</td>";
    trElement += "<td>" + address + "</td>";
    trElement += "<td>" + "<a target='_blank' href='" + mapLink + "'><i class='fas fa-map-marked-alt'></i></a>"+ "</td></tr>";
    return trElement;
}

$("#frmAddContact").submit(function (e) {
    e.preventDefault(); //prevent usual post cycle
    var form = $(this); //set the form that called this method to a var
    var url = form.attr('action');
    alert("Data sent looks like: " + form.serialize());
    $.ajax({
        type: "POST",
        url: url,
        data: form.serialize(), //serialize the form input data
        success: function (data) {
            alert("Success: This is ajax at bottom of searchContacts.jsp"); //test alert
        }
    });

    $('#inputContact').modal('hide');
});

function setRemovingAlias(val) {
    document.getElementById("headerAlias").innerHTML = val;
}

function removeAlias() {
    var list = document.getElementById("inputGroupAliases");

    if (list.selectedIndex != 0) {
        var alias = list.options[list.selectedIndex].value;
        alert(alias);
        list.remove(list.selectedIndex);
    } else {
        alert("Select an alias");
    }
}

function geocodeAddress(latest)
{
    var geocoder = new google.maps.Geocoder();
    var address = latest.addresses[0].street + ", " + latest.addresses[0].city + " " + latest.addresses[0].state + ", " + latest.addresses[0].postalCode;
    var coords;
    var bounds = new google.maps.LatLngBounds();

    geocoder.geocode({'address': address}, function(results, status) //Geocode
    {
        if (status === 'OK')
        {
            coords = results[0].geometry.location;

            var map = new google.maps.Map(document.getElementById('mapPane'), {
                center: coords,
                zoom: 14
            });

            var marker = new google.maps.Marker({map: map, position: coords});

        }
        else
        {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}

function showAddress(str) //get address data on the row selected and run chain of callbacks to display map
{
    var url = "/listOrgs";
    $.ajax({
        url: url,
        type: "GET",
        data: {id: str},
        success: function (data) {
            geocodeAddress(data);
        }
    })
}

function addWebsiteListNew() {
    var websiteElement = '<div class="form-row" id="formRowWebsiteNew">';
    websiteElement += '<div class="form-group input-group col">';
    websiteElement += '<input type="text" class="form-control" name="websiteEdit" id="websiteEditNew" value="" placeholder="https://example.com">';
    websiteElement += '<div class="input-group-append">';
    websiteElement += '<button class="btn btn-outline-primary" type="button" onclick="addWebsite()">Add Website</button>';
    websiteElement += '</div></div></div>';

    return websiteElement;
}

$(document).on('hidden.bs.modal', '.modal', function () //Not Working Yet
{
    $('modal:visible').length && $(document.body).addClass('modal-open');
});

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

function fullAddress(data)
{
    return data.street + ", " + data.city + " " + data.state + ", " + data.postalCode;
}

function populateWebsites(data, num)
{
    var tbox = "tboxWebsiteEdit" + num;
    var websiteElement = '<div class="form-row" id="formRowWebsite' + num + '">';
    websiteElement += '<div class="form-group input-group col">';
    websiteElement += '<input type="text" class="form-control" name="websiteEdit' + num + '" id="'+ tbox + '" value="' + data[num].socialMediaAddress + '" placeholder="https://example.com">';
    websiteElement += '<div class="input-group-append">';
    websiteElement += '<button class="btn btn-outline-primary" type="button" onclick="updateWebsite(' + num + ',  ' + data[num].id + ')">Update</button>';
    websiteElement += '<a class="btn btn-primary" href="' + data[num].socialMediaAddress + '" role="button">GO</a>';
    websiteElement += '<button class="btn btn-outline-danger" type="button" onclick="deleteWebsite(' + num + ',  ' + data[num].id + ')">Delete</button>';
    websiteElement += '</div></div></div>';

    return websiteElement;
}

function deleteWebsite(num, id) //num is the index of the row item, not the ID.
{
    alert(num + ", " + id);
    //call function to remove website

    var rowToRemove = "formRowWebsite" + num.toString();
    $("#" + rowToRemove).remove();
}

function updateWebsite(num, id)
{

}

function generateWebsiteList(data)
{
    $('#websiteEdit').attr('value', data.socialMedia[0].socialMediaAddress);

    for(x=0; x < data.socialMedia.length; x++)
    {
        $("#websiteCard").append(populateWebsites(data.socialMedia, x));
    }
    $("#websiteCard").append(addWebsiteListNew());
}

function addWebsite()
{
   var website = $("#websiteEditNew").value;
   //Store website

   //clear and update Website card
    $("#websiteCard").empty();

}