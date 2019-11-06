<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Font Awsome
    Fonts and Icons free to use in commercial projects -->
    <link rel="stylesheet" href="../css/all.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/addContact_style.css">
    <link rel="stylesheet" href="../css/navbar_style.css">
    <title>Sunshine Ministries Contacts</title>
<body>

<jsp:include page="navbar.jsp"></jsp:include>
<!-- form selection
    four types of contact form options: 1) church 2) business/organization 
    3) organization personnel 4) volunteer/donor -->
<div class="container"> <!--Container for forms-->
    <header id="option-section" style="min-height: 100%;margin-top: 10px">
        <div class="dark-overlay">
            <div class="option-inner container">
                <div class="row">
                    <div class="col-12">
                        <h1 class="ml-3 text-left">
                            Manage Contact Info
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Add Church Contact Section -->
    <section class="" id="churchContactSection">
        <form action="addChurch.php" method="post" id="frmAddChurch">
            <div class="fluid-container">
                <div class="card border-primary">
                    <div class="card-header">
                        <h4 class="card-title">Basic Info</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="form-group col-sm-3">
                                <label for="orgName">Name</label>
                                <input type="text"
                                       class="form-control"
                                       name="orgName"
                                       id="orgName"
                                       value="${result.getName()}">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-sm-3">
                                <label for="inputChruchDenom">Denomination</label>
                                <input type="text" class="form-control" placeholder="Denomination">
                            </div>
                            <div class="form-group col-sm-3">
                                <label for="inputChruchDenom">Description</label>
                                <input type="text" class="form-control" placeholder="...">
                            </div>
                        </div>
                    </div>
                </div>
                <!--------------------------------------------------------------------------------->

                <div class="card border-dark">
                    <div class="card-header"><h4 class="card-title">Office Contact Info</h4></div>
                    <div class="card-body">
                        <div class="form-row">
                            <c:set var="i" value="0" ></c:set>
                            <c:forEach var="phn" items="${result.getPhone()}">
                                <div class="form-group col-sm-3">
                                    <label for="Phone_${i}">Phone ${i + 1}</label>
                                    <input type="text" class="form-control" value="${phn.getPhone()}">
                                </div>
                                <c:set var="i" value="${i} + 1" ></c:set>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!--------------------------------------------------------------------------------->

                <div class="card border-dark">
                    <div class="card-header"><h4 class="card-title">Church Mailing Address</h4></div>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="form-group col-lg-6">
                                <label for="inputChurchAddressDesc">Desc</label>
                                <input type="text" class="form-control" id="inputChurchAddressDesc"
                                       placeholder="Mailing">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-lg-6">
                                <label for="inputChurchAddress">Address</label>
                                <input type="text" class="form-control" id="inputChurchAddress"
                                       placeholder="1234 Main St">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group  col-lg-6">
                                <label for="inputChurchAddress2">Address 2</label>
                                <input type="text" class="form-control" id="inputChurchAddress2"
                                       placeholder="Apartment, studio, or floor">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6 col-lg-3">
                                <label for="inputChruchCity">City</label>
                                <input type="text" class="form-control" id="inputChurchCity">
                            </div>
                            <div class="form-group col-md-4 col-lg-2">
                                <label for="inputChurchState">State</label>
                                <select id="inputChurchState" class="form-control">
                                    <!--When implemented, MO should always be at top for QoL-->
                                    <option selected>Choose...</option>
                                    <option>...</option>
                                </select>
                            </div>
                            <div class="form-group col-md-2 col-lg-1">
                                <label for="inpuChurchtZip">Zip</label>
                                <input type="text" class="form-control" id="inputChurchZip">
                            </div>
                        </div>
                    </div>
                </div>
                <!--------------------------------------------------------------------------------->

                <div class="card text-white bg-dark">
                    <div class="card-header">
                        <h4 class="card-title">Other Address
                            <button class="btn btn-primary" type="button" data-toggle="collapse"
                                    data-target="#collapseOtherAdd" aria-expanded="false">
                                +
                            </button>
                        </h4>

                    </div>
                    <div class="collapse" id="collapseOtherAdd">
                        <div class="card-body">
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label for="inputChurchOtherAddressDesc">Desc</label>
                                    <input type="text" class="form-control" id="inputChurchOtherAddressDesc"
                                           placeholder="Secondary Site">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label for="inputChurchAddress">Address</label>
                                    <input type="text" class="form-control" id="inputChruchAddress"
                                           placeholder="1234 Main St">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group  col-lg-6">
                                    <label for="inputChurchOtherhAddress2">Address 2</label>
                                    <input type="text" class="form-control" id="inputChurchOtherAddress2"
                                           placeholder="Apartment, studio, or floor">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6 col-lg-3">
                                    <label for="inputChurchOtherCity">City</label>
                                    <input type="text" class="form-control" id="inputChurchOtherCity">
                                </div>
                                <div class="form-group col-md-4 col-lg-2">
                                    <label for="inputChurchOtherState">State</label>
                                    <select id="inputChurchOtherState" class="form-control">
                                        <option selected>Choose...</option>
                                        <option>...</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-2 col-lg-1">
                                    <label for="inpuChurchOthertZip">Zip</label>
                                    <input type="text" class="form-control" id="inputChurchOtherZip">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--------------------------------------------------------------------------------->

                <div class="card text-white bg-secondary ">
                    <div class="card-header"><h4 class="card-title">Web Info</h4></div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label for="inputChurchWebsite" class="col-sm-2 col-form-label">Website</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="inputChurhWebsite"
                                       placeholder="www.website.com">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputChurchFaceBook" class="col-sm-2 col-form-label">FaceBook</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="inputChurhFacebook"
                                       placeholder="www.facebook.com/church">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputChurchTwitter" class="col-sm-2 col-form-label">Twitter</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="inputChurhTwitter"
                                       placeholder="www.Twitter.com/church">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputChurchInstagram" class="col-sm-2 col-form-label">Instagram</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="inputChurchInstagram"
                                       placeholder="www.Instagram.com/church">
                            </div>
                        </div>
                    </div>

                </div>
                <!--------------------------------------------------------------------------------->

                <div class="card bg-primary text-white">
                    <div class="card-header"><h4 class="card-title">Contact Notes</h4></div>
                    <div class="card-body">
                        <div class="form-group ">
                            <div class="input-group">
                                <textarea class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--------------------------------------------------------------------------------->

            <div class="card text-center bg-secondary">
                <div class="card-body ">

                    <button type="button" class="btn btn-primary " data-toggle="modal"
                            data-target="#checkChurchContact">Add Contact!
                    </button>

                    <!-- Add Modal -->
                    <div class="modal fade" id="checkChurchContact" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Verify Input</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Is the contact information complete and accurate?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No, Go back
                                    </button>
                                    <button type="submit" class="btn btn-primary" data-dismiss="modal"
                                            data-toggle="modal" data-target="#addChurchContact" id="submitContact">Yes,
                                        Continue
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Confirmed Modal -->
                    <div class="modal fade" id="addChurchContact" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addChurchContactTitle">Addition Confirmed!</h5>
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
                </div>

            </div>

        </form>
    </section>
    <!-- Add Business/Organization Section -->
<%--    <section class="" id="orgContactSection">--%>
<%--        <div class="fluid-container ">--%>

<%--            <div class="card border-primary">--%>
<%--                <div class="card-header"><h4 class="card-title">Basic Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputOrgName">Name</label>--%>
<%--                                <input type="text" class="form-control" placeholder="Organization Name">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputAltOrgName">Alterative Name</label>--%>
<%--                                <input type="text" class="form-control" placeholder="Alternative Name 1, 2, etc...">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputOrgType">Organization Type</label>--%>
<%--                                <input type="text" class="form-control" placeholder="Business, school...">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputOrgTypeDesc">Type Description</label>--%>
<%--                                <input type="text" class="form-control" placeholder="Non-profit, Highschool...">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card text-white bg-dark border-primary">--%>
<%--                <div class="card-header"><h4 class="card-title">Web Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputOrgWebsite" class="col-sm-2 col-form-label">Website</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputChruchWebsite"--%>
<%--                                       placeholder="www.website.com">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputOrgFaceBook" class="col-sm-2 col-form-label">FaceBook</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputChruchFacebook"--%>
<%--                                       placeholder="www.facebook.com/Org">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputOrgTwitter" class="col-sm-2 col-form-label">Twitter</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputChruchTwitter"--%>
<%--                                       placeholder="www.Twitter.com/Org">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputOrgInstagram" class="col-sm-2 col-form-label">Instagram</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputOrgInstagram"--%>
<%--                                       placeholder="www.Instagram.com/Org">--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </form>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card border-dark">--%>
<%--                <div class="card-header"><h4 class="card-title">Organization Mailing Address</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <label for="inputOrgAddressDesc">Desc</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrgAddressDesc" placeholder="Mailing">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <label for="inputOrgAddress">Address</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrgAddress" placeholder="1234 Main St">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group  col-lg-6">--%>
<%--                                <label for="inputOrgAddress2">Address 2</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrgAddress2"--%>
<%--                                       placeholder="Apartment, studio, or floor">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-md-6 col-lg-3">--%>
<%--                                <label for="inputOrgCity">City</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrgCity">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-md-4 col-lg-2">--%>
<%--                                <label for="inputOrgState">State</label>--%>
<%--                                <select id="inputOrgState" class="form-control">--%>
<%--                                    <option selected>Choose...</option>--%>
<%--                                    <option>...</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-md-2 col-lg-1">--%>
<%--                                <label for="inpuOrgtZip">Zip</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrgZip">--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                    </form>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card text-white bg-dark">--%>
<%--                <div class="card-header"><h4 class="card-title">Other Address</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <label for="inputOrgOtherAddressDesc">Desc</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrgOtherAddressDesc"--%>
<%--                                       placeholder="Secondary Site">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <label for="inputOrgAddress">Address</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrghAddress"--%>
<%--                                       placeholder="1234 Main St">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group  col-lg-6">--%>
<%--                                <label for="inputOrgOtherhAddress2">Address 2</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrgOtherAddress2"--%>
<%--                                       placeholder="Apartment, studio, or floor">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-md-6 col-lg-3">--%>
<%--                                <label for="inputOrgOtherCity">City</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrgOtherCity">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-md-4 col-lg-2">--%>
<%--                                <label for="inputOrgOtherState">State</label>--%>
<%--                                <select id="inputOrgOtherState" class="form-control">--%>
<%--                                    <option selected>Choose...</option>--%>
<%--                                    <option>...</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-md-2 col-lg-1">--%>
<%--                                <label for="inpuOrgOthertZip">Zip</label>--%>
<%--                                <input type="text" class="form-control" id="inputOrgOtherZip">--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card border-dark">--%>
<%--                <div class="card-header"><h4 class="card-title">Office Contact Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputorgOfficePhone">Office Phone</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputorgCellPhone">Cell Phone</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputorgFax">Fax</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputorgEmail">Office Email</label>--%>
<%--                                <input type="email" class="form-control" placeholder="orgcontact@biz.org">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card text-white bg-primary">--%>
<%--                <div class="card-header"><h4 class="card-title">Contact Notes</h4></div>--%>
<%--                <div class="card-body ">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <div class="input-group">--%>
<%--                                    <div class="input-group-prepend">--%>
<%--                                        <span class="input-group-text">Enter Notes about Contact</span>--%>
<%--                                    </div>--%>
<%--                                    <textarea class="form-control" aria-label="Enter Notes about Contact"></textarea>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!--------------------------------------------------------------------------------->--%>

<%--        <div class="card  bg-secondary">--%>

<%--            <div class="card-body text-center">--%>
<%--                <form>--%>
<%--                    <div class="form-row ">--%>
<%--                        <div class="form-group  col-lg-4 align-self-center">--%>
<%--                            <button type="button" class="btn btn-primary btn-block" data-toggle="modal"--%>
<%--                                    data-target="#checkOrgContact">Add Contact!--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                        <!-- Modal -->--%>
<%--                        <div class="modal fade" id="checkOrgContact" tabindex="-1" role="dialog"--%>
<%--                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
<%--                            <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <h5 class="modal-title" id="exampleModalCenterTitle">Verify Input</h5>--%>
<%--                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                            <span aria-hidden="true">&times;</span>--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-body">--%>
<%--                                        Is the contact information complete and accurate?--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No, Go--%>
<%--                                            back--%>
<%--                                        </button>--%>
<%--                                        <button type="button" class="btn btn-primary" data-dismiss="modal"--%>
<%--                                                data-toggle="modal" data-target="#addOrgContact">Yes, Continue--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- Confirmed Modal -->--%>
<%--                        <div class="modal fade" id="addOrgContact" tabindex="-1" role="dialog" aria-hidden="true">--%>
<%--                            <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <h5 class="modal-title" id="addOrgContactTitle">Addition Confirmed!</h5>--%>
<%--                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                            <span aria-hidden="true">&times;</span>--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-body">--%>
<%--                                        Your contact was added!--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close--%>
<%--                                        </button>--%>

<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                </form>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--    </section>--%>
    <!-- Add Presonnel Section -->
<%--    <section class="" id="personnelContactSection">--%>
<%--        <div class="fluid-container ">--%>

<%--            <div class="card border-primary">--%>
<%--                <div class="card-header"><h4 class="card-title">Basic Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelFName">First Name</label>--%>
<%--                                <input type="text" class="form-control" placeholder="First Name">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelLName">Last Name Name</label>--%>
<%--                                <input type="text" class="form-control" placeholder="Last Name">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelNickname">Nicknames</label>--%>
<%--                                <input type="text" class="form-control" placeholder="Nickname 1, 2, ...">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card border-primary">--%>
<%--                <div class="card-header"><h4 class="card-title">Work Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-3">--%>
<%--                                <label for="inputPersonnelWorkName">Name</label>--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelWorkName"--%>
<%--                                       placeholder="Name of Work...">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-lg-3">--%>
<%--                                <label for="inputPersonnelWorkTitle">Title/Poisition</label>--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelWorkTitle"--%>
<%--                                       placeholder="Title, Position...">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-2">--%>
<%--                                <div class="btn-group">--%>
<%--                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"--%>
<%--                                            data-display="static" aria-haspopup="true" aria-expanded="false">--%>
<%--                                        Main/Principle/Additional--%>
<%--                                    </button>--%>
<%--                                    <div class="dropdown-menu dropdown-menu-lg-right">--%>
<%--                                        <button class="dropdown-item" type="button">Main</button>--%>
<%--                                        <button class="dropdown-item" type="button">Principle action</button>--%>
<%--                                        <button class="dropdown-item" type="button">Additional else here</button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelWorkPhone">Work Phone</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelCellPhone">Cell Phone</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelWorkFax">Fax</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelWorkEmail">Email</label>--%>
<%--                                <input type="email" class="form-control" placeholder="Personnelcontact@biz.org">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card text-white bg-dark">--%>
<%--                <div class="card-header"><h4 class="card-title">Personal Address</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <label for="inputPersonnelAddressDesc">Desc</label>--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelAddressDesc"--%>
<%--                                       placeholder="Mailing, Home...">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <label for="inputPersonnelAddress">Address</label>--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelAddress"--%>
<%--                                       placeholder="1234 Main St">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group  col-lg-6">--%>
<%--                                <label for="inputPersonnelAddress2">Address 2</label>--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelAddress2"--%>
<%--                                       placeholder="Apartment, studio, or floor">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-md-6 col-lg-3">--%>
<%--                                <label for="inputPersonnelCity">City</label>--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelCity">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-md-4 col-lg-2">--%>
<%--                                <label for="inputPersonnelState">State</label>--%>
<%--                                <select id="inputPersonnelState" class="form-control">--%>
<%--                                    <option selected>Choose...</option>--%>
<%--                                    <option>...</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-md-2 col-lg-1">--%>
<%--                                <label for="inpuPersonneltZip">Zip</label>--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelZip">--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card border-dark">--%>
<%--                <div class="card-header"><h4 class="card-title">Personal Contact Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelHomePhone">Home Phone</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelCellPhone">Cell Phone</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelFax">Fax</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputPersonnelEmail">Email</label>--%>
<%--                                <input type="email" class="form-control" placeholder="Personnelcontact@biz.org">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card text-white bg-secondary ">--%>
<%--                <div class="card-header"><h4 class="card-title">Web Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputPersonnelWebsite" class="col-sm-2 col-form-label">Website</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelWebsite"--%>
<%--                                       placeholder="www.website.com">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputPersonnelFaceBook" class="col-sm-2 col-form-label">FaceBook</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelFacebook"--%>
<%--                                       placeholder="www.facebook.com/Personnel">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputPersonnelTwitter" class="col-sm-2 col-form-label">Twitter</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelTwitter"--%>
<%--                                       placeholder="www.Twitter.com/Personnel">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputPersonnelInstagram" class="col-sm-2 col-form-label">Instagram</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputPersonnelInstagram"--%>
<%--                                       placeholder="www.Instagram.com/Personnel">--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!--------------------------------------------------------------------------------->--%>

<%--            <div class="card bg-primary text-white">--%>
<%--                <div class="card-header"><h4 class="card-title">Contact Notes</h4></div>--%>
<%--                <div class="card-body ">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <div class="input-group">--%>
<%--                                    <div class="input-group-prepend">--%>
<%--                                        <span class="input-group-text">Enter Notes about Contact</span>--%>
<%--                                    </div>--%>
<%--                                    <textarea class="form-control" aria-label="Enter Notes about Contact"></textarea>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!--------------------------------------------------------------------------------->--%>

<%--        <div class="card  bg-secondary">--%>

<%--            <div class="card-body ">--%>
<%--                <form>--%>
<%--                    <div class="form-row">--%>
<%--                        <div class="form-group col-lg-4">--%>
<%--                            <button type="button" class="btn btn-primary btn-block" data-toggle="modal"--%>
<%--                                    data-target="#checkPersonnelContact">Add Contact!--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                        <!-- Modal -->--%>
<%--                        <div class="modal fade" id="checkPersonnelContact" tabindex="-1" role="dialog"--%>
<%--                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
<%--                            <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <h5 class="modal-title" id="exampleModalCenterTitle">Verify Input</h5>--%>
<%--                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                            <span aria-hidden="true">&times;</span>--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-body">--%>
<%--                                        Is the contact information complete and accurate?--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No, Go--%>
<%--                                            back--%>
<%--                                        </button>--%>
<%--                                        <button type="button" class="btn btn-primary" data-dismiss="modal"--%>
<%--                                                data-toggle="modal" data-target="#addPersonnelContact">Yes, Continue--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- Confirmed Modal -->--%>
<%--                        <div class="modal fade" id="addPersonnelContact" tabindex="-1" role="dialog" aria-hidden="true">--%>
<%--                            <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <h5 class="modal-title" id="addPersonnelContactTitle">Addition Confirmed!</h5>--%>
<%--                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                            <span aria-hidden="true">&times;</span>--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-body">--%>
<%--                                        Your contact was added!--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close--%>
<%--                                        </button>--%>

<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                </form>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--    </section>--%>
    <!-- Add Volunteer/Donor Section -->
<%--    <section class="" id="volunteerContactSection">--%>
<%--        <div class="fluid-container ">--%>

<%--            <div class="card border-primary">--%>
<%--                <div class="card-header"><h4 class="card-title">Basic Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputVolunteerFName">First Name</label>--%>
<%--                                <input type="text" class="form-control" placeholder="First Name">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputVolunteerLName">Last Name Name</label>--%>
<%--                                <input type="text" class="form-control" placeholder="Last Name">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputVolunteerNickname">Nicknames</label>--%>
<%--                                <input type="text" class="form-control" placeholder="Nickname 1, 2, ...">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="card text-white bg-dark">--%>
<%--                <div class="card-header"><h4 class="card-title">Personal Address</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <label for="inputVolunteerAddressDesc">Desc</label>--%>
<%--                                <input type="text" class="form-control" id="inputVolunteerAddressDesc"--%>
<%--                                       placeholder="Mailing, Home...">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <label for="inputVolunteerAddress">Address</label>--%>
<%--                                <input type="text" class="form-control" id="inputVolunteerAddress"--%>
<%--                                       placeholder="1234 Main St">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group  col-lg-6">--%>
<%--                                <label for="inputVolunteerAddress2">Address 2</label>--%>
<%--                                <input type="text" class="form-control" id="inputVolunteerAddress2"--%>
<%--                                       placeholder="Apartment, studio, or floor">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-md-6 col-lg-3">--%>
<%--                                <label for="inputVolunteerCity">City</label>--%>
<%--                                <input type="text" class="form-control" id="inputVolunteerCity">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-md-4 col-lg-2">--%>
<%--                                <label for="inputVolunteerState">State</label>--%>
<%--                                <select id="inputVolunteerState" class="form-control">--%>
<%--                                    <option selected>Choose...</option>--%>
<%--                                    <option>...</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-md-2 col-lg-1">--%>
<%--                                <label for="inpuVolunteertZip">Zip</label>--%>
<%--                                <input type="text" class="form-control" id="inputVolunteerZip">--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="card border-dark">--%>
<%--                <div class="card-header"><h4 class="card-title">Personal Contact Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputVolunteerHomePhone">Home Phone</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputVolunteerCellPhone">Cell Phone</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputVolunteerFax">Fax</label>--%>
<%--                                <input type="text" class="form-control" placeholder="xxx-xxx-xxxx">--%>
<%--                            </div>--%>
<%--                            <div class="form-group col-sm-3">--%>
<%--                                <label for="inputVolunteerEmail">Email</label>--%>
<%--                                <input type="email" class="form-control" placeholder="Volunteercontact@biz.org">--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="card text-white bg-secondary ">--%>
<%--                <div class="card-header"><h4 class="card-title">Web Info</h4></div>--%>
<%--                <div class="card-body">--%>
<%--                    <form>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputVolunteerWebsite" class="col-sm-2 col-form-label">Website</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputVolunteerWebsite"--%>
<%--                                       placeholder="www.website.com">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputVolunteerFaceBook" class="col-sm-2 col-form-label">FaceBook</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputVolunteerFacebook"--%>
<%--                                       placeholder="www.facebook.com/Volunteer">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputVolunteerTwitter" class="col-sm-2 col-form-label">Twitter</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputVolunteerTwitter"--%>
<%--                                       placeholder="www.Twitter.com/Volunteer">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group row">--%>
<%--                            <label for="inputVolunteerInstagram" class="col-sm-2 col-form-label">Instagram</label>--%>
<%--                            <div class="col-sm-4">--%>
<%--                                <input type="text" class="form-control" id="inputVolunteerInstagram"--%>
<%--                                       placeholder="www.Instagram.com/Volunteer">--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="card bg-primary text-white">--%>
<%--                <div class="card-header"><h4 class="card-title">Contact Notes</h4></div>--%>
<%--                <div class="card-body ">--%>
<%--                    <form>--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group col-lg-6">--%>
<%--                                <div class="input-group">--%>
<%--                                    <div class="input-group-prepend">--%>
<%--                                        <span class="input-group-text">Enter Notes about Contact</span>--%>
<%--                                    </div>--%>
<%--                                    <textarea class="form-control" aria-label="Enter Notes about Contact"></textarea>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="card bg-secondary">--%>

<%--            <div class="card-body ">--%>
<%--                <form>--%>
<%--                    <div class="form-row">--%>
<%--                        <div class="form-group  col-lg-4">--%>
<%--                            <button type="button" class="btn btn-primary btn-block" data-toggle="modal"--%>
<%--                                    data-target="#checkVolunterContact">Add Contact!--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                        <!-- Modal -->--%>
<%--                        <div class="modal fade" id="checkVolunterContact" tabindex="-1" role="dialog"--%>
<%--                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
<%--                            <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <h5 class="modal-title" id="exampleModalCenterTitle">Verify Input</h5>--%>
<%--                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                            <span aria-hidden="true">&times;</span>--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-body">--%>
<%--                                        Is the contact information complete and accurate?--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No, Go--%>
<%--                                            back--%>
<%--                                        </button>--%>
<%--                                        <button type="button" class="btn btn-primary" data-dismiss="modal"--%>
<%--                                                data-toggle="modal" data-target="#addVolunterContact">Yes, Continue--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <!-- Confirmed Modal -->--%>
<%--                        <div class="modal fade" id="addVolunterContact" tabindex="-1" role="dialog" aria-hidden="true">--%>
<%--                            <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                                <div class="modal-content">--%>
<%--                                    <div class="modal-header">--%>
<%--                                        <h5 class="modal-title" id="addVolunterContactTitle">Addition Confirmed!</h5>--%>
<%--                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                            <span aria-hidden="true">&times;</span>--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-body">--%>
<%--                                        Your contact was added!--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close--%>
<%--                                        </button>--%>

<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                </form>--%>
<%--            </div>--%>

<%--        </div>--%>

</div>
</section>


</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="../javascript/jquery-3.4.1.slim.min.js"></script>
<script src="../javascript/popper.min.js"></script>
<script src="../javascript/bootstrap.min.js"></script>
<%--<script>--%>
<%--    /* show/hide forms on load */--%>
<%--    $(document).ready(function () {--%>
<%--        $("#churchContactSection").show("slow");--%>
<%--        $("#orgContactSection").hide("slow");--%>
<%--        $("#personnelContactSection").hide("slow");--%>
<%--        $("#volunteerContactSection").hide("slow");--%>
<%--    });--%>
<%--    /* show/hide forms on click */--%>
<%--    $("#churchLabel").click(function () {--%>
<%--        $("#churchContactSection").show("slow");--%>
<%--        $("#orgContactSection").hide("slow");--%>
<%--        $("#personnelContactSection").hide("slow");--%>
<%--        $("#volunteerContactSection").hide("slow");--%>
<%--    });--%>
<%--    $("#orgLabel").click(function () {--%>
<%--        $("#churchContactSection").hide("slow");--%>
<%--        $("#orgContactSection").show("slow");--%>
<%--        $("#personnelContactSection").hide("slow");--%>
<%--        $("#volunteerContactSection").hide("slow");--%>
<%--    });--%>
<%--    $("#personnelLabel").click(function () {--%>
<%--        $("#churchContactSection").hide("slow");--%>
<%--        $("#orgContactSection").hide("slow");--%>
<%--        $("#personnelContactSection").show("slow");--%>
<%--        $("#volunteerContactSection").hide("slow");--%>
<%--    });--%>
<%--    $("#volunteerdonorLabel").click(function () {--%>
<%--        $("#churchContactSection").hide("slow");--%>
<%--        $("#orgContactSection").hide("slow");--%>
<%--        $("#personnelContactSection").hide("slow");--%>
<%--        $("#volunteerContactSection").show("slow");--%>
<%--    });--%>
<%--</script>--%>
<script>
    $("#submitContact").click(function () {
        $("submitContact").submit();
    });
</script>
</body>
</html>
