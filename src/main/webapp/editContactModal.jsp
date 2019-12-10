<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class='modal fade' id='editContactModal' tabindex='-1' role='dialog'>
    <div class='modal-dialog modal-xl' role='document'>
        <div class='modal-content'>
            <div class='modal-header'>
                <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                    <span aria-hidden='true'>&times;</span>
                </button>
            </div>
            <div class='modal-body'>
                <input hidden type="text" id="editContactId"/>
                <ul class='nav nav-tabs' id='contactTab' role='tablist'><!-- nav tabs -->
                    <%--                    <li class='nav-item'>--%>
                    <%--                        <a class='nav-link active' id='info-tab' data-toggle='tab' href='#info' role='tab' aria-controls='info' aria-selected='true'>Info</a>--%>
                    <%--                    </li>--%>
                    <li class='nav-item'>
                        <a class='nav-link' id='edit-tab' data-toggle='tab' href='#edit' role='tab' aria-controls='edit'
                           aria-selected='false'>Edit</a>
                    </li>
                    <li class='nav-item'>
                        <a class='nav-link' id='action-tab' data-toggle='tab' href='#action' role='tab'
                           aria-controls='action' aria-selected='false'>Actions</a>
                    </li>
                    <li class='nav-item'>
                        <a class='nav-link' id='alias-tab' data-toggle='tab' href='#alias' role='tab'
                           aria-controls='action' aria-selected='false'>Aliases</a>
                    </li>
<%--                    <li class='nav-item'>--%>
<%--                        <a class='nav-link' id='map-tab' data-toggle='tab' href='#map' role='tab' aria-controls='action'--%>
<%--                           aria-selected='false'>Map</a>--%>
<%--                    </li>--%>
                </ul>
                <div class='tab-content' id='myTabContent'>
                    <div class='tab-pane fade' id='edit' role='tabpanel' aria-labelledby='edit-tab'><!-- edit tab -->
                        <h2 class="mt-3">View and Edit Contact</h2>
                        <div class="container">
                            <form autocomplete="off">
                                <div class="row justify-content-center">
                                    <div class="col">
                                        <label class="btn btn-md btn-default" id="rowContact"></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="card p-3 mt-2 border-primary">
                                            <!-- Name, Contact Type, Email, Type Description -->
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="tboxNameEdit">Name</label>
                                                    <input type="text" class="form-control" name="nameEdit"
                                                           id="tboxNameEdit" placeholder="Name">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="selectboxTypeEdit">Contact Type</label>
                                                    <select class="custom-select" id="selectboxTypeEdit" name="typeEdit"
                                                            onchange="typeChange()">
                                                        <option selected>Choose...</option>
                                                        <option value="Church">Church</option>
                                                        <option value="Organization">Organization</option>
                                                        <option value="Business">Business</option>
                                                        <option value="School">School</option>
                                                        <option value="Person">Person</option>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label>Email</label>
                                                    <input type="email" class="form-control" id="tboxEmailEdit"
                                                           name="emailEdit" placeholder="Email">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="lboxTypeDescriptions">Type Description</label>
                                                    <input class="form-control" id="lboxTypeDescriptions"
                                                           name="typeDescriptions"
                                                           placeholder="Denomination, Job Title, etc.">
                                                    <!-- populate list based on contact type via javascript by changing list attribute-->
                                                    <datalist id="churchTypeDescriptions">
                                                        <option value="Assemblies of God">
                                                        <option value="Baptist">
                                                        <option value="Catholic">
                                                        <option value="Church of God in Christ">
                                                        <option value="Episcopalian">
                                                        <option value="Greek Orthodox">
                                                        <option value="Lutheran">
                                                        <option value="Methodist">
                                                        <option value="Non-Denominational">
                                                        <option value="Presbyterian">
                                                    </datalist>
                                                    <datalist id="orgTypeDescriptions">
                                                        <option value="Charity">
                                                        <option value="Political">
                                                    </datalist>
                                                    <datalist id="businessTypeDescriptions">
                                                    </datalist>
                                                    <datalist id="schoolTypeDescriptions">
                                                        <option value="University">
                                                        <option value="Private">
                                                        <option value="Charter">
                                                    </datalist>
                                                    <datalist id="personTypeDescriptions">
                                                        <option value="President">
                                                        <option value="Receptionist">
                                                        <option value="Chairperson">
                                                        <option value="Priest">
                                                    </datalist>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row"> <!-- Address row -------------------------------------->
                                    <div class="col-4 pr-1 mb-2">
                                        <div class="card p-3 mt-2 h-100 border-secondary">
                                            <div class="row">
                                                <div class="col">
                                                    <label for="selectboxAddressesEdit">Addresses</label>
                                                    <select class="custom-select"
                                                            id="selectboxAddressesEdit"
                                                            name="addressesEdit"
                                                            onchange="changeAddress()">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row h-100 align-items-end">
                                                <div class="col w-100">
                                                    <button type='button' class='btn btn-outline-danger my-1 mx-0' onclick="removeAddress()">
                                                        Remove
                                                    </button>
                                                </div>
                                                <div class="col w-100">
                                                    <button type='button' class='btn btn-outline-primary my-1 mx-0' id="newAddressButton">New</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-8 pl-1">
                                        <div class="card p-3 mt-2 border-secondary" id="addressesCard">

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <!--Phones Row------------------------------------------------------------------------------->
                                    <div class="col-4 pr-1 mb-2">
                                        <div class="card p-3 mt-2 h-100 border-primary">
                                            <div class="form-row">
                                                <label>Phones</label>
                                                <div class="input-group">
                                                    <select class="custom-select" id="selectboxPhonesEdit" name="phonesEdit" onchange="changePhone()"></select>
                                                </div>
                                            </div>
                                            <div class="form-row h-100 align-items-end">
                                                <div class="col w-50">
                                                    <button type='button' class='btn btn-outline-danger my-1 mx-0' onclick="removePhone()">
                                                        Remove
                                                    </button>
                                                </div>
                                                <div class="col w-50">
                                                    <button type='button' class='btn btn-outline-primary my-1 mx-0' id="newPhoneButton">New</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-8 pl-1">
                                        <div class="card p-3 mt-2 border-primary" id="phonesCard">

                                        </div>
                                    </div>
                                </div>
                                <div id="notesCard" class="card p-3 mt-2">
                                    <label>Notes</label>
                                    <textarea id="summernote" name="editordata"></textarea>
                                </div>
                                <button type='button' class='btn btn-primary mt-2' onclick="clearEditForm()">Clear Form</button>
                            </form>
                        </div>
                    </div>
                    <!---- action tab ------------------------------------------------------------------------------------------------------------------------------>
                    <div class='tab-pane fade' id='action' role='tabpanel' aria-labelledby='action-tab'>
                        <h2 class="mt-2">View Actions</h2>
                        <!-- add action button -->
                        <div class="form-row">
                            <div class="form-group col mb-0">
                                <div class="alert alert-success alert-dismissible fade mb-0 pr-0 "
                                     id="submitActionAlert" role="alert">
                                    <strong>Your action was added!</strong>
                                    <button type="button" class="close " aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-5 col-lg-3  ml-md-auto">
                                <button type="button" class="btn btn-primary btn-block" id="addActionButton">Add Action</button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table id="actionTable" class="table table-hover table-bordered ">
                                <caption>Note: Dates are formatted as Year-Month-Day.</caption>
                                <thead class="thead-dark">
                                <tr class="header">
                                    <%--                                        <th>Action ID</th>--%>
                                    <th>Date Created</th>
                                    <%--                                        <th>Date Due</th>--%>
                                    <th>Type</th>
                                    <th>Notes</th>
                                    <th>Status</th>
                                    <%--                                        <th>Date Completed</th>--%>
                                    <th class="d-none">Contact ID</th>
                                </tr>
                                </thead>
                                <tbody id="actionTableBody"></tbody>
                            </table>
                        </div>
                    </div>

                    <div class='tab-pane fade' id='alias' role='tabpanel' aria-labelledby='alias-tab'>
                        <h2 id="titleHeaderAlias" class="mt-2">Aliases</h2>
                        <form id="addAliasForm">
                            <div class="form-row">
                                <div class="col-6">
                                    <div class="input-group mb-3">
                                        <input id="tboxNewAlias" type="text" class="form-control" placeholder="New Alias">
                                        <div class="input-group-append">
                                            <button id="btnAddAlias" class="btn btn-outline-secondary" type="button">Add Alias</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">

                                </div>
                            </div>
                        </form>
                        <form id="removeAliasForm">
                            <div class="row">
                            <div class="col-6 pr-1">
                                <h3>Remove Alias:</h3>
                                <div class="input-group">
                                    <select class="custom-select" id="inputGroupAliases">
                                        <option selected>Choose...</option>
                                        <option value="Alias 1">Alias 1</option>
                                        <option value="Alias 2">Alias 2</option>
                                        <option value="Alias 3">Alias 3</option>
                                    </select>
                                    <div class="input-group-append">
                                        <button id="btnRemoveAlias" class="btn btn-outline-danger" onclick="removeAlias()" type="button">
                                            Remove
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                        <div class="alert alert-warning alert-dismissible fade show">
                            <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div>

<%--                    <div class='tab-pane fade' id='map' role='tabpanel' aria-labelledby='map-tab'>--%>
<%--                        <div class="container p-2">--%>
<%--                            <div class="row ">--%>
<%--                                <div class="col-3"></div>--%>
<%--                                <div class="col-2 justify-content-center">--%>
<%--                                    <div id="mapPane" class="m-0" style="height: 500px; width: 500px; box-shadow: 0px 0px 5px 0px #383838;"></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-3"></div>--%>
<%--                                <div class="col justify-content-center"><p id="mapTabAddress"></p></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-primary' onclick="updateContact()">Save changes</button>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="addActionModal.jsp"/>
<jsp:include page="addAddressModal.jsp"/>
<jsp:include page="addPhoneModal.jsp"/>
<%--<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBWPtNLGcAlbmiNAiT9Pn794fMGXc3N4CM"></script>--%>