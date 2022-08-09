using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventorySystem
{
    public class Product
    {
        public int ID { get; set; }
        public string ProductName { get; set; }
        public string Category { get; set; }

        public Product() { }

        public Product(int id, string productName, string category)
        {
            ID = id;
            ProductName = productName;
            Category = category;
        }

        public List<Product> ListGenerator()
        {
            List<Product> productsDetail = new List<Product>();
            string[] productNames = { "huzefa", "HMH", "Huz", "Daim", "Junaid", "Dry", "Ahmad", "Jinnah", "Ahsan", "Ali", "huzefa", "HMH", "Huz", "Daim", "Junaid", "Dry", "Ahmad", "Jinnah", "Ahsan", "Ali", "huzefa", "HMH", "Huz", "Daim", "Junaid", "Dry", "Ahmad", "Jinnah", "Ahsan", "Ali" };
            string[] type = { "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", };
            for (int count = 0; count < productNames.Length; count++)
            {
                productsDetail.Add(new Product(count, productNames[count], type[count]));
            }
            return productsDetail;
        }
    }
}