using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Script.Serialization;

namespace InventorySystem
{
    public partial class LogInPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check Session state if it is not null redirect it to greeting

            if (Session["adminusername"] != null && Session["adminpassword"] != null)
            {
                Response.Redirect("Admin.aspx");
            }

            if (Session["accountantusername"] != null && Session["accountantpassword"] != null)
            {
                Response.Redirect("Accountant.aspx");
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            string username = userName.Text;

            string passWord = password.Text;
            if (EmpStatus.SelectedValue == "Login As")
            {
                Response.Write("<script>alert('You want to Login as Admin or Accountant? Please Select one option to proceed')</script>");
            }

            if (EmpStatus.SelectedValue == "Admin")
            {
                if (username != "hmh11")
                {
                    Response.Write("<script>alert('username is not correct!')</script>"); //works great
                }
                else if (passWord != "shaheen")
                {
                    Response.Write("<script>alert('password is not correct!')</script>"); //works great
                }
                else
                {
                    Session["adminusername"] = username;
                    Session["adminpassword"] = passWord;
                    Response.Redirect("Admin.aspx");
                }
            }

            if (EmpStatus.SelectedValue == "Accountant")
            {
                //DataBase dataBase = new DataBase();
                DataTable data = new DataBase().Authentication(username);

                if (data.Rows.Count > 0)
                {
                    foreach (DataRow row in data.Rows)
                    {
                        if (passWord != row["password"].ToString())
                        {
                            Response.Write("<script>alert('password is not correct!')</script>"); //works great
                        }
                        else
                        {
                            Session["accountantusername"] = username;
                            Session["accountantpassword"] = passWord;
                            Response.Redirect("Accountant.aspx");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('username is not correct!')</script>");
                }
            }
        }
    }
}