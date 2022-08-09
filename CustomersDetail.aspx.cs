using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Data;

namespace InventorySystem
{
    public partial class CustomersDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminusername"] == null && Session["accountantusername"] == null)
            {
                Response.Redirect("LogInPage.aspx");
            }
        }

        protected void LogOut(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LogInPage.aspx");
        }

        protected void Home(object sender, EventArgs e)
        {
            if (Session["adminusername"] != null && Session["accountantusername"] == null)
            {
                Response.Redirect("Admin.aspx");
            }
            if (Session["adminusername"] == null && Session["accountantusername"] != null)
            {
                Response.Redirect("Accountant.aspx");
            }
        }

        protected void Accountant(object sender, EventArgs e)
        {
            if (Session["adminusername"] == null)
            {
                return;
            }
            else
            {
                Response.Redirect("AccountantsDetail.aspx");
            }
        }

        protected void Product(object sender, EventArgs e)
        {
            Response.Redirect("ProductDetails.aspx");
        }
        protected void Bills(object sender, EventArgs e)
        {
            if (Session["accountantusername"] == null)
            {
                return;
            }
            else
            {
                Response.Redirect("GenerateBills.aspx");
            }
        }

        [WebMethod]
        public static string GetCustomers()
        {
            var data = new DataBase().GetCustomers();
            return new DataBase().JsonConverter(data);
        }

        [WebMethod]
        public static string NewCustomer(string name, string address, string email)
        {
            new DataBase().AddCustomer(name, address, email);
            var data = new DataBase().GetCustomers();
            return new DataBase().JsonConverter(data);
        }

        [WebMethod]
        public static string DeleteCustomer(int id)
        {
            new DataBase().DeleteCustomer(id);
            var data = new DataBase().GetCustomers();
            return new DataBase().JsonConverter(data);
        }

        [WebMethod]

        public static string EditCustomer(int id, string name, string address, string email)
        {
            new DataBase().UpdateCustomer(id, name, address, email);
            var data = new DataBase().GetCustomers();
            return new DataBase().JsonConverter(data);
        }
    }
}