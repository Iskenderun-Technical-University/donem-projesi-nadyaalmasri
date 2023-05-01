using EmlakProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmlakProject.Controllers
{
    public class HouseController : Controller
    {
        // GET: House
        public ActionResult Index()
        {
            return View("House");
        }
        public string House(HouseModel houseModel)
        {
            return "Code : "+ houseModel.houseCode + " Price : " + houseModel.housePrice;
        }
    }
}