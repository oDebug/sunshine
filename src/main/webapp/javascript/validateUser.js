$(document).ready(function () {
    $('#login').click(function () {
        $.ajax({
            url: "/validate",
            type: "GET",
            data: {userid: $('#userid').val(), userpass: $('#userpass').val()},
            success: function (data) {
                window.location = 'dashboard';
            },
            error: function () {
                window.location = '/';
            }
        })
    });
})