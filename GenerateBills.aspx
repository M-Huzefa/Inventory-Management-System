<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenerateBills.aspx.cs" Inherits="InventorySystem.GenerateBills" %>

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

        @media (min-width: 576px) {
            .jumbotron {
                padding: 1rem 2rem;
            }
        }
        .errdiv {
            color: red;
            font-weight: bold;
        }

        label {
          margin-bottom: 0;
        }
        .tdaction {
          width: 15%;
        }
        .tdSr {
          width: 7%;
        }
        .jumbotron {
          margin-bottom: 0.5rem;
        }
        strong {
          font-size: 24px !important;
        }
        input.largerCheckbox {
          width: 20px;
          height: 20px;
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
            <h1 class="col">GENERATE BILL</h1>
        </div>
    </form>

    <div class="container">
    <div class="jumbotron text-center bg-success text-white">
      <h2>Generate Bill</h2>
    </div>
    <div class="form-row">
      <div class="col-md-3">
        <label>Item Name: <span class="errdiv"> *</span></label>
        <input id="txtName" type="text" class="form-control txt txtName" placeholder="Enter Name of the Item" required />
        <input id="txtId" type="hidden" class="form-control txt"/>
      </div>
      <div class="col-md-3 col-sm-6 col-6">
        <label>Market Price:<span class="errdiv"> *</span></label>
        <input id="txtContact" data-type="number" type="text" minlength="1" maxlength="10"
          class="form-control txt txtContact" placeholder="Price of the Item According to Market" required />
      </div>
      <div class="col-md-3 col-sm-6 col-6">
        <label>Discounted Price:</label>
        <input id="txtAltNo" type="text" class="form-control txt txtAltNo" minlength="1" maxlength="10"
          placeholder="Discounted Price Offered" />
      </div>
    </div>
    <div class="form-row">
      <div class="col-md-6 col-sm-7">
        <label>Quantity & Details<span class="errdiv"> *</span></label>
        <textarea id="txtAddress" class="form-control txt txtAddress" rows="3" minlength="15"
          placeholder="Enter Address" required></textarea>
      </div>
    </div>
    <div class="row pt-2">
      <div class="col-md-2">
        <button type="button" class="btn btn-success" id="btnSave">Save</button>
      </div>
      <div class="col-md-2">
        <button type="button" class="btn btn-secondary" id="btnClear">Clear</button>
      </div>
    </div>
    <div class="row pt-3">
      <div class="col-md-12 col-sm-12 col-12 p-2 ">
        <table id="tblData" class="table table-bordered table-hover table-striped">
          <thead>
            <tr>
              <th>Sr No</th>
              <th>Item Name:</th>
              <th>Market Price:</th>
              <th>Discounted Price</th>
              <th>Quantity and Remarks</th>
              <th class="text-center">Action</th>
            </tr>
          </thead>
          <tbody> 
          </tbody>
        </table>
      </div>
    </div>
      <form>
      <div class="form-row align-items-center">
        <div class="col-sm-3 my-1">
          <label class="sr-only" for="inlineFormInputName">Total</label>
          <input type="number" class="form-control" id="total" placeholder="Enter Total Sum" required/>
        </div>
        <div class="col-auto my-1">
          <button type="submit" class="btn btn-primary" onclick="GenerateBill()">Generate Bill</button>
        </div>
      </div>
    </form>
  </div>
  <script>
      var emptyRow = "<tr><td colspan='6' class='text-center'> No Items Purchased yet</td></tr>";
      $(document).ready(function () {
          loadDataFromLocal();
          $('#tblData').on('click', '.btn-edit', function () {
              const name = $(this).parent().parent().find(".txtName").html();
              const contact = $(this).parent().parent().find(".txtContact").html();
              const altContact = $(this).parent().parent().find(".txtAltNo").html();
              const address = $(this).parent().parent().find(".txtAddress").html();
              const id = $(this).parent().parent().find(".txtName").attr("data-id");
              $("#txtName").val(name);
              $("#txtContact").val(contact);
              $("#txtAltNo").val(altContact);
              $("#txtAddress").val(address);
              $("#txtId").val(id);
              $("#btnSave").text("Update");
          });
          $('#tblData').on('click', '.btn-delete', function () {
              const id = $(this).parent().parent().find(".txtName").attr("data-id");
              deleteDataFromLocal(id);
          });
          $("#btnSave").click(function () {
              if ($("#txtId").val() == '') {
                  addDataToLocal();
              } else {
                  updateDataFromLocal();
              }
          });
          $("#btnClear").click(function () {
              clearForm();
          });
      });
      function clearForm() {
          $("#txtName").val("");
          $("#txtContact").val("");
          $("#txtAltNo").val("");
          $("#txtAddress").val("");
          $("#btnSave").text("Add");
      }
      function addEmptyRow() {
          if ($("#tblData tbody").children().children().length == 0) {
              $("#tblData tbody").append(emptyRow);
          }
      }
      function loadDataFromLocal() {
          let localData = localStorage.getItem('localData');
          if (localData) {
              $("#tblData tbody").html("");
              let localArray = JSON.parse(localData);
              let index = 1;
              localArray.forEach(element => {
                  let dynamicTR = "<tr>";
                  dynamicTR = dynamicTR + "<td> " + index + "</td>";
                  dynamicTR = dynamicTR + "<td class='txtName'  data-id=" + element.id + ">" + element.name + "</td>";
                  dynamicTR = dynamicTR + "<td class='txtContact'>" + element.contact + "</td>";
                  dynamicTR = dynamicTR + "<td class='txtAltNo'>" + element.altContact + "</td>";
                  dynamicTR = dynamicTR + "<td class='txtAddress'>" + element.address + "</td>";
                  dynamicTR = dynamicTR + "    <td class='tdAction text-center'>";
                  dynamicTR = dynamicTR + "        <button class='btn btn-sm btn-success btn-edit'> Edit</button>";
                  dynamicTR = dynamicTR + "        <button class='btn btn-sm btn-danger btn-delete'> Delete</button>";
                  dynamicTR = dynamicTR + "    </td>";
                  dynamicTR = dynamicTR + " </tr>";
                  $("#tblData tbody").append(dynamicTR);
                  index++;
              });
          }
          addEmptyRow();
      }
      function addDataToLocal() {
          let localData = localStorage.getItem('localData');
          if (localData) {
              let localArray = JSON.parse(localData);
              const obj = {
                  id: localArray.length + 1,
                  name: $("#txtName").val(),
                  contact: $("#txtContact").val(),
                  altContact: $("#txtAltNo").val(),
                  address: $("#txtAddress").val()
              };
              localArray.push(obj);
              localStorage.setItem('localData', JSON.stringify(localArray));
              loadDataFromLocal();
          } else {
              const arryObj = [];
              const obj = {
                  id: 1,
                  name: $("#txtName").val(),
                  contact: $("#txtContact").val(),
                  altContact: $("#txtAltNo").val(),
                  address: $("#txtAddress").val()
              };
              arryObj.push(obj);
              localStorage.setItem('localData', JSON.stringify(arryObj));
              loadDataFromLocal();
          }
          clearForm();
      }
      function updateDataFromLocal() {
          debugger;
          let localData = localStorage.getItem('localData');
          let localArray = JSON.parse(localData);
          const oldRecord = localArray.find(m => m.id == $("#txtId").val());
          oldRecord.name = $("#txtName").val();
          oldRecord.contact = $("#txtContact").val();
          oldRecord.altContact = $("#txtAltNo").val();
          oldRecord.address = $("#txtAddress").val();
          localStorage.setItem('localData', JSON.stringify(localArray));
          loadDataFromLocal();
          clearForm();
      }
      function deleteDataFromLocal(id) {
          let localData = localStorage.getItem('localData');
          let localArray = JSON.parse(localData);
          let i = 0;
          while (i < localArray.length) {
              if (localArray[i].id === Number(id)) {
                  localArray.splice(i, 1);
              } else {
                  ++i;
              }
          }
          localStorage.setItem('localData', JSON.stringify(localArray));
          loadDataFromLocal();
      }
      function GenerateBill() {
          if ($("#tblData tbody").children().children().length == 1) {
              alert("No Items Added in Cart or Total Missing");
          }
          else {
              window.print("GenerateBill.aspx");
          }
      }
  </script>
</body>
</html>