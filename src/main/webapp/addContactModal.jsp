<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="inputContact" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-lg modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Add New Contact</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- input form -->
                <form name="addContactForm" id="frmAddContact" autocomplete="off">
                    <div class="row">
                        <div class="col">
                            <div class="card p-3 mt-2 border-primary">
                                <!-- Name, Contact Type, Email, Type Description -->
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="tboxNameAdd">Name</label>
                                        <input type="text" class="form-control" name="name" id="tboxNameAdd"
                                               placeholder="Name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="selectboxTypeAdd">Contact Type</label>
                                        <select class="custom-select" id="selectboxTypeAdd" name="type"
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
                                        <input type="email" class="form-control" id="tboxEmailAdd" name="email"
                                               placeholder="Email">
                                    </div>
                                    <div class="form-group col-md-6" name="denomShow">
                                        <label for="lboxTypeDescriptions">Type Description</label>
                                        <input class="form-control" id="lboxTypeDescriptions"
                                               name="description"
                                               placeholder="Denomination, Job Title, etc.">
                                        <!-- populate list based on contact type via javascript by changing list attribute-->
                                        <datalist id="churchTypeDescriptions">
                                            <option value="Baptist">
                                            <option value="Catholic">
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
                        <div class="col">
                            <div class="card p-3 mt-2 border-success">
                                <!-- Address Desc, Address, Address2, City, State, Zip -->
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Street</label>
                                        <input type="text" class="form-control" name="street" id="tboxStreetAdd">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label>Suite</label>
                                        <input type="text" class="form-control" name="suite" id="tboxSuiteAdd">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>City</label>
                                        <input type="text" class="form-control" name="city" id="tboxCityAdd">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-3">
                                        <label>State</label>
                                        <input class="form-control" list="states" name="stateAdd" id="listStatesAdd">
                                        <datalist id="states">
                                            <option value="MO">
                                            <option value="IL">
                                        </datalist>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label>Zip</label>
                                        <input type="text" class="form-control" name="zip" id="tboxZipAdd">
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label>Descr.</label>
                                        <input type="text" class="form-control" name="addressType"
                                               id="tboxAddressDescrAdd">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="card p-3 mt-2 border-warning">
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label>Phone</label>
                                        <input type="text" class="form-control" name="phone" id="tboxPhoneAdd"
                                               placeholder="Phone">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Type</label>
                                        <input type="text" class="form-control" name="phoneType"
                                               id="tboxPhoneTypeAdd" placeholder="Type">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<%--                    <div id="websiteCard" class="card p-3 mt-2">--%>
<%--                        <div class="form-row">--%>
<%--                            <div class="form-group input-group col">--%>
<%--                                <input type="text" class="form-control" name="websiteAdd" id="websiteAdd"--%>
<%--                                       placeholder="https://example.com">--%>
<%--                                <div class="input-group-append">--%>
<%--                                    <button class="btn btn-outline-secondary" type="button">Go</button>--%>
<%--                                    <button class="btn btn-outline-danger" type="button">Delete</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                </form>
            </div>
            <div class='modal-footer'>
<%--                <button type='button' class='btn btn-primary' onclick="clearAddForm()">Clear Form</button>--%>
                <button type='button' class='btn btn-primary' id="addSaveButton">Save changes</button>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>
            </div>
        </div> <!-- end of modal-content-->
    </div> <!-- end of modal role=document -->
</div>
<!-- end of model fade -->

<%-- Radio Buttons:
       rbtnContactTypeChurch
       rbtnContactTypeOrg
       rbtnContactTypePerson
     Everything else:
        tboxName
        tboxAlias
        tboxEmail
        tboxDenomination
        tboxOrgType
        tboxAddressDesc
        tboxAddress1
        tboxAddress2
        tboxCity
        states
        tboxZip
        tboxPhone
        tboxFax
        tboxWebsite
        tboxFacebook
        tboxInstagram
        tboxTwitter
        txtareaInputNote
       --%>