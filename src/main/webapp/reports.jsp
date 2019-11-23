<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!doctype html>
<html lang="en">
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
    <link rel="stylesheet" href="../css/index_style.css">

    <script src="javascript/jquery-3.4.1.min.js"></script>

    <title>Sunshine Ministries Contacts</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

    <header id="home-section">
        <div class="dark-overlay">
            <div class="home-inner container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="card bg-primary card-form">
                            <div class="card-header text-center">
                                <h3>Got Action?</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <legend class="col-form-label col-sm-3 pt-0">Report Type:</legend>
                                    <div class="col-sm-9">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="reportType" id="reportType" value="Action">
                                            <label class="form-check-label" for="reportType">Action</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">Contact Type:</div>
                                    <div class="col-sm-9">
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="orgType" >
                                            <label class="form-check-label" for="orgType">
                                                Organization
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="churchType" >
                                            <label class="form-check-label" for="churchType">
                                                Church
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="personType" >
                                            <label class="form-check-label" for="personType">
                                                Person
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="actionTypeSelect" class="col-sm-3 col-form-label">Action Type:</label>
                                    <div class="col-sm-9">
                                        <div class="form-group">
                                            <select multiple class="form-control" name="actionTypeSelect" id="actionTypeSelect">
                                                <option>Emailed</option>
                                                <option>GIK Drop-off</option>
                                                <option>GIK Pick-up</option>
                                                <option>Left Message</option>
                                                <option>Phone Call</option>
                                                <option>Sent Thank You Note</option>
                                                <option>Tour of Sunshine</option>
                                                <option>Visit/Speak at Church</option>
                                                <option>Other</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="actionStatusSelect" class="col-sm-3 col-form-label">Action Status:</label>
                                    <div class="col-sm-9">
                                        <div class="form-group">
                                            <select multiple class="form-control" name="actionStatusSelect" id="actionStatusSelect">
                                                <option>In progress</option>
                                                <option>Completed</option>
                                                <option>Lasped</option>
                                                <option>Canceled</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-3">Date Type:</div>
                                    <div class="col-sm-9">
                                        <div class="form-group">
                                            <select class="custom-select" id="dateType">
                                                <option selected>Choose...</option>
                                                <option value="Created">Created</option>
                                                <option value="Due">Due</option>
                                                <option value="Completed">Completed</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="startDate" class="col-sm-3">Start Date:</label>
                                    <div class="col-sm-9">
                                        <div class="form-group">
                                            <input type="date" class="form-control" id="startDate" >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="endDate" class="col-sm-3">End Date:</label>
                                    <div class="col-sm-9">
                                        <div class="form-group">
                                            <input type="date" class="form-control" id="endDate" >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row justify-content-center">
                                    <div class="col-sm-3">
                                        <button type="button" id="buildReport" class="btn btn-secondary btn-block">Build</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>


    <script src="javascript/jquery-3.4.1.min.js"></script>
    <script src="javascript/popper.min.js"></script>
    <script src="javascript/bootstrap.min.js"></script>
</body>
</html>

