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
    <script src="javascript/jquery-3.4.1.min.js"></script>

    <link rel="stylesheet" href="css/all.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/navbar_style.css">
    <link rel="stylesheet" href="css/index_style.css">
    <link rel="stylesheet" type="text/css" href="DataTables/datatables.css">
    <title>Sunshine Ministries Contacts</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<header id="home-section">
    <div class="dark-overlay">
        <div class="home-inner container">
            <div class="row justify-content-center">

                <div class="col-lg-8">
                    <div class="card bg-primary card-form">
                        <div class="card-header text-center">
                            <h3>Got Report?</h3>
                        </div>
                        <div class="card-body">

                            <div class="form-group row">
                                <legend class="col-form-label col-sm-3 pt-0">Report Type:</legend>
                                <div class="col-sm-9" id="reportType">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="reportType" id="actionTypeReport" value="Action">
                                        <label class="form-check-label" for="actionTypeReport"> Action</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="reportType" id="recordsTypeReport" value="Record Types">
                                        <label class="form-check-label" for="recordsTypeReport">Records Types</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="reportType" id="lapsedRecordReport" value="Lapsed Records">
                                        <label class="form-check-label" for="lapsedRecordReport">Lapsed Records</label>
                                    </div>
                                    <div class="alert alert-danger mt-3 d-none" id="reportTypeAlert" role="alert">
                                        <strong>Please select a report type.</strong>
                                    </div>
                                </div>

                            </div>
                            <jsp:include page="actionReports.jsp"/>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</header>
<script src="./javascript/popper.min.js"></script>
<script src="./javascript/bootstrap.min.js"></script>
<script src="./DataTables/datatables.min.js"></script>
<script src="./javascript/buildReport.js"></script>

</body>

</html>
