<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="shortcut icon" href="./favicon.ico" >
    <link rel="icon" href="./favicon.ico" >
    <!-- Font Awsome
    Fonts and Icons free to use in commercial projects -->
    <link rel="stylesheet" href="css/all.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/navbar_style.css">
    <link rel="stylesheet" href="css/index_style.css">
    <title>Sunshine Ministries Contacts</title>
</head>
<body>
<%--<jsp:include page="navbar.jsp"></jsp:include>--%>
<!-- HOME SECTION -->
<header id="home-section">
    <div class="dark-overlay">
        <div class="home-inner container">
            <div class="row">
                <div class="col-lg-8 d-none d-lg-block">
                    <h1 class="display-4">
                        <strong>Sunshine Ministries</strong>
                    </h1>
                    <div class="d-flex">
                        <div class="p-4 align-self-start">
                            <i class="fas fa-check fa-2x"></i>
                        </div>
                        <div class="p-4 align-self-end">
                            <h2>Add & Find Contacts</h2>
                        </div>

                    </div>
                    <div class="d-flex">
                        <div class="p-4 align-self-start">
                            <i class="fas fa-check fa-2x"></i>
                        </div>
                        <div class="p-4 align-self-end">
                            <h2> Track Gift-in-Kind Donations</h2>
                        </div>

                    </div>
                    <div class="d-flex">
                        <div class="p-4 align-self-start">
                            <i class="fas fa-check fa-2x"></i>
                        </div>
                        <div class="p-4 align-self-end">
                            <h2>Keep Notes</h2>
                        </div>

                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card bg-primary text-center card-form">
                        <div class="card-body">
                            <h3>User Login</h3>
                            <p>Authorized use and access only.</p>
                            <form name="userForm" action="/validate" method="POST">
                                <div class="form-group">
                                    <input type="text" name="id" class="form-control form-control-lg" placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <input name="pw" type="password" class="form-control form-control-lg" placeholder="Password">
                                </div>
                                <button type="submit" class="btn btn-outline-light btn-block" id="login">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="javascript/jquery-3.4.1.min.js"></script>
<script src="javascript/popper.min.js"></script>
<script src="javascript/bootstrap.min.js"></script>

<script>
    $('#login').click(function ()
    {
        window.location = 'dashboard';
    });
</script>
</body>
</html>
