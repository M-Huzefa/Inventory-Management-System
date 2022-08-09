<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomersDetail.aspx.cs" Inherits="InventorySystem.CustomersDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <%--<script type="text/javascript" src="Scripts/CustomersDetails.js?v7"></script>--%>
    
        <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing:border-box;
        }
        
        body{
            background-image: radial-gradient(#fcf6bd, #d4a373);
            width:85%;
            margin:auto;
            font-family:Cambria, Cochin, Georgia, Times, Times New Roman, serif;
        }

        #heading{
            letter-spacing:15px;
            word-spacing: 30px;
            text-align: center;
            padding: 10px;
            margin: 20px 0;
        }
        
        #heading h1{
            font-weight: 900;
        }

        .container{
            min-width: 100%;
            margin: 0;
            text-align: center;
            background-image: linear-gradient(#264653, #2a9d8f);   
            border-radius: 5px;
        }

        .container .col{
            padding: 0;
        }

        .container .btn{
            font-size: 24px;
            color: #e9c46a;
            font-weight: 900;
        }
        .container .btn:hover{
            color: aqua; 
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <div class="col">
                    <asp:Button class="btn btn-block " runat="server" Text="Home" OnClick="Home"></asp:Button>
                </div>
                <div class="col">
                    <asp:Button class="btn btn-block" runat="server" Text="Accountant Detail" onclick="Accountant"></asp:Button>
                </div>
                <div class="col">
                    <asp:Button class="btn btn-block" runat="server" Text="Product Detail" onclick="Product"></asp:Button>
                </div>
                <div class="col">
                    <asp:Button class="btn btn-block" runat="server" Text="Generate Bill" onclick="Bills"></asp:Button>
                </div>
                <div class="col">
                    <asp:Button class="btn btn-block" runat="server" Text="LogOut" OnClick="LogOut"></asp:Button>
                </div>
            </div>
        </div>

        <div class="form-row" id="heading">
            <h1 class="col">CUSTOMER DETAIL</h1>
        </div>

        <div>
            <button type="button" class="btn btn-primary mb-5" id="newCustomer" onclick="newCustomerClick()"  data-toggle="modal" data-target="#customerModal">
            <i class="mr-1 fa fa-plus"></i>Add New</button>
        </div>

        <div>
            <table id="customerTable" class="hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
            </table>
        </div>


        <div class="modal fade" id="customerModal" tabindex="-1" aria-labelledby="customerModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="customerModalLabel">Add Customer</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
        
                    <div class="modal-body">
                        <div class="alert alert-danger d-none text-center w-75 m-auto" role="alert" id="customerError">
                            Please Enter Valid customer Data
                        </div>
                        <div class="alert alert-success d-none text-center w-75 m-auto" role="alert" id="customerSuccess">
                            Customer has been added successfully
                        </div>

                        <div class="form-group ">
                            <label for="customerFName">First Name</label>
                            <input type="text" name="customerFName" id="customerFName"  class="form-control"/>
                        </div>
                        <div class="form-group ">
                            <label for="customerLName">Address</label>
                            <input type="text" name="customerLName" id="customerLName"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="customerEmail">Email</label>
                            <input type="email" name="customerEmail" id="customerEmail" class="form-control"/>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     <%--<button type="button" class="btn btn-primary" id="addProduct">Add Product</button>--%>
                        <asp:Button text="Add Customer" runat="server" ID="addCustomerBtn" CssClass="btn btn-primary"  OnClientClick="return AddCustomer()"/>
                    </div>

                </div>
            </div>
        </div>   
    </form>

    <%--######################## JAvaScript ########################--%>

    <script type="text/javascript">
        $(document).ready(function () {
                // call for customers on page load
            $.ajax({
                url: 'CustomersDetail.aspx/GetCustomers',
                method: 'post',
                dataType: 'json',
                contentType: 'application/json',
                async: true,
                success: function (data) {
                    repFunc(data)
                }
            });
            return false
        })

        //Function to Add customers

        function newCustomerClick() {
            $("#customerModalLabel").text("Add Customer ")
            $('#addCustomerBtn').attr('onclick', 'return AddCustomer()');
            $('#addCustomerBtn').val("Add Customer")
            $("#customerFName").val("")
            $("#customerLName").val("")
            $("#customerEmail").val("")
            $("#customerSuccess").addClass("d-none")
            $("#customerError").addClass("d-none")
        }

        function AddCustomer() {
            var name = $("#customerFName").val();
            var address = $("#customerLName").val();
            var email = $("#customerEmail").val();

            if (!name || !address || !email || !validateEmail(email)) {
                $("#customerSuccess").addClass("d-none")
                $("#customerError").removeClass("d-none")
                return false
            }

            $.ajax({
                url: 'CustomersDetail.aspx/NewCustomer',
                method: 'post',
                dataType: 'json',
                data: JSON.stringify({ "name": name, "address": address, "email": email }),
                contentType: 'application/json',
                async: true,
                success: function (data) {

                    var newTable = $('#customerTable').DataTable();
                    newTable.destroy();
                    repFunc(data)

                    $("#customerError").addClass("d-none")
                    $("#customerSuccess").removeClass("d-none")
                    $("#customerFName").val(null);
                    $("#customerLName").val(null);
                    $("#customerEmail").val(null);
                }
            });
            return false
        }

        //Function to delete customers

        function DeleteCustomer(data) {
            let id = data;
            $.ajax({
                url: 'CustomersDetail.aspx/DeleteCustomer',
                method: 'post',
                dataType: 'json',
                data: JSON.stringify({ "id": id }),
                contentType: 'application/json',
                async: true,
                success: function (data) {
                    var newTable = $('#customerTable').DataTable();
                    newTable.destroy();
                    repFunc(data)
                }
            });
            return false
        }

        //funtion to update customers

        function editCustomerClick2(id) {

            $("#customerModalLabel").text("Updated Customer Data")
            $("#customerSuccess").addClass("d-none")
            $("#customerSuccess").text("Update Customer Successfully")
            $("#customerError").addClass("d-none")

            var table = $("#customerTable").DataTable();
            var data = table.rows().data();
            var customerData;
            for (let i = 0; i < data.length; i++) {
                let temp = data[i]
                if (temp.id === id) {
                    customerData = data[i]
                }
            }

            $("#customerFName").val(customerData.name)
            $("#customerLName").val(customerData.address)
            $("#customerEmail").val(customerData.email)
            $('#addCustomerBtn').attr('onclick', 'return updateCustomer(' + id + ')');
            $('#addCustomerBtn').val("Update")
        }

        function updateCustomer(id) {
            //let id = data;
            var name = $("#customerFName").val();
            var address = $("#customerLName").val();
            var email = $("#customerEmail").val();

            if (!name || !address || !email || !validateEmail(email)) {
                $("#customerSuccess").addClass("d-none")
                $("#customerError").removeClass("d-none")
                return false
            }

            $.ajax({
                url: 'CustomersDetail.aspx/EditCustomer',
                type: 'post',
                data: JSON.stringify({ "id": id, "name": name, "address": address, "email": email }),
                contentType: 'application/json',
                async: true,
                success: function (data) {

                    var newTable = $('#customerTable').DataTable();
                    newTable.destroy();
                    repFunc(data)

                    $("#customerError").addClass("d-none")
                    $("#customerSuccess").removeClass("d-none")
                    $("#customerFName").val(null);
                    $("#customerLName").val(null);
                    $("#customerEmail").val(null);
                }
            });
            return false
        }

        //repeated Function

        function repFunc(data) {
            $('#customerTable').DataTable({
                data: JSON.parse(data.d),
                columns: [
                    { "data": "id"},
                    { "data": "name"},
                    { "data": "address"},
                    { "data": "email"},
                    {
                        'data': 'id',
                        "render": function (data, type, row, meta) {
                            var editButton = '<button type="button" id="editBtn" data-toggle="modal" data-target="#customerModal" class="btn action-btn btn-success btn-sm edit-btn mr-1" onclick="editCustomerClick2(' + data + ')">Edit</button>';
                            var deleteButton = '<button type="button" class="btn action-btn btn-danger btn-sm delete-btn" onclick="DeleteCustomer(' + data + ')">Delete</button>';
                            return editButton + " | " + deleteButton;
                        },
                        "sortable": false,
                        "searchable": false,
                        "visible": true
                    }
                ]
            });
        }

        //validate Email

        function validateEmail(email) {
            var regEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;;
            if (email.match(regEx)) {
                return true;
            }

            else {
                return false;
            }
        }
        
    </script>
</body>
</html>
