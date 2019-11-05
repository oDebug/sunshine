<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Font Awsome
Fonts and Icons free to use in commercial projects -->
<link rel="stylesheet" href="../css/all.min.css" >

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/findTable.css" >
<link rel="stylesheet" href="../css/addContact_style.css" >

<title>Sunshine Ministries Contacts</title>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-3 ml-4">
    <div class="row"><h3 class="ml-3">Organization Contacts</h3></div>
    <div class="row">
        <div class="col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <button class="btn bg-primary text-white" type="button" ><i class="fas fa-search"></i></button>
                </div>
                <input type="text" class="form-control" placeholder="Search by contact name" onkeyup="showResults(this.value)">
            </div>
        </div>


        <div class="form-group col-lg-2 mt-3 ml-auto">
            <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#inputContact">Add Contact</button>
        </div>
        <!-- Input Modal -->
        <div class="modal fade" id="inputContact" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-lg modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Input Contact Info</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- input form -->
                        <form action="addOrg.php" method="POST" id="frmAddOrg">
                            <div class="form-row justify-content-center">
                                <div class="form-group-col-md-6">
                                    <label class="btn btn-md btn-default" id="churchRadio">
                                        <input class="mr-2" type="radio" name="contactType" id="contactType" name="ContactType" value="Church" checked>Church
                                    </label>
                                    <label class="btn btn-md btn-default" id="orgRadio">
                                        <input class="mr-2" type="radio" name="contactType"id="contactType" value="Organization">Organization/Business
                                    </label>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="tboxName">Name</label>
                                    <input type="text" class="form-control" id="tboxName" placeholder="Name" name="name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tboxAlias">Alternative Alias</label>
                                    <input type="text" class="form-control" id="tboxAlias" placeholder="Alias" name="alias">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="tboxEmail">Email</label>
                                    <input type="email" class="form-control" id="tboxEmail" placeholder="Email" name="email">
                                </div>
                                <div class="form-group col-md-6" id="churchSelect">
                                    <label for="denomination">Denomination</label>
                                    <input type="text" class="form-control" id="tboxDenomination" placeholder="Denomination" checked name="denomination">
                                </div>

                                <div class="form-group col-md-6 d-none " id="orgSelect">
                                    <label for="orgType">Type</label>
                                    <input type="text" class="form-control" id="tboxOrgType" placeholder="Type" name="orgType">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    <label for="addressDesc">Address Desc.</label>
                                    <input type="text" class="form-control" id="tboxAddressDesc" placeholder="Mailing" name="addressDesc">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="address1">Address1</label>
                                    <input type="text" class="form-control" id="tboxAddress1" placeholder="1234 Main St" name="address">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="address2">Address2</label>
                                    <input type="text" class="form-control" id="tboxAddress2" placeholder="i.e. Appartment # or Office Room #" name="address2">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="city">City</label>
                                    <input type="text" class="form-control" id="tboxCity" name="city">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="state">State</label>
                                    <!-- <input type="text" id="tboxState" class="form-control" name="state"> -->
                                    <input class="form-control" list="states" name="state">
                                    <datalist id="states">
                                        <option value="MO">
                                        <option value="IL">
                                    </datalist>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="zip">Zip</label>
                                    <input type="text" class="form-control" id="tboxZip" name="zip">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" id="tboxPhone" placeholder="Phone" name="phone">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="fax">Fax</label>
                                    <input type="text" class="form-control" id="tboxFax" placeholder="Fax" name="fax">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="website">Website URL:</label>
                                    <input type="text" class="form-control" name="website" id="tboxWebsite" placeholder="https://example.com" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="facebook">Facebook URL:</label>
                                    <input type="text" class="form-control" name="facebook" id="tboxFacebook" placeholder="https://example.com">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="instagram">Instagram URL:</label>
                                    <input type="text" class="form-control" name="instagram" id="tboxInstagram" placeholder="https://example.com">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="twitter">Twitter URL:</label>
                                    <input type="text" class="form-control" name="twitter" id="tboxTwitter"
                                           placeholder="https://example.com">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="inputNote">Note</label>
                                    <textarea  class="form-control" name="inputNote" id="txtareaInputNote" placeholder=". . ."></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck">
                                    <label class="form-check-label" for="gridCheck">
                                        Is this information complete and accurate?
                                    </label>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary add-row" id="submitContact" data-dismiss="modal" data-toggle="modal" data-target="#addContact">Submit</button>
                    </div>
                </div> <!-- end of modal-content-->
            </div> <!-- end of modal role=document -->
        </div><!-- end of model fade -->

        <!-- Confirmed Modal -->
        <div class="modal fade" id="addContact" tabindex="-1" role="dialog"  aria-hidden="true">
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
    </div><!-- end of row class under organization contacts h3 -->
</div>

<div class="table-responsive">
    <table id="contactTable" class="table table-hover table-bordered ml-3">
        <caption>Note: Dates are formated as Year-Month-Day. </br> Click on a table row to view more contact info and actions.</caption>
        <thead class="thead-dark">
        <tr class="header">
            <th>ID#</th>
            <th onclick="sortTable(0)" >Name</th>
            <th>Contact Type</th>
            <th>Phone#</th>
            <th>Email</th>
            <th>Upcoming Action Due</th>
        </tr>
        </thead>
        <tbody id="tblResults">
        </tbody>
    </table>
</div><!-- end div class table responsive -->

<div class='modal fade' id='orgModal' tabindex='-1' role='dialog'>
    <div class='modal-dialog modal-lg' role='document'>
        <div class='modal-content'>
            <div class='modal-header'>

                <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                    <span aria-hidden='true'>&times;</span>
                </button>
            </div>
            <div class='modal-body'>
                <!-- nav tabs -->
                <ul class='nav nav-tabs' id='contactTab' role='tablist'>
                    <li class='nav-item'>
                        <a class='nav-link active' id='info-tab' data-toggle='tab' href='#info' role='tab' aria-controls='info' aria-selected='true'>Info</a>
                    </li>
                    <li class='nav-item'>
                        <a class='nav-link' id='action-tab' data-toggle='tab' href='#action' role='tab' aria-controls='action' aria-selected='false'>Actions</a>
                    </li>
                </ul>
                <div class='tab-content' id='myTabContent'>
                    <!-- info tab -->
                    <div class='tab-pane fade show active' id='info' role='tabpanel' aria-labelledby='info-tab'>
                        <h2 class="mt-3">View and Edit Contact</h2>

                        <form>
                            <div class="form-row justify-content-center">
                                <div class="form-group-col-md-6">
                                    <label class="btn btn-md btn-default" id="rowContact"></label>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nameEdit">Name</label>
                                    <input type="text" class="form-control" id="nameEdit" placeholder="Name" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="aliasEdit">Alternative Alias</label>
                                    <input type="text" class="form-control" id="aliasEdit" placeholder="Alias">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="emailEdit">Email</label>
                                    <input type="email" class="form-control" id="emailEdit" placeholder="Email">
                                </div>
                                <div class="form-group col-md-6" id="denomShow">
                                    <label for="denominationEdit">Denomination</label>
                                    <input type="text" class="form-control" id="denominationEdit" placeholder="Denomination" checked>
                                </div>

                                <div class="form-group col-md-6 d-none " id="orgTypeShow">
                                    <label for="orgTypeEdit">Type</label>
                                    <input type="text" class="form-control" id="orgTypeEdit" placeholder="Type">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    <label for="addressDescEdit">Address Desc.</label>
                                    <input type="text" class="form-control" id="addressDescEdit" placeholder="Mailing">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="address1Edit">Address1</label>
                                    <input type="text" class="form-control" id="address1Edit" placeholder="1234 Main St">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="address2Edit">Address2</label>
                                    <input type="text" class="form-control" id="address2Edit" placeholder="i.e. Appartment # or Office Room #" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="cityEdit">City</label>
                                    <input type="text" class="form-control" id="cityEdit">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="stateEdit">State</label>
                                    <input type="text" id="stateEdit" class="form-control">

                                </div>
                                <div class="form-group col-md-2">
                                    <label for="zipEdit">Zip</label>
                                    <input type="text" class="form-control" id="zipEdit">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="phoneEdit">Phone</label>
                                    <input type="text" class="form-control" id="phoneEdit" placeholder="Phone">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="faxEdit">Fax</label>
                                    <input type="text" class="form-control" id="faxEdit" placeholder="Fax">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="websiteEdit">Website URL:</label>
                                    <input type="text" class="form-control" name="website" id="websiteEdit"
                                           placeholder="https://example.com" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="facebookEdit">Facebook URL:</label>
                                    <input type="text" class="form-control" name="facebookEdit" id="facebookEdit"
                                           placeholder="https://example.com" >
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="instagramEdit">Instagram URL:</label>
                                    <input type="text" class="form-control" name="instagram" id="instagramEdit"
                                           placeholder="https://example.com"
                                    >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="twitterEdit">Twitter URL:</label>
                                    <input type="text" class="form-control" name="twitter" id="twitterEdit"
                                           placeholder="https://example.com"
                                    >
                                </div>

                            </div>

                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck">
                                    <label class="form-check-label" for="gridCheck">
                                        Is this information complete and accurate?
                                    </label>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- aciton tab -->
                    <div class='tab-pane fade' id='action' role='tabpanel' aria-labelledby='action-tab'>

                        <h2 class="mt-2">View Actions</h2>
                        <!-- add action button -->
                        <div class="form-row">
                            <div class="form-group col  mb-0">
                                <div class="alert alert-success alert-dismissible fade mb-0 pr-0 " id="submitActionAlert" role="alert">
                                    <strong>Your action was added!</strong>
                                    <button type="button" class="close "  aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-5 col-lg-3  ml-md-auto">
                                <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#addAction">Add Action</button>
                            </div>
                        </div>



                        <div class="table-responsive" >
                            <table id="actionTable" class="table table-hover table-bordered ">
                                <caption>Note: Dates are formated as Year-Month-Day.</caption>
                                <thead class="thead-dark">
                                <tr class="header">
                                    <th>Action ID</th>
                                    <th>Date Created</th>
                                    <th>Date Due</th>
                                    <th>Type</th>
                                    <th>Recent Notes</th>
                                    <th>Status</th>
                                    <th>Date Completed</th>
                                    <th class="d-none">Contact ID</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class='contactID1'>
                                    <td>1</td>
                                    <td >2019-10-21</td>
                                    <td>2019-10-23</td>
                                    <td>Left Message</td>
                                    <td>Call back to get the scuttlebutt</td>
                                    <td>In progress</td>
                                    <td>None</td>
                                    <td class="d-none">1</td>
                                </tr>

                                <tr class='contactID2'>
                                    <td>2</td>
                                    <td >2019-10-21</td>
                                    <td>2019-10-24</td>
                                    <td>Email</td>
                                    <td>Email about tour</td>
                                    <td>In progress</td>
                                    <td>None</td>
                                    <td class="d-none">2</td>
                                </tr>

                                <tr class='contactID2'>
                                    <td>3</td>
                                    <td >2019-10-23</td>
                                    <td>2019-10-25</td>
                                    <td>GIK Drop-off</td>
                                    <td>Pick up donation of blankets</td>
                                    <td>In progress</td>
                                    <td>None</td>
                                    <td class="d-none">2</td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-primary'>Save changes</button>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>
            </div>
        </div>
    </div>

</div>
<!-- add action modal -->
<div class='modal fade' id="addAction" tableindex='-1' role="dialog" aria-labelledby="addActionLabel" area-hidden='true' >
    <div class="modal-dialog modal-lg" role='document'>
        <div class="modal-content">
            <div class="modal-header">

                <h5 class='modal-title' id="addActionLabel">Add Action</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class='modal-body'>
                <div class="form-group" >
                    <label for="dateDue">Date Due</label>
                    <input type="date" class="form-control" id="dateDue" placeholder="YYYY-MMMM-DD">
                </div>
                <div class="form-group">
                    <label for="actionType" >Type</label>
                    <input list="actionTypeList" type="text" class="form-control" id="actionType" placeholder="Enter or Select Type">
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
                <button type='button' class='btn btn-secondary' data-dismiss= 'modal'>Cancel</button>
                <button type='button' class='btn btn-primary' id="submitAction" data-dismiss= 'modal' >Submit</button>
            </div>
        </div>
    </div>
</div>










</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="../javascript/jquery-3.4.1.slim.min.js"></script>
<script src="../javascript/popper.min.js"></script>
<script src="../javascript/bootstrap.min.js"></script>




<!-- Adding contact Rows -->
<script type="text/javascript">
    $(document).ready(function(){
        $("#submitContact").click(function(){
            var idIndex = $("#contactTable td:first-child").text();
            var newID = idIndex.length + 1;
            var name = $("#tboxName").val();
            var contactType = $('#contactType:checked').val();
            var email = $("#tboxEmail").val();
            var phone = $("#tboxPhone").val();
            var markup = "<tr class='contactID" + newID + "'><td>" + newID + "</td><td>" + name + "</td><td>" +
                contactType + "</td><td>" + phone + "</td><td>" +
                email + "</td><td>" + "None" + "</td></tr>";
            $("#contactTable tbody").append(markup);
        });


    });
</script>
<!-- Adding action Rows -->
<script type="text/javascript">
    $(document).ready(function(){
        $("#submitAction").on('click', function(){
            var date, year, month, day;
            date = new Date();
            year = date.getFullYear();
            month = date.getMonth() + 1;
            day = date.getDate();

            var idIndex = $("#actionTable td:first-child").text();
            var actionID = idIndex.length + 1;
            var contactID = $('#contactIDLabel').text().replace('Contact ID: ', '');
            var dateCreated = year + "-" + month + "-" + day;
            var dateDue = $('#dateDue').val();
            var type = $("#actionType").val();
            var status = $("#actionStatus option:selected").val();
            var note = $.trim($("#actionNote").val());
            var dateCompleted;
            if (status === 'Complete') {
                dateCompleted = year + "-" + month + "-" + day;
            } else {
                dateCompleted = 'None';
            }
            var markup = '<tr class="contactID' + contactID + '"><td >' + actionID + "</td><td>" + dateCreated + "</td><td>" +
                dateDue + "</td><td>" + type + "</td><td>" +
                note + "</td><td>" + status + '</td><td>' + dateCompleted + '</td><td class="d-none">' + contactID + '</td></tr>';
            $("#actionTable tbody").append(markup);
        });


    });

</script>

<!-- action add alert -->
<script>
    $(document).ready(function() {
        $('#submitAction').click(function() {
            $('#submitActionAlert').addClass('show');
            setTimeout(function() {
                $('#submitActionAlert').removeClass('show');
            },3000);
        });
        $('#orgModal').on('hidden.bs.modal', function(e) {
            $('#submitActionAlert').removeClass('show');
        });
    });
</script>


<!-- sorting columns by clicking headers -->
<script>
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("contactTable");
        switching = true;
        // Set the sorting direction to ascending:
        dir = "asc";
        /* Make a loop that will continue until
        no switching has been done: */
        while (switching) {
            // Start by saying: no switching is done:
            switching = false;
            rows = table.rows;
            /* Loop through all table rows (except the
            first, which contains table headers): */
            for (i = 1; i < (rows.length - 1); i++) {
                // Start by saying there should be no switching:
                shouldSwitch = false;
                /* Get the two elements you want to compare,
                one from current row and one from the next: */
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                /* Check if the two rows should switch place,
                based on the direction, asc or desc: */
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                /* If a switch has been marked, make the switch
                and mark that a switch has been done: */
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                // Each time a switch is done, increase this count by 1:
                switchcount ++;
            } else {
                /* If no switching has been done AND the direction is "asc",
                set the direction to "desc" and run the while loop again. */
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }
</script>


<!-- add button contact type -->
<script>
    $('#orgRadio').click(function() {
        $('#churchSelect').addClass("d-none");
        $('#orgSelect').removeClass('d-none');
    });

    $('#churchRadio').click(function() {

        $('#orgSelect').addClass('d-none');
        $('#churchSelect').removeClass('d-none');

    });
</script>




<!-- contact/action info modal -->
<script>
    $('#contactTable tbody').on('click', 'tr', function() {


        if ($('#contactLabel').length) {
            $('#contactLabel').remove();
            $('#contactTitle').remove();
        }
        var rownum = $(this).index() + 1;
        var rowContact = $(this).find('td:nth-of-type(3)').text();
        var contactID = $(this).find('td:nth-of-type(1)').text();

        var name, phone, email, alias, denomination, orgType, addressDesc, address1, address2, city, state, zip, fax, web, facebook, insta, twitter;
        name = $(this).find('td:nth-of-type(2)').text();
        phone = $(this).find('td:nth-of-type(4)').text();
        email = $(this).find('td:nth-of-type(5)').text();
        alias = $(this).find('td:nth-of-type(7)').text();
        addressDesc = $(this).find('td:nth-of-type(9)').text();
        address1 = $(this).find('td:nth-of-type(10)').text();
        address2 = $(this).find('td:nth-of-type(11)').text();
        city = $(this).find('td:nth-of-type(12)').text();
        state = $(this).find('td:nth-of-type(13)').text();
        zip = $(this).find('td:nth-of-type(14)').text();
        fax = $(this).find('td:nth-of-type(15)').text();
        web = $(this).find('td:nth-of-type(16)').text();
        facebook = $(this).find('td:nth-of-type(17)').text();
        insta = $(this).find('td:nth-of-type(18)').text();
        twitter = $(this).find('td:nth-of-type(19)').text();
        $('#orgModal').modal('show');

        $('#orgModal .modal-header').prepend('<h5 class="modal-title" id="contactTitle">' + name + '</h5>')
        $('#rowContact').append('<div id="contactLabel"><label>Contact Type: ' + rowContact + '</label></br><label id="contactIDLabel" >Contact ID: ' + contactID +'</label></div>');
        $('#nameEdit').attr('value', name);
        $('#phoneEdit').attr('value', phone);
        $('#emailEdit').attr('value', email);
        $('#aliasEdit').attr('value', alias);
        $('#addressDescEdit').attr('value', addressDesc);
        $('#address1Edit').attr('value', address1);
        $('#address2Edit').attr('value', address2);
        $('#cityEdit').attr('value', city);
        $('#stateEdit').attr('value', state);
        $('#zipEdit').attr('value', zip);
        $('#faxEdit').attr('value', fax);
        $('#websiteEdit').attr('value', web);
        $('#facebookEdit').attr('value', facebook);
        $('#instagramEdit').attr('value', insta);
        $('#twitterEdit').attr('value', twitter);
        if (rowContact === "Church") {
            $('#orgTypeShow').addClass('d-none');
            $('#denomShow').removeClass('d-none');
            denomination = $(this).find('td:nth-of-type(8)').text();
            $('#denominationEdit').attr('value', denomination);
        } else {
            $('#denomShow').addClass("d-none");
            $('#orgTypeShow').removeClass('d-none');
            orgType = $(this).find('td:nth-of-type(8)').text();
            $('#orgTypeEdit').attr('value', orgType)
        }
    });
    /* displays actions related to specific contact */
    $('#contactTable tbody').on('click', 'tr', function() {
        var contactIDInfoTab = $(this).find('td:nth-of-type(1)').text();
        var contactIDActionTab = $('#actionTable tbody').find('tr:nth-of-type(1)').hasClass('contactID' + contactIDInfoTab);
        $('#actionTable tbody').find('tr').addClass('d-none');
        if ($('#actionTable tbody').find('tr').hasClass('contactID' + contactIDInfoTab)){
            var contactIDClass = '.contactID';
            $('#actionTable tbody').find('.contactID' + contactIDInfoTab).removeClass('d-none');
        }
    });
</script>

<!-- refocus modal after closing top modal modals  -->
<script>
    $(document).on('hidden.bs.modal', '.modal', function() {
        $('.modal:visible').length && $(document.body).addClass('modal-open');
    });
</script>

<!-- show upcoming actions -->
<script>
    (function( $ ) {
        $.fn.getActionDueDate = function() {

            var contactIDCell = $('#contactTable tbody').find('td:nth-of-type(1)');
            var contactID = $( contactIDCell ).map(function() {
                return $(this).text();
            });

            $.each(contactID, function (index, idNum) {

                var classContactID = '.contactID' + idNum;
                var cellElements
                var upcomingAction;
                cellElements= $("#actionTable tbody ").find( classContactID +' td:nth-of-type(3)');

                if (cellElements.length == 0) {
                    upcomingAction = 'None';
                } else {

                    var date = new Date();
                    var currentDay = date.getDate();
                    var currentYear = date.getFullYear();
                    var currentMonth;
                    if (date.getMonth() > 8 ) {
                        currentMonth = date.getMonth() + 1;
                    } else {
                        currentMonth = date.getMonth()  < 10 ? '0' + date.getMonth() : date.getMonth();
                    }
                    var currentDate = currentYear + ', ' + currentMonth + ', ' + currentDay;
                    currentDate = new Date(currentDate);
                    var dates = $( cellElements ).map(function() {
                        if (new Date($(this).text().replace('-', ', ')) >= currentDate ) {
                            return new Date($(this).text().replace('-', ', '));
                        }

                    });
                    dates.sort(function(a,b) {
                        return a-b;
                    });

                    upcomingAction = dates[0];
                    var upcomingYear = upcomingAction.getFullYear();
                    var upcomingDay = upcomingAction.getDate();
                    var upcomingMonth = upcomingAction.getMonth();
                    if (upcomingMonth > 8 ) {
                        upcomingMonth = upcomingAction.getMonth() + 1;
                    } else {
                        upcomingMonth = upcomingAction.getMonth()  < 10 ? '0' + upcomingAction.getMonth() : upcomingAction.getMonth();
                    }
                    upcomingAction = upcomingYear + '-' + upcomingMonth + '-' + upcomingDay;
                }
                console.log('Contact ID: ' + idNum);
                console.log('Upcoming Action Due: ' + upcomingAction)
                var rowID = '.contactID' + idNum;
                $('#contactTable tbody').find(rowID + ' td:nth-of-type(6)').html("");
                $('#contactTable tbody').find(rowID + ' td:nth-of-type(6)').html(upcomingAction);

            });
        };
    })( jQuery );
    $(document).ready(function() {
        $('html').getActionDueDate();
    });
    $('#submitContact').on('click', function() {
        $('html').getActionDueDate();
    });
    $('#orgModal').on('hidden.bs.modal', function(e) {
        $('html').getActionDueDate(e);
    });
</script>

<script>
    //preliminary ajax functionality. Solution to missing HTML in ajax response might be here https://stackoverflow.com/a/30822396
    function showResults(str)
    {
        if(str.length == 0)
        {
            document.getElementById("tblResults").innerHTML = "";
            return;
        }
        else
        {
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function()
            {
                if (this.readyState == 4 && this.status == 200)
                {
                    document.getElementById("tblResults").innerHTML = this.responseText;
                }
            };
            xmlhttp.open("GET", "returnOrg.php?q="+str, true);
            xmlhttp.send();
        }
    }
</script>
</body>
</html>
