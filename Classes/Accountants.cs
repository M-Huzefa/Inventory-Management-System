using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventorySystem
{
    public class Accountants
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }

        public Accountants() { }

        public Accountants(int id, string name,string email, string phoneNumber)
        {
            ID = id;
            Name = name;
            Email = email;
            PhoneNumber = phoneNumber;
        }

        public List<Accountants> ListGenerator()
        {
            List<Accountants> accountantsDetail = new List<Accountants>();
            string[] names = { "huzefa", "HMH", "Huz", "Daim", "Junaid", "Dry", "Ahmad"};
            string[] email = { "huzefa@gmail.com", "HMH@gmail.com", "Huz@gmail.com", "Daim@gmail.com", "Junaid@gmail.com", "Dry@gmail.com", "Ahmad@gmail.com"};
            string[] phone = { "234532234", "2345324", "43256432", "324532", "324532", "234532234", "2345324"};
            for (int count = 0; count < names.Length; count++)
            {
                accountantsDetail.Add(new Accountants(count, names[count],email[count], phone[count]));
            }
            return accountantsDetail;
        }
    }
}