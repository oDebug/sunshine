<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="addActionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-lg modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Add New Action</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- input form -->
                <form name="addActionForm" id="frmAddAction" autocomplete="off">
                    <input hidden type="text" id="addActionId"/>
                    <div class="row">
                        <div class="col">
                            <div class="card p-3 mt-2 border-primary">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="selectboxActionTypeAdd">Action Type</label>
                                        <select class="custom-select" id="selectboxActionTypeAdd" name="type">
                                            <option selected="Donation - Money">Donation - Money</option>
                                            <option value="Donation - Gift in Kind">Donation - Gift in Kind</option>
                                            <option value="Correspondence">Correspondence</option>
                                            <option value="Personal Visit">Personal Visit</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Notes</label>
                                        <input type="text" class="form-control" id="tboxActionNotes" name="notes"
                                               placeholder="Notes...">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="selectActionStatus">Status</label>
                                        <select class='custom-select' id="selectActionStatus">
                                            <option selected='Completed'>Completed</option>
                                            <option value='Follow Up'>Follow Up</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class='modal-footer'>
<%--                <button type='button' class='btn btn-primary' onclick="clearAddForm()">Clear Form</button>--%>
                <button type='button' class='btn btn-primary' id="addActionSaveButton">Save changes</button>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>
            </div>
        </div> <!-- end of modal-content-->
    </div> <!-- end of modal role=document -->
</div>
<!-- end of model fade -->