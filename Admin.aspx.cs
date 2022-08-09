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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check Session state if it is null redirect it to LogIn

            if (Session["adminusername"] == null && Session["adminpassword"] == null)
            {
                Response.Redirect("LogInPage.aspx");
            }
        }

        protected void LogOut(object sender, EventArgs e)
        {
            Session.Clear();

            Response.Redirect("LogInPage.aspx");
        }
        
        protected void Customer(object sender, EventArgs e)
        {
            Response.Redirect("CustomersDetail.aspx");
        }
        
        protected void Accountant(object sender, EventArgs e)
        {
            Response.Redirect("AccountantsDetail.aspx");
        }
        
        protected void Product(object sender, EventArgs e)
        {
            Response.Redirect("ProductDetails.aspx");
        }
    }
}