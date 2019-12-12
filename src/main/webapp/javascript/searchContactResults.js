$(document).ready(function ($) {
    $('#contactTable').on("click", "#tableResults tr", function (e) {
        var id = $(this).attr('id');
        openEditForm(id);
    });
})

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
    var phone = data.phones[0].phone.toString().split("");
    //phone.reverse();
    var count = 0;
    var four = true;
    var processedPhone = "";
    for (var x = phone.length - 1; x >= 0; x--)
    {
        //after 4, append '-', then append after 3
        if(count == 4 && four)
        {
            processedPhone = '-' + processedPhone;
            processedPhone = phone[x] + processedPhone;
            count = 1;
            four = false;
        }
        else if(count == 3 && !four)
        {
            processedPhone = '-' + processedPhone;
            processedPhone = phone[x] + processedPhone;
            count = 1;
        }
        else
        {
            processedPhone = phone[x] + processedPhone;
            count++;
        }
    }

    var trElement = "<tr class=\"clickable-row\" id=" + data.id + ">";
    trElement += "<td>" + data.id + "</td>";
    trElement += "<td>" + data.name + "</td>";
    trElement += "<td>" + data.type + "</td>";
    trElement += "<td>" + processedPhone + "</td>";
    trElement += "<td>" + address + "</td>";
    trElement += "<td align='center'>" + "<button class='btn map-link' target='_blank' onclick='mapGoogle(\"" + mapLink + "\")'><i class='fas fa-map-marked-alt'></i></button>"+ "</td></tr>";
    return trElement;
}

function mapGoogle(url)
{
    event.stopPropagation();
    window.open(url);
}