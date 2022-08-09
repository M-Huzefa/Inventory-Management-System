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
    public partial class ProductDetails : System.Web.UI.Page
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

        protected void Customer(object sender, EventArgs e)
        {
            Response.Redirect("CustomersDetail.aspx");
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
        public static string GetProducts()
        {
            var data = new DataBase().GetProducts();
            return new DataBase().JsonConverter(data);
        }

        [WebMethod]
        public static string NewProduct(string name, string category, double price)
        {
            new DataBase().AddProduct(name, category, price);
            var data = new DataBase().GetProducts();
            return new DataBase().JsonConverter(data);
        }

        [WebMethod]
        public static string DeleteProduct(int id)
        {
            new DataBase().DeleteProduct(id);
            var data = new DataBase().GetProducts();
            return new DataBase().JsonConverter(data);
        }


        [WebMethod]

        public static string EditProduct(int id, string name, string category, double price)
        {
            new DataBase().UpdateProduct(id, name, category, price);
            var data = new DataBase().GetProducts();
            return new DataBase().JsonConverter(data);
        }
    }
}