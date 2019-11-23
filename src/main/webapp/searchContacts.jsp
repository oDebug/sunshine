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
            <div class="row"><h3 class="ml-3">Organization Contacts</h3></div>

            <div class="row">
                <div class="col-lg-5">
                    <div class="input-group">
                        <form class="input-group-prepend">
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
    <div class="table-responsive"></div>
    <table id="contactTable pagination" class="table table-hover table-bordered ml-3">
        <caption>Click on a table row to view more contact info and actions.</caption>
        <thead class="thead-dark">
        <tr class="header">
            <th>ID#</th>
            <th onclick="sortTable(0)">Name</th>
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
                                <tr class='contactID1'>
                                    <td>1</td>
                                    <td>2019-10-21</td>
                                    <td>2019-10-23</td>
                                    <td>Left Message</td>
                                    <td>Call back to get the scuttlebutt</td>
                                    <td>In progress</td>
                                    <td>None</td>
                                    <td class="d-none">1</td>
                                </tr>

                                <tr class='contactID2'>
                                    <td>2</td>
                                    <td>2019-10-21</td>
                                    <td>2019-10-24</td>
                                    <td>Email</td>
                                    <td>Email about tour</td>
                                    <td>In progress</td>
                                    <td>None</td>
                                    <td class="d-none">2</td>
                                </tr>

                                <tr class='contactID2'>
                                    <td>3</td>
                                    <td>2019-10-23</td>
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
                alert("Success: This is ajax at bottom of searchContacts.jsp"); //test alert
            }
        });

        $('#inputContact').modal('hide');
    })
</script>

</body>
</html>