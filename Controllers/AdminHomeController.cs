using Otel.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;


namespace Otel.Controllers
{
    public class AdminHomeController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: AdminHome
        public ActionResult Index()
        {
            ViewBag.Wifimesaj = db.WifiMesajs.ToList();
            return View();
        }
    }
}
