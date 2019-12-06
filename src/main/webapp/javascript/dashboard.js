$(document).ready(function ($) {
    $('#contactTableDashboard').on("click", "#tableResultsDashboard tr", function (e) {
        var id = $(this).attr('id');
        openEditForm(id);
    });
    $('#actionTableDashboard').on("click", "#actionTableResultsDashboard tr", function (e) {
        var id = $(this).attr('id');
        openEditForm(id);
    });
});

