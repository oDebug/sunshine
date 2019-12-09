<form>
<div class="form-group row">
    <div class="col-sm-3">Contact Type:</div>
    <div class="col-sm-9">
        <div class="form-check form-check-inline">
            <input type="checkbox" class="form-check-input" id="orgType" >
            <label class="form-check-label" for="orgType">
                Organization
            </label>
        </div>
        <div class="form-check form-check-inline">
            <input type="checkbox" class="form-check-input" id="churchType" >
            <label class="form-check-label" for="churchType">
                Church
            </label>
        </div>
        <div class="form-check form-check-inline">
            <input type="checkbox" class="form-check-input" id="personType" >
            <label class="form-check-label" for="personType">
                Person
            </label>
        </div>
    </div>
</div>
<div class="form-group row">
    <label for="actionTypeSelect" class="col-sm-3 col-form-label">Action Type:</label>
    <div class="col-sm-9">
        <div class="form-group">
            <select multiple class="form-control" name="actionTypeSelect" id="actionTypeSelect">
                <option>Emailed</option>
                <option>GIK Drop-off</option>
                <option>GIK Pick-up</option>
                <option>Left Message</option>
                <option>Phone Call</option>
                <option>Sent Thank You Note</option>
                <option>Tour of Sunshine</option>
                <option>Visit/Speak at Church</option>
                <option>Other</option>
            </select>
        </div>
    </div>
</div>
<div class="form-group row">
    <label for="actionStatusSelect" class="col-sm-3 col-form-label">Action Status:</label>
    <div class="col-sm-9">
        <div class="form-group">
            <select multiple class="form-control" name="actionStatusSelect" id="actionStatusSelect">
                <option>In progress</option>
                <option>Completed</option>
                <option>Canceled</option>
            </select>
        </div>
    </div>
</div>
<div class="form-group row">
    <div class="col-sm-3">Date Type:</div>
    <div class="col-sm-9">
        <div class="form-group">
            <select class="custom-select" id="dateType">
                <option selected>Choose...</option>
                <option value="Created">Created</option>
                <option value="Completed">Completed</option>
            </select>
        </div>
    </div>
</div>
<div class="form-group row">
    <label for="startDate" class="col-sm-3">Start Date:</label>
    <div class="col-sm-9">
        <div class="form-group">
            <input type="date" class="form-control" id="startDate" >
        </div>
    </div>
</div>
<div class="form-group row">
    <label for="endDate" class="col-sm-3">End Date:</label>
    <div class="col-sm-9">
        <div class="form-group">
            <input type="date" class="form-control" id="endDate" >
        </div>
    </div>
</div>
<div class="form-group row justify-content-center">
    <div class="col-sm-3">
        <input type="button" id="buildReport" class="btn btn-secondary btn-block" value="Build">
    </div>
</div>
</form>