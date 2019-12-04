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
    <script src="javascript/editContact.js"></script>
    <script src="javascript/addContact.js"></script>
    <script src="javascript/addAction.js"></script>

    <title>Sunshine Ministries Contacts</title>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container"><!--Big Div for padding page -->
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
                            <input type="text" id="search-string" class="form-control"
                                   placeholder="Search by contact name" onkeyup="keyUpSearch(this.value)">
                        </form>
                    </div>
                </div>

                <div class="form-group col-lg-2 mt-3 ml-auto">
                    <button type="button" class="btn btn-primary btn-block" data-toggle="modal"
                            data-target="#inputContact">Add Contact
                    </button>
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
<div class="col"></div>
</div> <!-- big div for padding page -->

<jsp:include page="editContactModal.jsp"/>
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

<!-- NEW ADDRESS MODAL -->
<%--<div class='modal fade' id="newAddress" tableindex='-1' role="dialog" area-hidden='true'>--%>
<%--    <div class="modal-dialog modal-lg" role='document'>--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class='modal-title'>New Address</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>

<%--            </div>--%>
<%--            <div class='modal-body'>--%>
<%--                <div class="card p-3 mt-2 border-success"> <!-- Address Desc, Address, Address2, City, State, Zip -->--%>
<%--                    <div class="form-row">--%>
<%--                        <div class="form-group col-md-6">--%>
<%--                            <label>Street</label>--%>
<%--                            <input type="text" class="form-control" name="streetNew" id="tboxStreetNew">--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-2">--%>
<%--                            <label>Suite</label>--%>
<%--                            <input type="text" class="form-control" name="suiteNew" id="tboxSuiteNew">--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-4">--%>
<%--                            <label>City</label>--%>
<%--                            <input type="text" class="form-control" name="cityENew" id="tboxCityNew">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-row">--%>
<%--                        <div class="form-group col-md-2">--%>
<%--                            <label>State</label>--%>
<%--                            <input class="form-control" list="statesNew" name="stateNew" id="listStates">--%>
<%--                            <datalist id="statesNew">--%>
<%--                                <option value="MO">--%>
<%--                                <option value="IL">--%>
<%--                            </datalist>--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-2">--%>
<%--                            <label>Zip</label>--%>
<%--                            <input type="text" class="form-control" name="zipEdit" id="tboxZipEdit">--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-5">--%>
<%--                            <label>Descr.</label>--%>
<%--                            <input type="text" class="form-control" name="addressDescrEdit" id="tboxAddressDescrEdit">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>--%>
<%--                <button type='button' class='btn btn-primary' id="submitAction" data-dismiss='modal'>Submit</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="../javascript/popper.min.js"></script>
<script src="../javascript/bootstrap.min.js"></script>

</body>
</html>