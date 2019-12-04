$(document).ready(function ($) {
    $('#contactTable').on("click", "#tableResults tr", function (e) {
        var id = $(this).attr('id');
        openEditForm(id);
    });
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
    var url = "/listContacts";
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
    // geocodeAddress(data); //this is just for testing. Need to send the actual data of the row clicked on.

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

// function geocodeAddress(latest)
// {
//     var geocoder = new google.maps.Geocoder();
//     var address = latest.addresses[0].street + ", " + latest.addresses[0].city + " " + latest.addresses[0].state + ", " + latest.addresses[0].postalCode;
//     var coords;
//     var bounds = new google.maps.LatLngBounds();
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
// }
//
// function showAddress(str) //get address data on the row selected and run chain of callbacks to display map
// {
//     var url = "/listOrgs";
//     $.ajax({
//         url: url,
//         type: "GET",
//         data: {id: str},
//         success: function (data) {
//             geocodeAddress(data);
//         }
//     })
// }

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





