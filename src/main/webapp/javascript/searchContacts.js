
function keyUpSearch(str) {
    //only run if string has 3+ chars. SOMEWHERE NEEDS TO BE ABLE TO SEARCH WITH 1 CHAR.
    if (str.toString().length > 2) {
        showResults(str);
    }
}

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

    var trElement = "<tr class=\"clickable-row\">";
    trElement += "<td>" + data.id + "</td>";
    trElement += "<td>" + data.name + "</td>";
    trElement += "<td>" + data.type + "</td>";
    trElement += "<td>" + data.phones[0].phone + "</td>";
    trElement += "<td>" + address + "</td>";
    trElement += "<td>" + "<a target='_blank' href='" + mapLink + "'><i class='fas fa-map-marked-alt'></i></a>"+ "</td></tr>";
    return trElement;
}


$(document).ready(function ($) {
    $(".clickable-row").click(function() {
        window.location = $(this).data("href");
    });
    $("#submit-search").click(function(str) {
        showResults($('#search-string').val());
    });
    showResults("");
});


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

$(document).on('hidden.bs.modal', '.modal', function () //Not Working Yet
{
    $('modal:visible').length && $(document.body).addClass('modal-open');
});