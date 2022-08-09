using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventorySystem
{
    public partial class AccountantsDetail : System.Web.UI.Page
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
            Response.Redirect("Admin.aspx");
        }

        protected void Customer(object sender, EventArgs e)
        {
            Response.Redirect("CustomersDetail.aspx");
        }

        protected void Product(object sender, EventArgs e)
        {
            Response.Redirect("ProductDetails.aspx");
        }

        [WebMethod]
        public static string GetAccountant()
        {
            var data = new DataBase().GetAccountant();
            return new DataBase().JsonConverter(data);
        }

        [WebMethod]
        public static string NewAccountant(string name, string username, string email, string password)
        {
            new DataBase().AddAccountant(name, username, email, password);
            var data = new DataBase().GetAccountant();
            return new DataBase().JsonConverter(data);
        }

        [WebMethod]
        public static string DeleteAccountant(int id)
        {
            new DataBase().DeleteAccountant(id);
            var data = new DataBase().GetAccountant();
            return new DataBase().JsonConverter(data);
        }

        [WebMethod]
        public static string EditAccountant(int id, string name, string username, string email, string password)
        {
            new DataBase().UpdateAccountant(id, name, username, email, password);
            var data = new DataBase().GetAccountant();
            return new DataBase().JsonConverter(data);
        }
    }
}