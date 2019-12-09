<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Font Awsome
     Fonts and Icons free to use in commercial projects -->
    <link rel="stylesheet" href="css/all.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/navbar_style.css">
    <link rel="stylesheet" href="css/dash_style.css">

    <script src="javascript/jquery-3.4.1.min.js"></script>
    <script src="javascript/popper.min.js"></script>
    <script src="javascript/bootstrap.min.js"></script>
    <script src="javascript/editContact.js"></script>
    <script src="javascript/searchContactResults.js"></script>
    <script src="javascript/addContact.js"></script>
    <script src="javascript/addAction.js"></script>
    <script src="javascript/dashboard.js"></script>

    <title>Sunshine Ministries Contacts</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<!-- HOME SECTION -->

<div class="container-fluid h-100" id="bgContainer">
<div class="row">
    <div class="col-2"></div>
<div class="col">
<div class="card bg-light text-center card-form mt-3 text-dark">
    <div class="card-header"><h4>Follow Up</h4></div>
    <div class="card-body" style="padding: 0">
        <div class="table-responsive-md">
            <table id="actionTableDashboard" class="table table-primary table-hover">
                <thead class="thead-dark">
                <th>Action ID#</th>
                <th>Contact Name</th>
                <th>Date Created</th>
<%--                                    <th>FollowUp Date</th>--%>
                <th>Note</th>
                </thead>
                <tbody id="actionTableResultsDashboard">
                <c:forEach var="action" items="${upcomingActions}">
                    <tr id="${action.getContact().getId()}">
                        <td>${action.getId()}</td>
                        <td>${action.getContact().getName()}</td>
                        <td>${action.getCreateDate()}</td>
<%--                                            <td>${action.getDueDate()}</td>--%>
                        <td>${action.getNotes()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="card bg-light text-center card-form mt-3 text-dark">
    <div class="card-header"><h4>Recently Added Contacts</h4></div>
    <div class="card-body" style="padding: 0">
        <div class="table-responsive">
            <jsp:include page="searchContactResults.jsp" />

        </div>
    </div>
</div>
</div>
<div class="col-2"></div>
</div>
</div>


<jsp:include page="editContactModal.jsp" />
<jsp:include page="addContactModal.jsp" />


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->


</body>
</html>
