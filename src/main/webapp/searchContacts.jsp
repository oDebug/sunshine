<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
<body>

<jsp:include page="navbar.jsp"/>

<div class="container"><!--Big Div for padding page -->
    <div class="col"></div>

    <div class="col-12">
        <div class="container mt-3 ml-4">
            <div class="row"><h3 class="ml-3">Manage Contacts</h3></div>

            <div class="row">
                <div class="col-lg-5">
                    <div class="input-group">
                        <form class="input-group-prepend" action="listOrgs">
                            <button class="btn bg-primary text-white" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                            <input type="text" class="form-control" placeholder="Search by contact name" onkeyup="showResults(this.value)">
                        </form>
                    </div>
                </div>


        <div class="form-group col-lg-2 mt-3 ml-auto">
            <button type="button" id="addContactBtn" class="btn btn-primary btn-block" data-toggle="modal" data-target="#inputContact">Add
                Contact
            </button>
        </div>
        <!-- Input Modal -->
        <div class="modal fade" id="inputContact" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
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
                        <form action="addOrg.php" method="POST" id="frmAddOrg" class="needs-validation" novalidate>
                            <div class="form-row justify-content-center">
                                <div class="form-group-col-md-6">
                                    <label class="btn btn-md btn-default" id="churchRadio">
                                        <input class="mr-2" type="radio" name="contactType" id="contactType"
                                               name="ContactType" value="Church" checked required>Church
                                    </label>
                                    <label class="btn btn-md btn-default" id="orgRadio">
                                        <input class="mr-2" type="radio" name="contactType" id="contactType"
                                               value="Organization">Organization/Business
                                    </label>
                                    <label class="btn btn-md btn-default" id="personRadio">
                                        <input class="mr-2" type="radio" name="contactType" id="contactType"
                                               value="Person">Person
                                    </label>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="tboxName">Name</label>
                                    <input type="text" class="form-control" id="tboxName" placeholder="Name"
                                           name="name" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tboxAlias">Alternative Alias</label>
                                    <input type="text" class="form-control" id="tboxAlias" placeholder="Alias"
                                           name="alias" >
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="tboxEmail">Email</label>
                                    <input type="email" class="form-control" id="tboxEmail" placeholder="Email"
                                           name="email" >
                                </div>
                                <div class="form-group col-md-6" id="churchSelect">
                                    <label for="denomination">Denomination</label>
                                    <input type="text" class="form-control" id="tboxDenomination"
                                           placeholder="Denomination" checked name="denomination">
                                </div>
                <div class="form-group col-lg-2 mt-3 ml-auto">
                    <button type="button" class="btn btn-primary btn-block" data-toggle="modal"
                            data-target="#inputContact">Add Contact
                    </button>
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
                                <form name="addContactForm" id="frmAddContact" action="/addContact" method="POST">
                                    <div class="form-row justify-content-center">
                                        <div class="form-group-col-md-6">
                                            <label class="btn btn-md btn-default" id="churchRadio">
                                                <input class="mr-2" type="radio" name="contactType" id="contactType"
                                                       name="ContactType" value="Church" checked>Church
                                            </label>
                                            <label class="btn btn-md btn-default" id="orgRadio">
                                                <input class="mr-2" type="radio" name="contactType" id="contactType"
                                                       value="Organization">Organization/Business
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="tboxName">Name</label>
                                            <input type="text" class="form-control" id="tboxName" placeholder="Name"
                                                   name="name">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="tboxAlias">Alternative Alias</label>
                                            <input type="text" class="form-control" id="tboxAlias" placeholder="Alias"
                                                   name="alias">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="tboxEmail">Email</label>
                                            <input type="email" class="form-control" id="tboxEmail" placeholder="Email"
                                                   name="email">
                                        </div>
                                        <div class="form-group col-md-6" id="churchSelect">
                                            <label for="denomination">Denomination</label>
                                            <input type="text" class="form-control" id="tboxDenomination"
                                                   placeholder="Denomination" checked name="denomination">
                                        </div>

                                        <div class="form-group col-md-6 d-none " id="orgSelect">
                                            <label for="orgType">Type</label>
                                            <input type="text" class="form-control" id="tboxOrgType" placeholder="Type"
                                                   name="orgType">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-2">
                                            <label for="addressDesc">Address Desc.</label>
                                            <input type="text" class="form-control" id="tboxAddressDesc"
                                                   placeholder="Mailing"
                                                   name="addressDesc">
                                        </div>
                                        <div class="form-group col-md-5">
                                            <label for="address1">Address1</label>
                                            <input type="text" class="form-control" id="tboxAddress1"
                                                   placeholder="1234 Main St"
                                                   name="address">
                                        </div>
                                        <div class="form-group col-md-5">
                                            <label for="address2">Address2</label>
                                            <input type="text" class="form-control" id="tboxAddress2"
                                                   placeholder="i.e. Appartment # or Office Room #" name="address2">
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
                                            <input type="text" class="form-control" id="tboxPhone" placeholder="Phone"
                                                   name="phone">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="fax">Fax</label>
                                            <input type="text" class="form-control" id="tboxFax" placeholder="Fax"
                                                   name="fax">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="website">Website URL:</label>
                                            <input type="text" class="form-control" name="website" id="tboxWebsite"
                                                   placeholder="https://example.com">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="facebook">Facebook URL:</label>
                                            <input type="text" class="form-control" name="facebook" id="tboxFacebook"
                                                   placeholder="https://example.com">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="tboxInstagram">Instagram URL:</label>
                                            <input type="text" class="form-control" name="instagram" id="tboxInstagram"
                                                   placeholder="https://example.com">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="tboxTwitter">Twitter URL:</label>
                                            <input type="text" class="form-control" name="twitter" id="tboxTwitter"
                                                   placeholder="https://example.com">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="txtareaInputNote">Note</label>
                                            <textarea class="form-control" name="inputNote" id="txtareaInputNote"
                                                      placeholder=". . ."></textarea>
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
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary add-row" id="submitContact" data-dismiss="modal" data-toggle="modal" data-target="#addContact">Submit</button>
                                        <input type="submit" value="Submit"> <!--Temporary button for testing purposes-->
                                    </div>

                                </form>
                            </div>

                        </div> <!-- end of modal-content-->
                    </div> <!-- end of modal role=document -->
                </div><!-- end of model fade -->

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
    <div class="table-responsive"></div>
    <table id="contactTable" class="table table-hover table-bordered ml-3">
        <caption>Click on a table row to view more contact info and actions.</caption>
        <thead class="thead-dark">
        <tr class="header">
            <th>ID#</th>
            <th >Name</th>
            <th>Contact Type</th>
            <th>Phone#</th>
            <th>Address</th>
        </tr>
        </thead>
        <tbody id="tableResults">
        </tbody>
    </table>
</div>
</div>
<div class="col"></div>
</div> <!-- big div for padding page -->
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
                        <a class='nav-link active' id='info-tab' data-toggle='tab' href='#info' role='tab'
                           aria-controls='info' aria-selected='true'>Info</a>
                    </li>
                    <li class='nav-item'>
                        <a class='nav-link' id='action-tab' data-toggle='tab' href='#action' role='tab'
                           aria-controls='action' aria-selected='false'>Actions</a>
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
                                    <input type="text" class="form-control" id="nameEdit" placeholder="Name">
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
                                    <input type="text" class="form-control" id="denominationEdit"
                                           placeholder="Denomination" checked>
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
                                    <input type="text" class="form-control" id="address1Edit"
                                           placeholder="1234 Main St">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="address2Edit">Address2</label>
                                    <input type="text" class="form-control" id="address2Edit"
                                           placeholder="i.e. Appartment # or Office Room #">
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
                                           placeholder="https://example.com">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="facebookEdit">Facebook URL:</label>
                                    <input type="text" class="form-control" name="facebookEdit" id="facebookEdit"
                                           placeholder="https://example.com">
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
                                <div class="alert alert-success alert-dismissible fade mb-0 pr-0 "
                                     id="submitActionAlert" role="alert">
                                    <strong>Your action was added!</strong>
                                    <button type="button" class="close " aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-5 col-lg-3  ml-md-auto">
                                <button type="button" class="btn btn-primary btn-block" data-toggle="modal"
                                        data-target="#addAction">Add Action
                                </button>
                            </div>
                        </div>


                        <div class="table-responsive">
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
                                <c:forEach var="action" items="${actionTblResults}">
                                    <tr>
                                        <td>${action.getId()}</td>
                                        <td>${action.getCreateDate()}</td>
                                        <td>${action.getDueDate()}</td>
                                        <td>${action.getActionType()}</td>
                                        <td>${action.getNote()}</td>
                                        <td>${action.getCompleted()}</td>
                                        <td>${action.getCompleteDate()}</td>
                                    </tr>
                                </c:forEach>

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


</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="../javascript/popper.min.js"></script>
<script src="../javascript/bootstrap.min.js"></script>
<script>
    $("#frmAddContact").submit(function(e)
    {
        e.preventDefault(); //prevent usual post cycle

        var form = $(this); //set the form that called this method to a var
        var url = form.attr('action');
        alert("Data sent looks like: " + form.serialize());
        $.ajax({
            type:"POST",
            url: url,
            data: form.serialize(), //serialize the form input data
            success: function(data)
            {
                alert(data); //test alert
            }
        });
    })
</script>

<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>
