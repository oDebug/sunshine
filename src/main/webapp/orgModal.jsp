<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class='modal fade' id='orgModal' tabindex='-1' role='dialog'>
    <div class='modal-dialog modal-lg' role='document'>
        <div class='modal-content'>
            <div class='modal-header'>
                <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                    <span aria-hidden='true'>&times;</span>
                </button>
            </div>
            <div class='modal-body'>
                <ul class='nav nav-tabs' id='contactTab' role='tablist'><!-- nav tabs -->
                    <li class='nav-item'>
                        <a class='nav-link active' id='info-tab' data-toggle='tab' href='#info' role='tab' aria-controls='info' aria-selected='true'>Info</a>
                    </li>
                    <li class='nav-item'>
                        <a class='nav-link' id='action-tab' data-toggle='tab' href='#action' role='tab' aria-controls='action' aria-selected='false'>Actions</a>
                    </li>
                    <li class='nav-item'>
                        <a class='nav-link' id='alias-tab' data-toggle='tab' href='#alias' role='tab' aria-controls='action' aria-selected='false'>Alias</a>
                    </li>
                    <li class='nav-item'>
                        <a class='nav-link' id='map-tab' data-toggle='tab' href='#map' role='tab' aria-controls='action' aria-selected='false'>Map</a>
                    </li>
                </ul>
                <div class='tab-content' id='myTabContent'>
                    <div class='tab-pane fade show active' id='info' role='tabpanel' aria-labelledby='info-tab'><!-- info tab -->
                        <h2 class="mt-3">View and Edit Contact</h2>
                        <form autocomplete="off">
                            <div class="form-row justify-content-center">
                                <div class="form-group-col-md-6">
                                    <label class="btn btn-md btn-default" name="rowContact">[Name for contact]</label>
                                </div>
                            </div>

                            <div class="card p-3 mt-2"> <!-- Name, Contact Type, Email, Type Description -->
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="nameEdit">Name</label>
                                        <input type="text" class="form-control" name="nameEdit" placeholder="Name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="aliasEdit">Contact Type</label>
                                        <select class="custom-select" id="selectboxType" onchange="typeChange()">
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
                                        <label for="emailEdit">Email</label>
                                        <input type="email" class="form-control" name="emailEdit" placeholder="Email">
                                    </div>
                                    <div class="form-group col-md-6" name="denomShow">
                                        <label for="lboxTypeDescriptions">Type Description</label>
                                        <input class="form-control" list="" id="lboxTypeDescriptions" name="typeDescriptions" placeholder="Denomination, Job Title, etc."> <!-- populate list based on contact type via javascript by changing list attribute-->
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
                                    <div class="form-group col-md-6 d-none " name="orgTypeShow">
                                        <label for="orgTypeEdit">Type</label>
                                        <input type="text" class="form-control" name="orgTypeEdit" placeholder="Type">
                                    </div>
                                </div>
                            </div>
                            <div class="card p-3 mt-2"> <!-- Address Desc, Address, Address2, City, State, Zip -->
                                <div class="form-row">
                                    <div class="form-group col-md-2">
                                        <label for="addressDescEdit">Address Desc.</label>
                                        <input type="text" class="form-control" name="addressDescEdit" placeholder="Mailing">
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label for="address1Edit">Address1</label>
                                        <input type="text" class="form-control" name="address1Edit" placeholder="1234 Main St">
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label for="address2Edit">Address2</label>
                                        <input type="text" class="form-control" name="address2Edit" placeholder="i.e. Apartment # or Office Room #">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="cityEdit">City</label>
                                        <input type="text" class="form-control" name="cityEdit">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="stateEdit">State</label>
                                        <input class="form-control" list="states" name="state">
                                        <datalist id="states">
                                            <option value="MO">
                                            <option value="IL">
                                        </datalist>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="zipEdit">Zip</label>
                                        <input type="text" class="form-control" name="zipEdit">
                                    </div>
                                </div>
                            </div>
                            <div class="card p-3 mt-2">
                                <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="phoneEdit">Phone</label>
                                    <input type="text" class="form-control" name="phoneEdit" placeholder="Phone">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="faxEdit">Fax</label>
                                    <input type="text" class="form-control" name="faxEdit" placeholder="Fax">
                                </div>
                            </div>
                            </div>
                            <div class="card p-3 mt-2">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="websiteEdit">Website URL:</label>
                                        <input type="text" class="form-control" name="website" id="websiteEdit" placeholder="https://example.com">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="facebookEdit">Facebook URL:</label>
                                        <input type="text" class="form-control" name="facebookEdit" id="facebookEdit" placeholder="https://example.com">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="instagramEdit">Instagram URL:</label>
                                        <input type="text" class="form-control" name="instagram" id="instagramEdit" placeholder="https://example.com">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="twitterEdit">Twitter URL:</label>
                                        <input type="text" class="form-control" name="twitter" id="twitterEdit" placeholder="https://example.com">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="gridCheck">
                                    <label class="form-check-label" for="gridCheck">
                                        Is this information complete and accurate?
                                    </label>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!---- action tab ------------------------------------------------------------------------------------------------------------------------------>
                    <div class='tab-pane fade' id='action' role='tabpanel' aria-labelledby='action-tab'>
                        <h2 class="mt-2">View Actions</h2>
                        <!-- add action button -->
                        <div class="form-row">
                            <div class="form-group col mb-0">
                                <div class="alert alert-success alert-dismissible fade mb-0 pr-0 " id="submitActionAlert" role="alert">
                                    <strong>Your action was added!</strong>
                                    <button type="button" class="close " aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-5 col-lg-3  ml-md-auto">
                                <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#addAction">Add Action</button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table id="actionTable" class="table table-hover table-bordered ">
                                <caption>Note: Dates are formatted as Year-Month-Day.</caption>
                                <thead class="thead-dark">
                                    <tr class="header">
                                        <th>Action ID</th>
                                        <th>Date Created</th>
                                        <th>Date Due</th>
                                        <th>Type</th>
                                        <th>Recent Notes</th>
                                        <th>Status</th>
                                        <th>Date Completed</th>
                                        <th class="d-none">Contact ID</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class='contactID1'>
                                        <td>1</td>
                                        <td>2019-10-21</td>
                                        <td>2019-10-23</td>
                                        <td>Left Message</td>
                                        <td>Call back to get the scuttlebutt</td>
                                        <td>In progress</td>
                                        <td>None</td>
                                        <td class="d-none">1</td>
                                    </tr>
                                    <tr class='contactID2'>
                                        <td>2</td>
                                        <td>2019-10-21</td>
                                        <td>2019-10-24</td>
                                        <td>Email</td>
                                        <td>Email about tour</td>
                                        <td>In progress</td>
                                        <td>None</td>
                                        <td class="d-none">2</td>
                                    </tr>
                                    <tr class='contactID2'>
                                        <td>3</td>
                                        <td>2019-10-23</td>
                                        <td>2019-10-25</td>
                                        <td>GIK Drop-off</td>
                                        <td>Pick up donation of blankets</td>
                                        <td>In progress</td>
                                        <td>None</td>
                                        <td class="d-none">2</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class='tab-pane fade' id='alias' role='tabpanel' aria-labelledby='alias-tab'>
                        <h2 id="titleHeader" class="mt-2">Aliases for</h2>
                        <form>
                            <div class="form-row">
                                <div class="col-6">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="New Alias">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button">Add Alias</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">

                                </div>
                            </div>
                        </form>

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
                                        <button class="btn btn-outline-danger" onclick="removeAlias()" type="button">Remove</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="alert alert-warning alert-dismissible fade show">
                            <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                    </div>


                    <div class='tab-pane fade' id='map' role='tabpanel' aria-labelledby='map-tab'>
                        <div id="map"></div>
                    </div>
                </div>
            </div>
            <div class='modal-footer'>
                <button type='button' class='btn btn-primary'>Save changes</button>
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>
            </div>
        </div>
    </div>
</div>
