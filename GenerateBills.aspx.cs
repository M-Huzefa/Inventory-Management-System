using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventorySystem
{
    public partial class GenerateBills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["adminusername"] == null && Session["accountantusername"] == null)
            //{
            //    Response.Redirect("LogInPage.aspx");
            //}
        }

        protected void LogOut(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LogInPage.aspx");
        }

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("Accountant.aspx");
        }

        protected void Product(object sender, EventArgs e)
        {
            Response.Redirect("ProductDetails.aspx");
        }

        protected void Customer(object sender, EventArgs e)
        {
            Response.Redirect("CustomersDetail.aspx");
        }
    }
}