using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventorySystem
{
    public class Customer
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string PhoneNumber { get; set; }
        public int Age { get; set; }

        public Customer() { }

        public Customer(int id, string name, string phoneNumber, int age)
        {
            ID = id;
            Name = name;
            PhoneNumber = phoneNumber;
            Age = age;
        }

        public List<Customer> ListGenerator()
        {
            List<Customer> CustomersDetail = new List<Customer>();
            string[] names = { "huzefa", "HMH", "Huz", "Daim", "Junaid", "Dry", "Ahmad", "Jinnah", "Ahsan", "Ali", "huzefa", "HMH", "Huz", "Daim", "Junaid", "Dry", "Ahmad", "Jinnah", "Ahsan", "Ali", "huzefa", "HMH", "Huz", "Daim", "Junaid", "Dry", "Ahmad", "Jinnah", "Ahsan", "Ali" };
            string[] phone = { "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324", "43256432", "324532", "324532", };
            Random random = new Random();
            for (int count = 0; count < names.Length; count++)
            {
                //string rollNo = count.ToString() + random.Next(1, 100).ToString();
                CustomersDetail.Add(new Customer(count, names[count], phone[count], random.Next(10, 30)));
            }
            return CustomersDetail;
        }
    }
}