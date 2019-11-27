<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Font Awsome
    Fonts and Icons free to use in commercial projects -->
    <link rel="stylesheet" href="../css/all.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/findTable.css">
    <link rel="stylesheet" href="../css/navbar_style.css">
    <link rel="stylesheet" href="../css/addContact_style.css">

<script src="javascript/jquery-3.4.1.min.js"></script>
<script src="javascript/searchContacts.js"></script>

    <title>Sunshine Ministries Contacts</title>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container"><!--Big Div for padding page -->
    <div class="col"></div>

    <div class="col-12">
        <div class="container mt-3 ml-4">
            <div class="row"><h3 class="ml-3">Contacts</h3></div>

            <div class="row">
                <div class="col-lg-5">
                    <div class="input-group">
                        <form class="input-group-prepend">
                            <button class="btn bg-primary text-white" id="submit-search">
                                <i class="fas fa-search"></i>
                            </button>
                            <input type="text" id="search-string" class="form-control" placeholder="Search by contact name" onkeyup="keyUpSearch(this.value)">
                        </form>
                    </div>
                </div>

                <div class="form-group col-lg-2 mt-3 ml-auto">
                    <button type="button" class="btn btn-primary btn-block" data-toggle="modal"
                            data-target="#inputContact">Add Contact
                    </button>
                </div>
                <!-- Input Modal -->
                <jsp:include page="addContactModal.jsp"/>
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
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- end of row class under contact contacts h3 -->
        </div>
    </div>
    <table id="contactTable" class="table table-hover table-bordered ml-3">
        <caption>Click on a table row to view more contact info and actions.</caption>
        <thead class="thead-dark">
        <tr class="header">
            <th>ID#</th>
            <th onclick="sortTable(0)">Name</th>
            <th>Contact Type</th>
            <th>Phone</th>
            <th>Address</th>
        </tr>
        </thead>
        <tbody id="tableResults">
        </tbody>
    </table>
</div>
</div>
<div class="col"></div>
</div> <!-- big div for padding page -->
<jsp:include page="editContact.jsp"/>
<!-- add action modal -->
<div class='modal fade' id="addAction" tableindex='-1' role="dialog" aria-labelledby="addActionLabel"
     area-hidden='true'>
    <div class="modal-dialog modal-lg" role='document'>
        <div class="modal-content">
            <div class="modal-header">

                <h5 class='modal-title' id="addActionLabel">Add Action</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class='modal-body'>
                <div class="form-group">
                    <label for="dateDue">Date Due</label>
                    <input type="date" class="form-control" id="dateDue" placeholder="YYYY-MMMM-DD">
                </div>
                <div class="form-group">
                    <label for="actionType">Type</label>
                    <input list="actionTypeList" type="text" class="form-control" id="actionType"
                           placeholder="Enter or Select Type">
                    <datalist id="actionTypeList">
                        <option value="Emailed"></option>
                        <option value="GIK Drop-off"></option>
                        <option value="GIK Pick-Up"></option>
                        <option value="Left Message"></option>
                        <option value="Phone Call"></option>
                        <option value="Sent Thank You Note"></option>
                        <option value="Tour of Sunshine"></option>
                        <option value="Visit/Speak at Church"></option>
                    </datalist>
                </div>
                <div class="form-group">
                    <label for="actionStatus">Status</label>
                    <select class="custom-select" id="actionStatus">
                        <option value="In Progress" selected>In Progress</option>
                        <option value="Complete">Complete</option>
                        <option value="Lapsed">Lapsed</option>
                        <option value="Canceled">Canceled</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="actionNote">Note</label>
                    <textarea class="form-control" id="actionNote" rows="3" placeholder=". . ."></textarea>
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck">
                        <label class="form-check-label" for="gridCheck">
                            Is this information complete and accurate?
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>
                <button type='button' class='btn btn-primary' id="submitAction" data-dismiss='modal'>Submit</button>
            </div>
        </div>
    </div>
</div>

</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="../javascript/popper.min.js"></script>
<script src="../javascript/bootstrap.min.js"></script>
<script>
    $("#frmAddContact").submit(function(e)
    {
        e.preventDefault(); //prevent usual post cycle
        var form = $(this); //set the form that called this method to a var
        var url = form.attr('action');
        alert("Data sent looks like: " + form.serialize());
        $.ajax({
            type:"POST",
            url: url,
            data: form.serialize(), //serialize the form input data
            success: function(data)
            {
                alert("Success: This is ajax at bottom of searchContacts.jsp"); //test alert
            }
        });

        $('#inputContact').modal('hide');
    })

    $('#contactTable').on("click", "#tableResults tr", function(e) {
        //show Modal for id in row
        $('#editContactModal').modal('show');
    });

    function setRemovingAlias(val) {
       document.getElementById("headerAlias").innerHTML = val;
    }

    function removeAlias()
    {
       var list = document.getElementById("inputGroupAliases");

       if(list.selectedIndex != 0)
       {
           var alias = list.options[list.selectedIndex].value;
           alert(alias);
           list.remove(list.selectedIndex);
       }
       else
       {
           alert("Select an alias");
       }
    }

    function typeChange()
    {
        var x = document.getElementById("selectboxType").value;
        var y = document.getElementById("lboxTypeDescriptions");

        if(x == "Church")
        {
            y.setAttribute("list", "churchTypeDescriptions");
        }
        else if(x == "Business")
        {
            y.setAttribute("list", "businessTypeDescriptions");
        }
        else if(x == "School")
        {
            y.setAttribute("list", "schoolTypeDescriptions");
        }
        else if(x == "Person")
        {
            y.setAttribute("list", "personTypeDescriptions");
        }
        else if(x == "Organization")
        {
            y.setAttribute("list", "orgTypeDescriptions");
        }
        else if(x == "Other")
        {
            y.setAttribute("list", "");
        }
    }
</script>

</body>
</html>