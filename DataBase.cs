using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using System.Web.Script.Serialization;

namespace InventorySystem
{
    public class DataBase
    {
        static string conString = @"Data Source=DESKTOP-09RPO0H;Initial Catalog=InventorySystem;Persist Security Info=True;User ID=sa;Password=abdullah@3.31";
        SqlConnection connection = new SqlConnection(conString);

        //############################## CustomersDetail ###########################

        public DataTable GetCustomers()
        {
            connection.Open();
            string query = "SELECT * FROM Customer";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            DataTable dt = new DataTable();
            SDA.Fill(dt);
            connection.Close();
            return dt;
        }

        public void AddCustomer(string name, string address, string email)
        {
            connection.Open();
            string query = "INSERT INTO Customer(name,address,email) VALUES('" + name + "','" + address + "','" + email + "');";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            SDA.SelectCommand.ExecuteNonQuery();
            connection.Close();
        }

        public void DeleteCustomer(int id)
        {
            connection.Open();
            string query = "DELETE Customer WHERE id='" + id + "';";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            SDA.SelectCommand.ExecuteNonQuery();
            connection.Close();
        }

        public void UpdateCustomer(int id, string name, string address, string email)
        {
            connection.Open();
            string query = "UPDATE Customer SET name='" + name + "',address='" + address + "', email='" + email + "' WHERE id='" + id + "';";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            SDA.SelectCommand.ExecuteNonQuery();
            connection.Close();

        }


        //############################# Product Detail ####################################

        public DataTable GetProducts()
        {
            connection.Open();
            string query = "SELECT * FROM Product;";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            DataTable dt = new DataTable();
            SDA.Fill(dt);
            connection.Close();
            return dt;
        }

        public void AddProduct(string name, string category, double price)
        {
            connection.Open();
            string query = "INSERT INTO Product(name,category,price) VALUES('" + name + "','" + category + "','" + price + "');";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            SDA.SelectCommand.ExecuteNonQuery();
            connection.Close();
        }

        public void DeleteProduct(int id)
        {
            connection.Open();
            string query = "DELETE Product WHERE id='" + id + "';";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            SDA.SelectCommand.ExecuteNonQuery();
            connection.Close();
        }

        public void UpdateProduct(int id, string name, string category, double price)
        {
            connection.Open();
            string query = "UPDATE Product SET name='" + name + "', category='" + category + "', price='" + price + "' WHERE id='" + id + "';";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            SDA.SelectCommand.ExecuteNonQuery();
            connection.Close();
        }


        //############################# Accountant Detail ####################################

        public DataTable GetAccountant()
        {
            connection.Open();
            string query = "SELECT * FROM Accountant";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            DataTable dt = new DataTable();
            SDA.Fill(dt);
            connection.Close();
            return dt;
        }

        public void AddAccountant(string name, string username, string email, string password)
        {
            connection.Open();
            string query = "INSERT INTO Accountant(name,username,email,password) VALUES('" + name + "','" + username + "','" + email + "','" + password + "');";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            SDA.SelectCommand.ExecuteNonQuery();
            connection.Close();
        }

        public void DeleteAccountant(int id)
        {
            connection.Open();
            string query = "DELETE Accountant WHERE id='" + id + "';";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            SDA.SelectCommand.ExecuteNonQuery();
            connection.Close();
        }

        public void UpdateAccountant(int id, string name, string username, string email, string password)
        {
            connection.Open();
            string query = "UPDATE Accountant SET name='" + name + "', username='" + username + "', email='" + email + "', password='" + password + "' WHERE id='" + id + "';";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            SDA.SelectCommand.ExecuteNonQuery();
            connection.Close();
        }

        //#######################Authentication/////////////////////////////////////

        public DataTable Authentication(string username)
        {
            connection.Open();
            string query = "SELECT * FROM Accountant WHERE username='" + username + "';";
            SqlDataAdapter SDA = new SqlDataAdapter(query, connection);
            DataTable dt = new DataTable();
            SDA.Fill(dt);
            connection.Close();
            return dt;
        }

        //////////////////////   CUSTOMER OPPERAT

        public string JsonConverter(DataTable table)
        {
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
            Dictionary<string, object> childRow;
            foreach (DataRow row in table.Rows)
            {
                childRow = new Dictionary<string, object>();
                foreach (DataColumn col in table.Columns)
                {
                    childRow.Add(col.ColumnName, row[col]);
                }
                parentRow.Add(childRow);
            }
            return jsSerializer.Serialize(parentRow);
        }
    }
}