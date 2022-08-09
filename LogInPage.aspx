<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="InventorySystem.LogInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<link rel="stylesheet" href="LogInStyle.css" />--%>
    <title>Login Page</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body{
            background-image: radial-gradient( #1FE4E2 , #B588F7);
        }
        #container{
            background-color:#FFFFFF;
            display: flex;
            flex-direction: column;
            margin: 15vh auto;
            padding: 40px 100px 30px 100px;
            width: 35%;
            height: 70vh;
            border-radius: 10px;
        }

        h1{
            color: #17FFFF;
        }
        p{
            padding-bottom: 50px;
        }
       
        #container #userName, #container #password, #EmpStatus{
            font-size: 18px;
            padding: 5px;
            margin-bottom: 25px;
            border: none;
            border-bottom: 1px solid #505b5b;
            outline: none;
        }

        #container #userName:hover,
        #container #password:hover,
        #EmpStatus:hover{
            border-bottom: 2px solid #17FFFF;
        }

        #fchild{
            color: lightgrey;
        }

        #button{
            color: white;
            padding: 0.5em;
            margin-top: 20px;
            font-size: 21px;
            background-image: linear-gradient(60deg, #5E28FD , #BD63DE);
            border: none;
            border-radius: 5px;
        }
        #container #button:hover{
            background-image: linear-gradient(210deg, #5E28FD , #BD63DE);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Login</h1>
            <p>Enter your detail below to continue</p>

            <asp:DropDownList id="EmpStatus" runat="server">
                <asp:ListItem id="fchild" runat="server" text="Login As"></asp:ListItem>
                <asp:ListItem runat="server" Text="Admin"></asp:ListItem>
                <asp:ListItem runat="server" Text="Accountant"></asp:ListItem>
            </asp:DropDownList>

            <asp:textbox id="userName" runat="server" Placeholder="UserName" ></asp:textbox>

            <asp:textbox id="password" runat="server" placeholder="Password" type="password" ></asp:textbox>
            

            <asp:button id="button" runat="server" OnClientClick="javascript: return hiddenval()" onclick="LogIn" text="LogIn" />
        </div>
    </form>
</body>
</html>