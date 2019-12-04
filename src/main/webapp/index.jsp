<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="shortcut icon" href="./favicon.ico" >
    <link rel="icon" href="./favicon.ico">
    <!-- Font Awsome
     Fonts and Icons free to use in commercial projects -->
    <link rel="stylesheet" type="text/css" href="resources/css/all.min.css" >
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/navbar_style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/index_style.css">

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
                            <form:form action="/login"
                                        method="POST">
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger" role="alert">${errorMessage}</div>
                            </c:if>
                            <div name="userForm">
                                <div class="form-group">
                                    <input type="text" name="username" id="userid" class="form-control form-control-lg"
                                           placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <input name="password" type="password" id="userpass" class="form-control form-control-lg"
                                           placeholder="Password">
                                </div>
                                <input class="btn btn-outline-light btn-block" id="login" type="submit" value="Login">

                                <%--<button class="btn btn-outline-light btn-block" id="login">Login</button>--%>
                            </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form:form>
                            <p id="credentials-error" style="color: red; font-weight: bold"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="resources/javascript/jquery-3.4.1.min.js"></script>
<script src="resources/javascript/popper.min.js"></script>
<script src="resources/javascript/bootstrap.min.js"></script>
<%--<script src="javascript/validateUser.js"></script>--%>

</body>
</html>
