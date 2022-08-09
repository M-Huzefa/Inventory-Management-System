<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="InventorySystem.ProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <%--<script type="text/javascript" src="Scripts/ProductsDetails.js?v7"></script>--%>
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
                    <asp:Button class="btn btn-block" runat="server" Text="Customer Detail" onclick="Customer"></asp:Button>
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
            <h1 class="col">PRODUCT DETAIL</h1>
        </div>

        <div>
            <button type="button" class="btn btn-primary mb-5" id="newProduct" onclick="newProduct()"  data-toggle="modal" data-target="#productModal">
            <i class="mr-1 fa fa-plus"></i>Add New</button>
        </div>

        
        <div>
            <table id="ProductsTable">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
            </table>
        </div>

        <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="productModalLabel">Add Product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
        
                    <div class="modal-body">
                        <div class="alert alert-danger d-none text-center w-75 m-auto" role="alert" id="productError">
                            Please Enter Valid product Data
                        </div>
                        <div class="alert alert-success d-none text-center w-75 m-auto" role="alert" id="productSuccess">
                            Product has been added successfully
                        </div>

                        <div class="form-group ">
                            <label for="productName">Product Name</label>
                            <input type="text" name="productName" id="productName"  class="form-control"/>
                        </div>
                        <div class="form-group ">
                            <label for="productcategory">Category</label>
                            <input type="text" name="productcategory" id="productcategory"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="productprice">Price</label>
                            <input type="text" name="productprice" id="productprice" class="form-control"/>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     <%--<button type="button" class="btn btn-primary" id="addProduct">Add Product</button>--%>
                        <asp:Button text="Add Product" runat="server" ID="addProductBtn" CssClass="btn btn-primary"  OnClientClick="return AddProduct()"/>
                    </div>

                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">

        $(document).ready(function () {
            // call for products on page load
            $.ajax({
                url: 'ProductDetails.aspx/GetProducts',
                method: 'post',
                dataType: 'json',
                contentType: 'application/json',
                async: true,
                success: function (data) {
                    repFunc(data)
                }
            });
        })

        //function to add products

        function newProduct() {
            $("#productModalLabel").text("Add Product ")
            $('#addProductBtn').attr('onclick', 'return AddProduct()');
            $('#addProductBtn').val("Add Product")
            $("#productName").val("")
            $("#productcategory").val("")
            $("#productprice").val("")
            $("#productSuccess").addClass("d-none")
            $("#productError").addClass("d-none")
        }

        function AddProduct() {
            var name = $("#productName").val();
            var category = $("#productcategory").val();
            var price = $("#productprice").val();

            if (!name || !category || !price ) {
                $("#productSuccess").addClass("d-none")
                $("#productError").removeClass("d-none")
                return false
            }

            $.ajax({
                url: 'ProductDetails.aspx/NewProduct',
                method: 'post',
                dataType: 'json',
                data: JSON.stringify({ "name": name, "category": category, "price": price }),
                contentType: 'application/json',
                async: true,
                success: function (data) {
                    
                    var newTable = $('#ProductsTable').DataTable();
                    newTable.destroy();
                    repFunc(data)

                    $("#productError").addClass("d-none")
                    $("#productSuccess").removeClass("d-none")
                    $("#productName").val(null);
                    $("#productcategory").val(null);
                    $("#productprice").val(null);
                }
            });
        }

        //function to delete products
        function DeleteProduct(data) {
            let id = data;
            $.ajax({
                url: 'ProductDetails.aspx/DeleteProduct',
                method: 'post',
                dataType: 'json',
                data: JSON.stringify({ "id": id }),
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    var newTable = $('#ProductsTable').DataTable();
                    newTable.destroy();
                    repFunc(data)
                }
            });
        }

        //function to update products

        function editProduct(id) {

            $("#productModalLabel").text("Update Product Data")
            $("#productSuccess").addClass("d-none")
            $("#productSuccess").text("Product has been updated Successfully")
            $("#productError").addClass("d-none")

            var table = $("#ProductsTable").DataTable();
            var data = table.rows().data();
            var productData;
            for (let i = 0; i < data.length; i++) {
                let temp = data[i]
                if (temp.id === id) {
                    productData = data[i]
                }
            }

            $("#productName").val(productData.name)
            $("#productcategory").val(productData.category)
            $("#productprice").val(productData.price)
            $('#addProductBtn').attr('onclick', 'return updateProduct(' + id + ')');
            $('#addProductBtn').val("Update")
        }

        function updateProduct(id) {

            var name = $("#productName").val();
            var category = $("#productcategory").val();
            var price = $("#productprice").val();

            if (!name || !category || !price ) {
                $("#productSuccess").addClass("d-none")
                $("#productError").removeClass("d-none")
                return false
            }

            $.ajax({
                url: 'ProductDetails.aspx/EditProduct',
                type: 'post',
                data: JSON.stringify({ "id": id, "name": name, "category": category, "price": price }),
                contentType: 'application/json',
                async: false,
                success: function (data) {
                   
                    var newTable = $('#ProductsTable').DataTable();
                    newTable.destroy();
                    repFunc(data)

                    $("#productError").addClass("d-none")
                    $("#productSuccess").removeClass("d-none")
                    $("#productName").val(null);
                    $("#productcategory").val(null);
                    $("#productprice").val(null);
                }
            })
        }

        //Repeated Function

        function repFunc(data) {
            $('#ProductsTable').DataTable({
                data: JSON.parse(data.d),
                columns: [
                    { "data": "id"},
                    { "data": "name"},
                    { "data": "category"},
                    { "data": "price"},
                    {
                        'data': 'id',
                        "render": function (data, type, row, meta) {
                            var editButton = '<button type="button" id="editBtn" data-toggle="modal" data-target="#productModal" class="btn action-btn btn-success btn-sm edit-btn mr-1" onclick="editProduct(' + data + ')">Edit</button>';
                            var deleteButton = '<button type="button" class="btn action-btn btn-danger btn-sm delete-btn" onclick="DeleteProduct(' + data + ')">Delete</button>';
                            return editButton + " | " + deleteButton;
                        },
                        "sortable": false,
                        "searchable": false,
                        "visible": true
                    }
                ]
            });
        }
    </script>
</body>
</html>