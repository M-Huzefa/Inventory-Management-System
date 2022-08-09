<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountantsDetail.aspx.cs" Inherits="InventorySystem.AccountantsDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accountants</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <%--<script type="text/javascript" src="Scripts/accountantsDetails.js?v7"></script>--%>
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
                    <asp:Button class="btn btn-block" runat="server" Text="Customer Detail" onclick="Customer"></asp:Button>
                </div>
                <div class="col">
                    <asp:Button class="btn btn-block" runat="server" Text="Product Detail" onclick="Product"></asp:Button>
                </div>
                <div class="col">
                    <asp:Button class="btn btn-block" runat="server" Text="LogOut" OnClick="LogOut"></asp:Button>
                </div>
            </div>
        </div>

        <div class="form-row" id="heading">
            <h1 class="col">ACCOUNTANT DETAIL</h1>
        </div>

        <div>
            <button type="button" class="btn btn-primary mb-5" id="newAccountant" onclick="newAccountantc()"  data-toggle="modal" data-target="#accountantModal">
            <i class="mr-1 fa fa-plus"></i>Add New</button>
        </div>

        <div>
            <table id="accountantsTable" class="hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>UserName</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Actions</th>
                    </tr>
                </thead>
            </table>
        </div>

        <div class="modal fade" id="accountantModal" tabindex="-1" aria-labelledby="accountantModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="accountantModalLabel">Add Accountant</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
        
                    <div class="modal-body">
                        <div class="alert alert-danger d-none text-center w-75 m-auto" role="alert" id="accountantError">
                            Please Enter Valid accountant Data
                        </div>
                        <div class="alert alert-success d-none text-center w-75 m-auto" role="alert" id="accountantSuccess">
                            Accountant has been added successfully
                        </div>
                        
                        <div class="form-group ">
                            <label for="accountantName">Name</label>
                            <input type="text" name="accountantName" id="accountantName"  class="form-control"/>
                        </div>
                        <div class="form-group ">
                            <label for="accountantUserName">Username</label>
                            <input type="text" name="accountantUserName" id="accountantUserName"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="accountantEmail">Email</label>
                            <input type="email" name="accountantEmail" id="accountantEmail" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="accountantPassword">Password</label>
                            <input type="password" name="accountantPassword" id="accountantPassword" class="form-control"/>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     <%--<button type="button" class="btn btn-primary" id="addaccountant">Add accountant</button>--%>
                        <asp:Button text="Add Accountant" runat="server" ID="addAccountantBtn" CssClass="btn btn-primary"  OnClientClick="return AddAccountant()"/>
                    </div>

                </div>
            </div>
        </div>

    </form>

    <script type="text/javascript">

        $(document).ready(function () {
            // call for accountants on page load
            $.ajax({
                url: 'AccountantsDetail.aspx/GetAccountant',
                method: 'post',
                dataType: 'json',
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    repFunc(data)
                }
            });
            return false
        })

        //Function to Add Accountant

        function newAccountantc() {
            $("#accountantModalLabel").text("Add Accountant ")
            $('#addAccountantBtn').attr('onclick', 'return AddAccountant()');
            $('#addAccountantBtn').val("Add Accountant")
            $("#accountantName").val("")
            $("#accountantUserName").val("")
            $("#accountantEmail").val("")
            $("#accountantPassword").val("")
            $("#accountantSuccess").addClass("d-none")
            $("#accountantError").addClass("d-none")
        }

        function AddAccountant() {

            var name = $("#accountantName").val();
            var username = $("#accountantUserName").val();
            var email = $("#accountantEmail").val();
            var password = $("#accountantPassword").val();

            if (!name || !username || !email || !password || !validateEmail(email)) {
                $("#accountantSuccess").addClass("d-none")
                $("#accountantError").text("Please Enter Valid accountant Data")
                $("#accountantError").removeClass("d-none")
                return false
            }

            var table = $("#accountantsTable").DataTable();
            var data = table.rows().data();
            for (let i = 0; i < data.length; i++) {
                let temp = data[i]
                if (username === temp.username) {
                    $("#accountantError").text("Username already exist")
                    $("#accountantError").removeClass("d-none")
                    return false
                }
            }

            $.ajax({
                url: 'AccountantsDetail.aspx/NewAccountant',
                method: 'post',
                dataType: 'json',
                data: JSON.stringify({ "name": name, "username": username, "email": email, "password": password }),
                contentType: 'application/json',
                async: false,
                success: function (data) {

                    var newTable = $('#accountantsTable').DataTable();
                    newTable.destroy();
                    repFunc(data)

                    $("#accountantError").addClass("d-none")
                    $("#accountantSuccess").text("Accountant has been added successfully")
                    $("#accountantSuccess").removeClass("d-none")
                    $("#accountantName").val(null);
                    $("#accountantUserName").val(null);
                    $("#accountantEmail").val(null);
                    $("#accountantPassword").val(null);

                }
            });
            return false
        }

        //Function to Delete Accountant

        function DeleteAccountant(id) {
            $.ajax({
                url: 'AccountantsDetail.aspx/DeleteAccountant',
                method: 'post',
                dataType: 'json',
                data: JSON.stringify({ "id": id }),
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    var newTable = $('#accountantsTable').DataTable();
                    newTable.destroy();
                    repFunc(data)
                }
            });
            return false
        }

        //Edit Accountant#############################

        function editAccountant(id) {

            $("#accountantModalLabel").text("Update Accountant Data")
            $("#accountantSuccess").addClass("d-none")
            $("#accountantError").addClass("d-none")

            var table = $("#accountantsTable").DataTable();
            var data = table.rows().data();
            var accountantData;
            for (let i = 0; i < data.length; i++) {
                let temp = data[i]
                if (temp.id === id) {
                    accountantData = data[i]
                }
            }

            $("#accountantName").val(accountantData.name)
            $("#accountantUserName").val(accountantData.username)
            $("#accountantEmail").val(accountantData.email)
            $("#accountantPassword").val(accountantData.password)
            $('#addAccountantBtn').attr('onclick', 'return updateAccountant(' + id + ')');
            $('#addAccountantBtn').val("Update")
        }

        function updateAccountant(id) {

            var name = $("#accountantName").val();
            var username = $("#accountantUserName").val();
            var email = $("#accountantEmail").val();
            var password = $("#accountantPassword").val();

            if (!name || !username || !email || !password || !validateEmail(email)) {
                $("#accountantSuccess").addClass("d-none")
                $("#accountantError").text("Please Enter Valid accountant Data")
                $("#accountantError").removeClass("d-none")
                return false
            }

            var table = $("#accountantsTable").DataTable();
            var data = table.rows().data();
            for (let i = 0; i < data.length; i++) {
                let temp = data[i]
                if (username === temp.username && temp.id !== id) {
                    $("#accountantError").text("Username already exist")
                    $("#accountantError").removeClass("d-none")
                    return false
                }
            }

            $.ajax({
                url: 'AccountantsDetail.aspx/EditAccountant',
                type: 'post',
                data: JSON.stringify({ "id": id, "name": name, "username": username, "email": email, "password": password }),
                contentType: 'application/json',
                async: false,
                success: function (data) {

                    var newTable = $('#accountantsTable').DataTable();
                    newTable.destroy();
                    repFunc(data)

                    $("#accountantError").addClass("d-none")
                    $("#accountantSuccess").text("Accountant has been updated Successfully")
                    $("#accountantSuccess").removeClass("d-none")
                    $("#accountantName").val(null);
                    $("#accountantUserName").val(null);
                    $("#accountantEmail").val(null);
                    $("#accountantPassword").val(null);
                }
            });
            return false
        }

        //TABLE GENERATOR FUNCTION
        function repFunc(data) {
            $('#accountantsTable').DataTable({
                data: JSON.parse(data.d),
                columns: [
                    { "data": "id" },
                    { "data": "name" },
                    { "data": "username" },
                    { "data": "email" },
                    { "data": "password" },
                    {
                        'data': 'id',
                        "render": function (data, type, row, meta) {
                            var editButton = '<button type="button" id="editBtn" data-toggle="modal" data-target="#accountantModal" class="btn action-btn btn-success btn-sm edit-btn mr-1" onclick="editAccountant(' + data + ')">Edit</button>';
                            var deleteButton = '<button type="button" class="btn action-btn btn-danger btn-sm delete-btn" onclick="DeleteAccountant(' + data + ')">Delete</button>';
                            return editButton + " | " + deleteButton;
                        },
                        "sortable": false,
                        "searchable": false,
                        "visible": true
                    }
                ]
            });
        }

        //Email Validation
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