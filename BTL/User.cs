using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL
{
    [Serializable]
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Role { get; set; }

        public User() { }
        public User(string username, string password, string phone, string role)
        {
            Username = username;
            Password = password;
            Phone = phone;
            Role = role;
        }
    }
}