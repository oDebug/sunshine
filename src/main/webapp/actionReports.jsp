<form class="d-none" name="actionReport" id="frmActionReport" autocomplete="off">
<div class="form-group row">
    <label for="contactTypeSelect" class="col-sm-3 col-form-label">Contact Type:</label>
    <div class="col-sm-9">
        <div class="form-group">
            <select multiple class="form-control" name="contactTypeSelect" id="contactTypeSelect">
                <option>Church</option>
                <option>Organization</option>
                <option>Business</option>
                <option>School</option>
                <option>Person</option>
                <option>Other</option>
            </select>
        </div>
        <div class="alert alert-danger d-none" id="contactTypeAlert" role="alert">
            <strong>Please select one, or more, contact type(s).</strong>
        </div>
    </div>
</div>
<div class="form-group row">
    <label for="actionTypeSelect" class="col-sm-3 col-form-label">Action Type:</label>
    <div class="col-sm-9">
        <div class="form-group">
            <select multiple class="form-control" name="actionTypeSelect" id="actionTypeSelect">
                <option value="Emailed">Emailed</option>
                <option value="GIK Drop-off">GIK Drop-off</option>
                <option value="GIK Pick-up">GIK Pick-up</option>
                <option value="Left Message">Left Message</option>
                <option value="Phone Call">Phone Call</option>
                <option value="Sent Thank You Note">Sent Thank You Note</option>
                <option value="Tour of Sunshine">Tour of Sunshine</option>
                <option value="Visit/Speak at Church">Visit/Speak at Church</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="alert alert-danger d-none" id="actionTypeAlert" role="alert">
            <strong>Please select one, or more, action type(s).</strong>
        </div>
    </div>
</div>

<%--<div class="form-group row">--%>
<%--    <label for="actionStatusSelect" class="col-sm-3 col-form-label">Action Status:</label>--%>
<%--    <div class="col-sm-9">--%>
<%--        <div class="form-group">--%>
<%--            <select multiple class="form-control" name="actionStatusSelect" id="actionStatusSelect">--%>
<%--                <option>In Progress</option>--%>
<%--                <option>Completed</option>--%>
<%--                <option>Canceled</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="alert alert-danger d-none" id="actionStatusAlert" role="alert">--%>
<%--            <strong>Please select one, or more, action status.</strong>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="form-group row">--%>
<%--    <div class="col-sm-3">Date Type:</div>--%>
<%--    <div class="col-sm-9">--%>
<%--        <div class="form-group">--%>
<%--            <select class="custom-select" id="dateType">--%>
<%--                <option selected>Choose...</option>--%>
<%--                <option value="Created">Created</option>--%>
<%--                <option value="Completed">Completed</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="form-group row">--%>
<%--    <label for="actionStartDate" class="col-sm-3">Start Date:</label>--%>
<%--    <div class="col-sm-9">--%>
<%--        <div class="form-group">--%>
<%--            <input type="date" class="form-control" id="actionStartDate" >--%>
<%--        </div>--%>
<%--        <div class="alert alert-danger d-none" id="actionStartDateAlert" role="alert">--%>
<%--            <strong>Please select a start date.</strong>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="form-group row">--%>
<%--    <label for="actionEndDate" class="col-sm-3">End Date:</label>--%>
<%--    <div class="col-sm-9">--%>
<%--        <div class="form-group">--%>
<%--            <input type="date" class="form-control" id="actionEndDate" >--%>
<%--        </div>--%>
<%--        <div class="alert alert-danger d-none" id="actionEndDateAlert" role="alert">--%>
<%--            <strong>Please select an end date.</strong>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="form-group row justify-content-center">
    <div class="col-sm-3">
        <button type="button" id="buildActionReport" class="btn btn-secondary btn-block" >Build</button>
    </div>
</div>
</form>