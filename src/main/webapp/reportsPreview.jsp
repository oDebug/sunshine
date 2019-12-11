<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<div class="container mt-3 ml-4">
    <div class="row"><h3 class="ml-3">Report Preview</h3></div>
</div>
<table id="actionReportTable" class="table table-hover table-bordered display">
    <thead class="thead-dark">
    <tr class="header">
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
            <td><fmt:formatDate pattern = "yyyy-MM-dd"
                                value = "${r.createDate}" /></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<table id="table_id" class="table table-hover table-bordered display">
    <thead class="thead-dark">
    <tr class="header">
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


    </tbody>
</table>





<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="javascript/jquery-3.4.1.min.js"></script>

<script src="javascript/popper.min.js"></script>
<script src="javascript/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="DataTables/datatables.min.js"></script>
<script src="javascript/buildReports.js"></script>

<%--<script>--%>

<%--    $('#example').DataTable( {--%>
<%--        data: ${results},--%>
<%--        columns: [--%>
<%--            &lt;%&ndash;{ data: '${results.contact.id}' },&ndash;%&gt;--%>
<%--            &lt;%&ndash;{ data: '${results.contact.name}' },&ndash;%&gt;--%>
<%--            &lt;%&ndash;{ data: '${results.contact.type}' },&ndash;%&gt;--%>
<%--            &lt;%&ndash;{ data: ${results.id} },&ndash;%&gt;--%>
<%--            &lt;%&ndash;{ data: ${results.actionType} },&ndash;%&gt;--%>
<%--            &lt;%&ndash;{ data: ${results.status} },&ndash;%&gt;--%>
<%--            &lt;%&ndash;{ data: ${results.notes} }&ndash;%&gt;--%>
<%--            { data: 'id' }--%>


<%--        ]--%>
<%--    } );--%>
<%--</script>--%>
<script>
    $(document).ready(function(){
        console.log.(${results});
    })
</script>


</body>
</html>