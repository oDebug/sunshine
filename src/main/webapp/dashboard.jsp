<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="css/dash_style.css">
    <title>Sunshine Ministries Contacts</title>
</head>


<body>
<jsp:include page="navbar.jsp"/>
<!-- HOME SECTION -->
<header id="home-section">
    <div class="dark-overlay">
        <div class="home-inner container">
            <div class="row justify-content-center">


                <div class="col-lg-8 ">
                    <div class="card bg-light text-center text-dark card-form">
                        <div class="card-header"><h4>Search Contacts</h4></div>
                        <div class="card-body">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <button class="btn btn-secondary" type="button">Search</button>
                                </div>
                                <input type="text" class="form-control" placeholder="Search Name">
                            </div>


                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="search" id="searchOrg"
                                       value="option1" checked>
                                <label class="form-check-label" for="search">Organizations</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="search" id="searchPerson"
                                       value="option2">
                                <label class="form-check-label" for="search">People</label>
                            </div>
                        </div>
                        <div class="card-footer ">
                            <!-- Add data button modal -->

                            <div class="form-group mb-0">
                                <button type="button" class="btn btn-primary btn-block" data-toggle="modal"
                                        data-target="#inputContact">Add Contact
                                </button>
                            </div>
                            <!-- Input Modal -->
                            <div class="modal fade" id="inputContact" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-lg modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalCenterTitle">Input Contact Info</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body text-left">
                                            <!-- input form -->
                                            <form>

                                                <div class="form-row justify-content-center">
                                                    <div class="form-group-col-md-6">
                                                        <label class="btn btn-md btn-default" id="churchRadio">
                                                            <input class="mr-2" type="radio" name="contactType"
                                                                   name="contactType" value="church" checked>Church
                                                        </label>
                                                        <label class="btn btn-md btn-default" id="orgRadio">
                                                            <input class="mr-2" type="radio" name="contactType"
                                                                   value="organization">Organization/Business
                                                        </label>
                                                        <label class="btn btn-md btn-default" id="personRadio">
                                                            <input class="mr-2" type="radio" name="contactType"
                                                                   value="person">Person
                                                        </label>

                                                    </div>
                                                </div>

                                                <div class="form-row  ">
                                                    <div class="form-group col-md-6 " id="orgname">
                                                        <label for="name">Name</label>
                                                        <input type="text" class="form-control" id="name"
                                                               placeholder="Name">
                                                    </div>
                                                    <div class="form-group col-md-3 d-none" id="personfname">
                                                        <label for="fname">First Name</label>
                                                        <input type="text" class="form-control" id="fname"
                                                               placeholder="First Name">
                                                    </div>
                                                    <div class="form-group col-md-3 d-none" id="personlname">
                                                        <label for="lname">Last Name</label>
                                                        <input type="text" class="form-control" id="lname"
                                                               placeholder="Last Name">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="alias">Alternative Alias</label>
                                                        <input type="text" class="form-control" id="alias"
                                                               placeholder="Alias">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="email">Email</label>
                                                        <input type="email" class="form-control" id="email"
                                                               placeholder="Email">
                                                    </div>
                                                    <div class="form-group col-md-6" id="churchSelect">
                                                        <label for="denomination">Denomination</label>
                                                        <input type="text" class="form-control" id="denomination"
                                                               placeholder="Denomination">
                                                    </div>
                                                    <div class="form-group col-md-6 d-none " id="orgSelect">
                                                        <label for="orgType">Type</label>
                                                        <input type="text" class="form-control" id="orgType"
                                                               placeholder="Type">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-2">
                                                        <label for="addressDesc">Address Desc.</label>
                                                        <input type="text" class="form-control" id="addressDesc"
                                                               placeholder="Mailing">
                                                    </div>
                                                    <div class="form-group col-md-5">
                                                        <label for="address1">Address1</label>
                                                        <input type="text" class="form-control" id="address1"
                                                               placeholder="1234 Main St">
                                                    </div>
                                                    <div class="form-group col-md-5">
                                                        <label for="address2">Address2</label>
                                                        <input type="text" class="form-control" id="address2"
                                                               placeholder="i.e. Appartment # or Office Room #">
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="city">City</label>
                                                        <input type="text" class="form-control" id="city"
                                                               placeholder="City">
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label for="state">State</label>
                                                        <input type="text" id="state" class="form-control"
                                                               placeholder="State">

                                                    </div>
                                                    <div class="form-group col-md-2">
                                                        <label for="zip">Zip</label>
                                                        <input type="text" class="form-control" id="zip"
                                                               placeholder="Zip">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="phone">Phone</label>
                                                        <input type="text" class="form-control" id="phone"
                                                               placeholder="Phone">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="fax">Fax</label>
                                                        <input type="text" class="form-control" id="fax"
                                                               placeholder="Fax">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="website">Website URL:</label>
                                                        <input type="text" class="form-control" name="website"
                                                               id="website"
                                                               placeholder="https://example.com">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="facebook">Facebook URL:</label>
                                                        <input type="text" class="form-control" name="facebook"
                                                               id="facebook"
                                                               placeholder="https://example.com">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="instagram">Instagram URL:</label>
                                                        <input type="text" class="form-control" name="instagram"
                                                               id="instagram"
                                                               placeholder="https://example.com"
                                                        >
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="twitter">Twitter URL:</label>
                                                        <input type="text" class="form-control" name="twitter"
                                                               id="twitter"
                                                               placeholder="https://example.com"
                                                        >
                                                    </div>

                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-12">
                                                        <label for="churchNote">Note</label>
                                                        <textarea class="form-control" id="churchNote"
                                                                  placeholder=". . ."></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="gridCheck">
                                                        <label class="form-check-label" for="gridCheck">
                                                            Is this information complete and accurate?
                                                        </label>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                            </button>
                                            <button type="button" class="btn btn-primary add-row" data-dismiss="modal"
                                                    data-toggle="modal" data-target="#addContact">Submit
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

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
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="card bg-primary text-center card-form mt-3">
                        <div class="card-header"><h4>Upcoming Actions</h4></div>
                        <div class="card-body">
                            <div class="table-responsive-md">
                                <table class="table table-primary table-hover">
                                    <thead class="thead-dark">
                                    <th>Action ID#</th>
                                    <th>Contact Name</th>
                                    <th>Start Date</th>
                                    <th>FollowUp Date</th>
                                    <th>Note</th>
                                    <th>Status</th>
                                    </thead>
                                    <tbody>
                                    <td>003</td>
                                    <td>Hazelwood Baptist Church</td>
                                    <td>2019-10-7</td>
                                    <td>2019-10-10</td>
                                    <td>Call to thank Hazelwood Baptist Church for donation</td>
                                    <td>In Progress</td>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="card bg-primary text-center card-form mt-3">
                        <div class="card-header"><h4>Recently Accessed Contacts</h4></div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-primary table-hover">
                                    <thead class="thead-dark">
                                    <th>Contact ID#</th>
                                    <th>Name</th>
                                    <th>Contact Type</th>
                                    <th>Date</th>
                                    </thead>
                                    <tbody>
                                    <td>002</td>
                                    <td>Simple Church St. Louis</td>
                                    <td>Church</td>
                                    <td>2019-10-20</td>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="card bg-primary text-center card-form mt-3">
                        <div class="card-header"><h4>Recent Reports</h4></div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-primary table-hover">
                                    <thead class="thead-dark">
                                    <th>Type</th>
                                    <th>Date</th>
                                    <th>Desc</th>
                                    </thead>
                                    <tbody>
                                    <td>Action Report</td>
                                    <td>2019-10-20</td>
                                    <td>Itemized list of Actions for Hazelwood Baptist Church</td>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
>
<script src="./javascript/jquery-3.4.1.slim.min.js"></script>
<script src="./javascript/popper.min.js"></script>
<script src="./javascript/bootstrap.min.js"></script>

<!-- add button contact type -->
<script>
    $('#orgRadio').click(function () {
        $('#churchSelect').addClass("d-none");
        $('#orgSelect').removeClass('d-none');
        $('#orgname').removeClass('d-none');
        $('#personfname').addClass('d-none');
        $('#personlname').addClass('d-none');
    });

    $('#churchRadio').click(function () {

        $('#orgSelect').addClass('d-none');
        $('#churchSelect').removeClass('d-none');
        $('#orgname').removeClass('d-none');
        $('#personfname').addClass('d-none');
        $('#personlname').addClass('d-none');

    });
    $('#personRadio').click(function () {
        $('#orgSelect').addClass('d-none');
        $('#churchSelect').addClass('d-none');
        $('#orgname').addClass('d-none');
        $('#personfname').removeClass('d-none');
        $('#personlname').removeClass('d-none');
    });
</script>
</body>
</html>
