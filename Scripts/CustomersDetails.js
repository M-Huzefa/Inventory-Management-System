//$(document).ready(function () {
//    $.ajax({
//        url: 'CustomersDetail.aspx/GetCustomers',
//        method: 'post',
//        dataType: 'json',
//        contentType: 'application/json',
//        async: false,
//        success: function (data) {
//            $('#customersTable').DataTable({
//                data: JSON.parse(data.d),
//                columns: [
//                    { "targets": 0, "data": "ID", "searchable": true, "sortable": false },
//                    { "targets": 1, "data": "Name", "searchable": true, "sortable": false },
//                    { "targets": 2, "data": "PhoneNumber", "searchable": true, "sortable": false },
//                    { "targets": 3, "data": "Age", "searchable": true, "sortable": false },
//                    { "targets": 4,
//                        "render": function (data, type, row, meta) {
//                            var editButton = '<button type="button" class="btn action-btn btn-primary btn-sm edit-btn mr-1">Edit</button>';
//                            var deleteButton = '<button type="button" class="btn action-btn btn-danger btn-sm delete-btn" onclick="DeleteCustomer()" >Delete</button>';
//                            return editButton + " | " + deleteButton;
//                        },
//                        "sortable": false,
//                        "searchable": false,
//                        "visible": true
//                    }
//                ]
//            });
//        },
//        Error: function () {
//            alert("DataTable Failed to load Successfuly");
//        }
//    });
//})

//function AddCustomer() {
//    console.log("function calling")
//    var name = document.getElementById("cName").value;
//    var phone = document.getElementById("cMblNumber").value;
//    var age = document.getElementById("cAge").value;
    
//    $.ajax({
//        url: 'CustomersDetail.aspx/NewCustomer',
//        method: 'post',
//        dataType: 'json',
//        data: JSON.stringify({ "name": name, "mobile": phone, "age": age }),
//        contentType: 'application/json',
//        async: false,
//        success: function (data) {
//            document.getElementById("cName").value = null;
//            document.getElementById("cMblNumber").value = null;
//            document.getElementById("cAge").value = null;
//            var newTable = $('#customersTable').DataTable();
//            newTable.destroy();
//            $('#customersTable').DataTable({
//                data: JSON.parse(data.d),
//                columns: [
//                    { "targets": 0, "data": "ID", "searchable": true, "sortable": false },
//                    { "targets": 1, "data": "Name", "searchable": true, "sortable": false },
//                    { "targets": 2, "data": "PhoneNumber", "searchable": true, "sortable": false },
//                    { "targets": 3, "data": "Age", "searchable": true, "sortable": false },
//                    { "targets": 4,
//                        "render": function (data, type, row, meta) {
//                            var editButton = '<button type="button" class="btn action-btn btn-primary btn-sm edit-btn mr-1" data-id="' + row.id + '">Edit</button>';
//                            var deleteButton = '<button type="button" id="delete" class="btn action-btn btn-danger btn-sm delete-btn" onclick="DeleteCustomer()" data-id="' + row.id + '">Delete</button>';
//                            return editButton + " | " + deleteButton;
//                        },
//                        "sortable": false,
//                        "searchable": false,
//                        "visible": true
//                    }
//                ]
//            });
            
//        },
//        Error: function () {
//            alert("DataTable Failed to load Successfuly");
//        }
//    });
//}

////$('#delete').click(function () {
////    var ids = $.map(table.rows('.selected').data(), function (item) {
////        return item[0]
////    });
////    console.log(ids)
////});


//function DeleteCustomer() {
//    var id = document.getElementById("row.id");
//    console.log(id);
//    $.ajax({
//        url: 'CustomersDetail.aspx/DeleteCustomer',
//        method: 'post',
//        dataType: 'json',
//        data: JSON.stringify({ "id": id }),
//        contentType: 'application/json',
//        async: false,
//        success: function (data) {
//            var newTable = $('#customersTable').DataTable();
//            newTable.destroy();
//            $('#customersTable').DataTable({
//                data: JSON.parse(data.d),
//                columns: [
//                    { "targets": 0, "data": "ID", "searchable": true, "sortable": false },
//                    { "targets": 1, "data": "Name", "searchable": true, "sortable": false },
//                    { "targets": 2, "data": "PhoneNumber", "searchable": true, "sortable": false },
//                    { "targets": 3, "data": "Age", "searchable": true, "sortable": false },
//                    { "targets": 4,
//                        "render": function (data, type, row, meta) {
//                            var editButton = '<button type="button" class="btn action-btn btn-primary btn-sm edit-btn mr-1" data-id="' + row.id + '">Edit</button>';
//                            var deleteButton = '<button type="button" class="btn action-btn btn-danger btn-sm delete-btn" onclick="DeleteCustomer()" data-id="' + row.id + '">Delete</button>';
//                            return editButton + " | " + deleteButton;
//                        },
//                        "sortable": false,
//                        "searchable": false,
//                        "visible": true
//                    }
//                ]
//            });
//        },
//        Error: function () {
//            alert("DataTable Failed to load Successfuly");
//        }
//    });
//}