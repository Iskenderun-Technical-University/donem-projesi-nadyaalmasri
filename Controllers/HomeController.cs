using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EmlakProject.Models;
using EmlakProject.Services.Bussiness;

namespace EmlakProject.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login(UserModel userModel)
        {
            //return "Results UserName = " + userModel.Username + " PW = " + userModel.Password;
            SecurityService securityService = new SecurityService();
            Boolean success = securityService.Authenticate(null);

            if (success)
                return View("LoginSuccess", userModel);
            else
            {
                if(securityService.indexLogin == 1)
                    return View("Login");
                else
                    return View("LoginFailure");
            }
        }
        public ActionResult Buy()
        {
            ViewBag.Message = "Your buy list";

            return View();
        }
        public ActionResult Sell()
        {
            ViewBag.Message = "Your Sell list";

            return View();
        }
        public ActionResult Rent()
        {
            ViewBag.Message = "Your Rent list";

            return View();
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}