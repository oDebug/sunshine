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

};

function populateEditForm(data) {
    $('#tboxNameEdit').attr('value', data.name);
    $('#selectboxTypeEdit').attr('value', data.type);
};

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
    var address = data.addresses[0].street + ", " + data.addresses[0].city + " " + data.addresses[0].state + ", " + data.addresses[0].postalCode;
    var mapLink = "https://www.google.com/maps/search/?api=1&query=" + decodeURIComponent(address);

    var trElement = "<tr class=\"clickable-row\" id=" + data.id + ">";
    trElement += "<td><a href='editContact?id=" + data.id + "'>" + data.id + "</a></td>";
    trElement += "<td>" + data.name + "</td>";
    trElement += "<td>" + data.type + "</td>";
    trElement += "<td>" + data.phones[0].phone + "</td>";
    trElement += "<td>" + address + " <a target='_blank' href='" + mapLink + "'>Map</a>" + "</td></tr>";
    return trElement;
};

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
};

function removeAlias() {
    var list = document.getElementById("inputGroupAliases");

    if (list.selectedIndex != 0) {
        var alias = list.options[list.selectedIndex].value;
        alert(alias);
        list.remove(list.selectedIndex);
    } else {
        alert("Select an alias");
    }
};

function typeChange() {
    var x = document.getElementById("selectboxType").value;
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