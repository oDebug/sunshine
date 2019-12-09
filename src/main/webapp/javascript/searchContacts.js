$(document).ready(function ($) {
    $("#submit-search").click(function (str) {
        showResults($('#search-string').val());
    });
    $('#summernote').summernote({
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
        ],
    });
    showResults("");
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



function addContact() //dont use
{
    document.getElementById("frmAddContact").submit();
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

// function removeAlias() {
//     var list = document.getElementById("inputGroupAliases");
//
//     if (list.selectedIndex != 0) {
//         var alias = list.options[list.selectedIndex].value;
//         alert(alias);
//         list.remove(list.selectedIndex);
//     } else {
//         alert("Select an alias");
//     }
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





