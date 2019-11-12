<!-- sorting columns by clicking headers -->
// function sortTable(n) {
//     var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
//     table = document.getElementById("contactTable");
//     switching = true;
//     // Set the sorting direction to ascending:
//     dir = "asc";
//     /* Make a loop that will continue until
//     no switching has been done: */
//     while (switching) {
//         // Start by saying: no switching is done:
//         switching = false;
//         rows = table.rows;
//         /* Loop through all table rows (except the
//         first, which contains table headers): */
//         for (i = 1; i < (rows.length - 1); i++) {
//             // Start by saying there should be no switching:
//             shouldSwitch = false;
//             /* Get the two elements you want to compare,
//             one from current row and one from the next: */
//             x = rows[i].getElementsByTagName("TD")[n];
//             y = rows[i + 1].getElementsByTagName("TD")[n];
//             /* Check if the two rows should switch place,
//             based on the direction, asc or desc: */
//             if (dir == "asc") {
//                 if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
//                     // If so, mark as a switch and break the loop:
//                     shouldSwitch = true;
//                     break;
//                 }
//             } else if (dir == "desc") {
//                 if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
//                     // If so, mark as a switch and break the loop:
//                     shouldSwitch = true;
//                     break;
//                 }
//             }
//         }
//         if (shouldSwitch) {
//             /* If a switch has been marked, make the switch
//             and mark that a switch has been done: */
//             rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
//             switching = true;
//             // Each time a switch is done, increase this count by 1:
//             switchcount++;
//         } else {
//             /* If no switching has been done AND the direction is "asc",
//             set the direction to "desc" and run the while loop again. */
//             if (switchcount == 0 && dir == "asc") {
//                 dir = "desc";
//                 switching = true;
//             }
//         }
//     }
// }

function showResults(str) {
    if (str.length == 0) {
        document.getElementById("tblResults").innerHTML = "";
        return;
    } else {
        $.ajax({
            url: "/listOrgs?name=" + str,
            type: "GET",
            success: function (data) {
                generateTable(data);
            }
        })
    }
};

function generateTable(data) {
    $("#tableResults").empty();

    var table = $("#tableResults");

    var headerRow = "<thead class=\"thead-dark\">" +
        "<tr class=\"header\">" +
        "<th>ID#</th>" +
        "<th onclick=\"sortTable(0)\">Name</th>" +
        "<th>Contact Type</th>" +
        "<th>Phone#</th>" +
        "<th>Address</th>" +
        "<%-- <th>Upcoming Action Due</th> --%>" +
        "</tr>" +
        "</thead>";

    table.append(headerRow);

    for(var i=0; i< data.links.id.length; i++){
        table.append(createRow(data.links.id[i]));
    }
}

function createRow(data) {
    var trElement = "<tr class=\"clickable-row\">";
    trElement+= "<td><a href='editOrganization?id=" + data.id + "'>" + data.id + "</a></td>";
    trElement+="<td>data.name</td></td>";
    trElement+="<td>data.type</td>";
    trElement+="<td>data.phone[0].phone}</td>";
    trElement+="<td>data.address[0].address}</td></tr>";
    return trElement;
}
$(document).ready(function ($) {
    $(".clickable-row").click(function () {
        window.location = $(this).data("href");
    });
});