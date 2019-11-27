<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="inputContact" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-lg modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Input Contact Info</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- input form -->
                <form name="addContactForm" id="frmAddContact" action="/saveContact" method="POST" autocomplete="off">
                    <div class="form-row justify-content-center">
                        <div class="form-group-col-md-6">
                            <label class="btn btn-md btn-default" id="churchRadio">
                                <input class="mr-2" type="radio" name="contactType" id="rbtnContactTypeChurch" name="ContactType" value="Church" checked>Church
                            </label>
                            <label class="btn btn-md btn-default" id="orgRadio">
                                <input class="mr-2" type="radio" name="contactType" id="rbtnContactTypeOrg" value="Organization">Organization/Business
                            </label>
                            <label class="btn btn-md btn-default" id="personRadio">
                                <input class="mr-2" type="radio" name="contactType" id="rbtnContactTypePerson" value="Perspon">Person
                            </label>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tboxName">Name</label>
                            <input type="text" class="form-control" id="tboxName" placeholder="Name" name="name" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tboxAlias">Alternative Alias</label>
                            <input type="text" class="form-control" id="tboxAlias" placeholder="Alias" name="alias">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tboxEmail">Email</label>
                            <input type="email" class="form-control" id="tboxEmail" placeholder="Email" name="email">
                        </div>
                        <div class="form-group col-md-6" id="churchSelect">
                            <label for="tboxDenomination">Denomination</label>
                            <input type="text" class="form-control" id="tboxDenomination"
                                   placeholder="Denomination" checked name="denomination">
                        </div>

                        <div class="form-group col-md-6 d-none " id="orgSelect">
                            <label for="tboxOrgType">Type</label>
                            <input type="text" class="form-control" id="tboxOrgType" placeholder="Type" name="orgType">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-2">
                            <label for="tboxAddressDesc">Address Desc.</label>
                            <input type="text" class="form-control" id="tboxAddressDesc"
                                   placeholder="Mailing"
                                   name="addressDesc">
                        </div>
                        <div class="form-group col-md-5">
                            <label for="tboxAddress1">Address1</label>
                            <input type="text" class="form-control" id="tboxAddress1"
                                   placeholder="1234 Main St"
                                   name="address">
                        </div>
                        <div class="form-group col-md-5">
                            <label for="tboxAddress2">Address2</label>
                            <input type="text" class="form-control" id="tboxAddress2"
                                   placeholder="i.e. Apartment # or Office Room #" name="address2">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tboxCity">City</label>
                            <input type="text" class="form-control" id="tboxCity" name="city">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="states">State</label>
                            <input class="form-control" list="states" name="state">
                            <datalist id="states">
                                <option value="MO">
                                <option value="IL">
                            </datalist>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="tboxZip">Zip</label>
                            <input type="text" class="form-control" id="tboxZip" name="zip">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tboxPhone">Phone</label>
                            <input type="text" class="form-control" id="tboxPhone" placeholder="Phone" name="phone">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tboxFax">Fax</label>
                            <input type="text" class="form-control" id="tboxFax" placeholder="Fax" name="fax">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tboxWebsite">Website URL:</label>
                            <input type="text" class="form-control" name="website" id="tboxWebsite" placeholder="https://example.com">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tboxFacebook">Facebook URL:</label>
                            <input type="text" class="form-control" name="facebook" id="tboxFacebook" placeholder="https://example.com">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tboxInstagram">Instagram URL:</label>
                            <input type="text" class="form-control" name="instagram" id="tboxInstagram" placeholder="https://example.com">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tboxTwitter">Twitter URL:</label>
                            <input type="text" class="form-control" name="twitter" id="tboxTwitter" placeholder="https://example.com">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="txtareaInputNote">Note</label>
                            <textarea class="form-control" name="inputNote" id="txtareaInputNote" placeholder=". . ."></textarea>
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
<%--                        <button type="submit" class="btn btn-primary add-row" id="submitContact" data-dismiss="modal" data-toggle="modal">Submit</button>--%>
                        <input class="btn btn-primary " type="submit" value="Submit"> <!--Temporary button for testing purposes-->
                    </div>
                </form>
            </div>

        </div> <!-- end of modal-content-->
    </div> <!-- end of modal role=document -->
</div><!-- end of model fade -->

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