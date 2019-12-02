<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Font Awsome
    Fonts and Icons free to use in commercial projects -->
    <link rel="stylesheet" href="../css/all.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/findTable.css">
    <link rel="stylesheet" href="../css/navbar_style.css">
    <link rel="stylesheet" href="../css/addContact_style.css">

<script src="javascript/jquery-3.4.1.min.js"></script>
<script src="javascript/searchContacts.js"></script>

    <title>Sunshine Ministries Contacts</title>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container"><!--Big Div for padding page -->
    <div class="col"></div>

    <div class="col-12">
        <div class="container mt-3 ml-4">
            <div class="row"><h3 class="ml-3">Contacts</h3></div>

            <div class="row">
                <div class="col-lg-5">
                    <div class="input-group">
                        <form class="input-group-prepend" id="searchForm" onsubmit="return false">
                            <button class="btn bg-primary text-white" id="submit-search">
                                <i class="fas fa-search"></i>
                            </button>
                            <input type="text" id="search-string" class="form-control" placeholder="Search by contact name" onkeyup="keyUpSearch(this.value)">
                        </form>
                    </div>
                </div>

                <div class="form-group col-lg-2 mt-3 ml-auto">
                    <button type="button" class="btn btn-primary btn-block" data-toggle="modal"
                            data-target="#inputContact">Add Contact
                    </button>
                </div>
                <!-- Input Modal -->
                <jsp:include page="addContactModal.jsp"/>
                <!-- Confirmed Modal -->
                <div class="modal fade" id="addContact" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addContactTitle">Addition Confirmed!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Your contact was added!
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- end of row class under contact contacts h3 -->
        </div>
    </div>
    <table id="contactTable" class="table table-hover table-bordered ml-3">
        <caption>Click on a table row to view more contact info and actions.</caption>
        <thead class="thead-dark">
        <tr class="header">
            <th>ID#</th>
            <th onclick="sortTable(0)">Name</th>
            <th>Contact Type</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Map</th>
        </tr>
        </thead>
        <tbody id="tableResults">
        </tbody>
    </table>
</div>
</div>
<div class="col"></div>
</div> <!-- big div for padding page -->
<jsp:include page="editContactModal.jsp"/>
<!-- add action modal -->
<div class='modal fade' id="addAction" tableindex='-1' role="dialog" aria-labelledby="addActionLabel"
     area-hidden='true'>
    <div class="modal-dialog modal-lg" role='document'>
        <div class="modal-content">
            <div class="modal-header">

                <h5 class='modal-title' id="addActionLabel">Add Action</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class='modal-body'>
                <div class="form-group">
                    <label for="dateDue">Date Due</label>
                    <input type="date" class="form-control" id="dateDue" placeholder="YYYY-MMMM-DD">
                </div>
                <div class="form-group">
                    <label for="actionType">Type</label>
                    <input list="actionTypeList" type="text" class="form-control" id="actionType"
                           placeholder="Enter or Select Type">
                    <datalist id="actionTypeList">
                        <option value="Emailed"></option>
                        <option value="GIK Drop-off"></option>
                        <option value="GIK Pick-Up"></option>
                        <option value="Left Message"></option>
                        <option value="Phone Call"></option>
                        <option value="Sent Thank You Note"></option>
                        <option value="Tour of Sunshine"></option>
                        <option value="Visit/Speak at Church"></option>
                    </datalist>
                </div>
                <div class="form-group">
                    <label for="actionStatus">Status</label>
                    <select class="custom-select" id="actionStatus">
                        <option value="In Progress" selected>In Progress</option>
                        <option value="Complete">Complete</option>
                        <option value="Lapsed">Lapsed</option>
                        <option value="Canceled">Canceled</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="actionNote">Note</label>
                    <textarea class="form-control" id="actionNote" rows="3" placeholder=". . ."></textarea>
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck">
                        <label class="form-check-label" for="gridCheck">
                            Is this information complete and accurate?
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>
                <button type='button' class='btn btn-primary' id="submitAction" data-dismiss='modal'>Submit</button>
            </div>
        </div>
    </div>
</div>
<!-- NEW ADDRESS MODAL -->
<div class='modal fade' id="newAddress" tableindex='-1' role="dialog" area-hidden='true'>
    <div class="modal-dialog modal-lg" role='document'>
        <div class="modal-content">
            <div class="modal-header">
                <h5 class='modal-title'>New Address</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class='modal-body'>
                <div class="card p-3 mt-2 border-success"> <!-- Address Desc, Address, Address2, City, State, Zip -->
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Street</label>
                            <input type="text" class="form-control" name="streetNew" id="tboxStreetNew">
                        </div>
                        <div class="form-group col-md-2">
                            <label>Suite</label>
                            <input type="text" class="form-control" name="suiteNew" id="tboxSuiteNew">
                        </div>
                        <div class="form-group col-md-4">
                            <label>City</label>
                            <input type="text" class="form-control" name="cityENew" id="tboxCityNew">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-2">
                            <label>State</label>
                            <input class="form-control" list="statesNew" name="stateNew" id="listStates">
                            <datalist id="statesNew">
                                <option value="MO">
                                <option value="IL">
                            </datalist>
                        </div>
                        <div class="form-group col-md-2">
                            <label>Zip</label>
                            <input type="text" class="form-control" name="zipEdit" id="tboxZipEdit">
                        </div>
                        <div class="form-group col-md-5">
                            <label>Descr.</label>
                            <input type="text" class="form-control" name="addressDescrEdit" id="tboxAddressDescrEdit">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>
                <button type='button' class='btn btn-primary' id="submitAction" data-dismiss='modal'>Submit</button>
            </div>
        </div>
    </div>
</div>


</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="../javascript/popper.min.js"></script>
<script src="../javascript/bootstrap.min.js"></script>
<script>
    // $("#frmAddContact").submit(function(e)
    // {
    //     e.preventDefault(); //prevent usual post cycle
    //     var form = $(this); //set the form that called this method to a var
    //     var url = form.attr('action');
    //     alert("Data sent looks like: " + form.serialize());
    //     $.ajax({
    //         type:"POST",
    //         url: url,
    //         data: form.serialize(), //serialize the form input data
    //         success: function(data)
    //         {
    //             alert("Success: This is ajax at bottom of searchContacts.jsp"); //test alert
    //         }
    //     });
    //
    //     $('#inputContact').modal('hide');
    // })
    //
    $('#contactTable').on("click", "#tableResults tr", function(e) {
        //show Modal for id in row
        $('#orgModal').modal('show');
        $('#editContactModal').modal('show');

    });
    //
    // function setRemovingAlias(val) {
    //    document.getElementById("headerAlias").innerHTML = val;
    // }
    //
    // function removeAlias()
    // {
    //    var list = document.getElementById("inputGroupAliases");
    //
    //    if(list.selectedIndex != 0)
    //    {
    //        var alias = list.options[list.selectedIndex].value;
    //        alert(alias);
    //        list.remove(list.selectedIndex);
    //    }
    //    else
    //    {
    //        alert("Select an alias");
    //    }
    // }
    //


    function changeAddress() //Called by onChange attribute of addresses list input
    {
        //Replace inputs within the address section with the address that's now selected
        var selectedAddress = document.getElementById("selectboxAddresses").value; //the id of the address or index #

        //use selectedAddress to find new address data.

        //insert new address data into form fields.

    }

    function addAddress() //Called by "Add New" button onclick.
    {
        //insert address form fields into database

        //refresh selectboxAddresses list to include new address,
        //AJAX call?

    }

    function removeAddress() //Called by "Remove" button onclick.
    {
        //Use id to delete address record
        var selectedAddress = document.getElementById("selectboxAddresses").value;

        //refresh selectboxAddresses list
    }

    function refreshAddressesList() //Either use javascript below or replace the element with an ajax call
    {
        //ajax call to select address data from db and populate the selectbox.
        var addressList = document.getElementById("selectboxAddresses");
        var option = document.createElement('option').appendChild(document.createTextNode('ADDRESS STRING HERE'));
        option.value = 'ID OF ADDRESS';
        addressList.appendChild(option);
    }

    function addPhone()
    {

    }

    function removePhone()
    {

    }

    function refreshPhonesList()
    {

    }

    function phonesChange() //should call after phones list gets populated on page load
    {
        var x = document.getElementById("selectboxPhonesEdit").value; //Either get id corresponding to option or 'new'
        var y = document.getElementById("btnPhoneUpdate"); //UpdateButton

        if(x == "new")
        {
            y.innerHTML = "Add";
        }
        else
        {
            y.innerHTML = "Update";
        }
    }



</script>

</body>
</html>