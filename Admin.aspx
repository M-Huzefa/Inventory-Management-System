<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="InventorySystem.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <script src="https://kit.fontawesome.com/706298219e.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            background-image: radial-gradient(#fec89a, #f7b267 )
        }

        i{
            font-size: 150px;
        }
        
        .container{
            height: 100vh;
        }

        .row{
            text-align: center;
            align-items: center;
        }

        .i-row{
            height: 40%;
        }

        .t-row{
            height: 20%;
            font-size: 70px;
            font-weight: bold;
            word-spacing: 40px;
            letter-spacing: 10px;
            color: blue;
        }

        .btn{
            font-size: 24px;
            border: none;
            background-color: inherit;
        }

    </style>
    <title>Admin</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">

            <div class="row i-row">
                <div class="col">
                    <asp:LinkButton class="btn btn-primary my-2 my-sm-0" runat="server" onclick="Customer">
                        <i class="fa-solid fa-person"></i><br />Customers Detail
                    </asp:LinkButton>
                </div>
                <div class="col">
                    <asp:LinkButton class="btn btn-success my-2 my-sm-0" runat="server" onclick="Accountant">
                        <i class="fa-solid fa-receipt"></i><br />Accountant Detail
                    </asp:LinkButton>
                </div>
            </div>

            <div class="row t-row">
                <div class="col">ADMIN PORTAL</div>
            </div>

            <div class="row i-row">
                <div class="col">
                    <asp:LinkButton class="btn btn-info my-2 my-sm-0" runat="server" onclick="Product">
                        <i class="fa-solid fa-cookie-bite"></i><br />Product Detail
                    </asp:LinkButton>
                </div>
                <div class="col">
                    <asp:LinkButton class="btn btn-danger my-2 my-sm-0" runat="server" onclick="LogOut">
                        <i class="fa-solid fa-right-from-bracket"></i><br />Logout
                    </asp:LinkButton>
                </div>
            </div>
 
        </div>

    </form>
</body>
</html>