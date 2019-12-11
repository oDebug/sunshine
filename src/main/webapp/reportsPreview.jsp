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
    <link rel="stylesheet" href="../DataTables/datatables.min.css">


    <title>Sunshine Ministries Contacts</title>
</head>
<body>

<jsp:include page="navbar.jsp"/>


<p>Output1</p>
<c:forEach var="a" items="${actionType}">
<p><c:out value="${a}"/></p>
</c:forEach>
<p>Output2</p>
Number of Entries: ${size}



<table id="actionReportTable" class="display" >
    <thead>
        <tr>
            <th>Contact ID</th>
            <th>Name</th>
            <th>Contact Type</th>
            <th>Action ID</th>
            <th>Action Type</th>
            <th>Action Status</th>
            <th>Action Note</th>
            <th>Create Date</th>
        </tr>
    </thead>
    <tbody>
<c:forEach var="r" items="${results}">
        <tr>
            <td>${r.contact.id}</td>
            <td>${r.contact.name}</td>
            <td>${r.contact.type}</td>
            <td>${r.id}</td>
            <td>${r.actionType}</td>
            <td>${r.status}</td>
            <td>${r.notes}</td>
            <td>${r.createDate}</td>
        </tr>
</c:forEach>
    </tbody>
</table>

<table id="table_id" class="table table-hover table-bordered display strip hover">
    <thead class="thead-dark">
    <tr class="header">
        <th>Contact Type</th>
        <th>Contact ID</th>
        <th>Name</th>
        <th>Action ID</th>
        <th>Action Type</th>
        <th>Status</th>
        <th>Date</th>
        <th>Note</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>Person</td>
        <td>1</td>
        <td>Morgan Elder</td>
        <td>1</td>
        <td>Emailed</td>
        <td>Completed</td>
        <td>11/6/2019</td>
        <td>None</td>
    </tr>
    <tr>
        <td>Church</td>
        <td>2</td>
        <td>Hazelwood Baptist Church</td>
        <td>2</td>
        <td>Emailed</td>
        <td>Completed</td>
        <td>11/6/2019</td>
        <td>None</td>
    </tr>
    <tr>
        <td>Church</td>
        <td>2</td>
        <td>Hazelwood Baptist Church</td>
        <td>3</td>
        <td>GIK Pick-up</td>
        <td>In progress</td>
        <td>none</td>
        <td>Left over Halloween candies</td>
    </tr>
    <tr>
        <td>Church</td>
        <td>3</td>
        <td>St Louis Cathedral</td>
        <td>4</td>
        <td>Left Message</td>
        <td>Complete</td>
        <td>none</td>
        <td>The pope will be talking next week.</td>
    </tr>

    </tbody>
</table>
<c:forEach var="contact" items="${contactType}"></c:forEach>
${contact}


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="javascript/jquery-3.4.1.min.js"></script>

<script src="./javascript/popper.min.js"></script>
<script src="./javascript/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="./DataTables/datatables.min.js"></script>
<script src="./javascript/buildReports.js"></script>

<script>
    //DataTable initialization
    $(document).ready(function() {
        $('table.display').DataTable();
    } );
</script>
</body>
</html>