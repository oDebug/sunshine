var table = $('#table_id').DataTable({
    ajax: {
        "url": "getReport",
        "type": "GET"
    }
})