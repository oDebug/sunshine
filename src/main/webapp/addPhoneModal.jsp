<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="addPhoneModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-lg modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Add New Phone</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- input form -->
                <form name="addPhoneForm" id="frmAddPhone" autocomplete="off">
                    <div class="card p-3 mt-2 border-primary">
                        <div class='phoneItemAdd' id='Phone'>
                            <div class='form-row'>
                                <div class='form-group col-md-4'>
                                    <input hidden type='text' id='phoneIdAdd'>
                                    <label>Phone</label>
                                    <input type='text' class='form-control' name='phoneAdd' id='tboxPhoneAdd' value=''>
                                </div>
                                <div class='form-group col-md-3'>
                                    <label>Ext.</label>
                                    <input type='text' class='form-control' name='extensionAdd' id='tboxExtensionAdd' value=''>
                                </div>
                                <div class='form-group col-md-3'>
                                    <label>Type</label>
                                    <input type='text' class='form-control' name='typeAdd' id='tboxTypeAdd' value=''>
                                </div>

                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-primary' id="addPhoneSaveButton">Add Phone</button>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>
            </div>
        </div> <!-- end of modal-content-->
    </div> <!-- end of modal role=document -->
</div>
<!-- end of model fade -->

