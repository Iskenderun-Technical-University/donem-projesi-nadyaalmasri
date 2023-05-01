using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmlakProject.Models
{
    public class UserModel
    {
        public string userId { get; set; }
        public string userFullName { get; set; }
        public string userEmail { get; set; }
        public string userPassword { get; set; }
        public string userPhone { get; set; }
    }
}