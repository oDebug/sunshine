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

<div class="container-fluid px-5"><!--Big Div for padding page -->
    <div class="row mx-4"> <!-- CONTACTS ROW -->
        <div class="col p-0">
            <h3 class="">Manage Contacts</h3>
        </div>
    </div>
    <div class="row mx-4"><!--SEARCH AND ADD CONTACT BTN ROW-->
        <div class="col px-0">
            <div class="input-group">
                <form class="input-group-prepend" id="searchForm" onsubmit="return false">
                    <button class="btn bg-primary text-white" id="submit-search">
                        <i class="fas fa-search"></i>
                    </button>
                    <input type="text" id="search-string" class="form-control search-bar"
                           placeholder="Search by contact name" onkeyup="keyUpSearch(this.value)">
                </form>
            </div>
        </div>

        <div class="col-2 px-0">
                <button type="button" class="btn btn-primary float-right
" data-toggle="modal" data-target="#inputContact">Add Contact</button>

        </div>

    </div>

    <div class="row mx-4"> <!-- TABLE ROW -->
        <table id="contactTable" class="table table-hover table-bordered">
            <caption>Click on a table row to view more contact info and actions.</caption>
            <thead class="thead-dark">
            <tr class="header">
                <th>ID#</th>
                <th onclick="sortTable(0)">Name</th>
                <th>Contact Type</th>
                <th>Phone</th>
                <th>Address</th>
                <th style="text-align: center;">Map</th>
            </tr>
            </thead>
            <tbody id="tableResults">
            </tbody>
        </table>
    </div>

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

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="../javascript/popper.min.js"></script>
<script src="../javascript/bootstrap.min.js"></script>

</body>
</html>