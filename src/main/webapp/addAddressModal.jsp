<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="addAddressModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-lg modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Add New Address</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- input form -->
                <form name="addAddressForm" id="frmAddAddress" autocomplete="off">
                    <input hidden type="text" id="addAddressId"/>
                    <!-- Address Desc, Address, Address2, City, State, Zip -->
                    <div class="addressItemAdd">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Street</label>
                                <input type="text" class="form-control" name="streetAdd"
                                       id="tboxStreetAdd">
                            </div>
                            <div class="form-group col-md-2">
                                <label>Suite</label>
                                <input type="text" class="form-control" name="suiteAdd"
                                       id="tboxSuiteAdd">
                            </div>
                            <div class="form-group col-md-4">
                                <label>City</label>
                                <input type="text" class="form-control" name="cityAdd"
                                       id="tboxCityAdd">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <label>State</label>
                                <input class="form-control" list="states" name="stateAdd"
                                       id="listStatesAdd">
                                <datalist id="states">
                                    <option value="MO">
                                    <option value="IL">
                                </datalist>
                            </div>
                            <div class="form-group col-md-2">
                                <label>Zip</label>
                                <input type="text" class="form-control" name="zipAdd"
                                       id="tboxZipAdd">
                            </div>
                            <div class="form-group col-md-5">
                                <label>Descr.</label>
                                <input type="text" class="form-control" name="addressDescrAdd"
                                       id="tboxAddressDescrAdd">
                            </div>
                            <div class="form-group col-md-2 align-self-end">
                                <button type='button' id='AddSaveButton'
                                        class='btn btn-outline-success mt-2 mx-0'>Save
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-primary' id="addAddressSaveButton">Add Address</button>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>
            </div>
        </div> <!-- end of modal-content-->
    </div> <!-- end of modal role=document -->
</div>
<!-- end of model fade -->