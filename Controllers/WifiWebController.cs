using Otel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Otel.Controllers
{
    
    public class WifiWebController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: WifiWeb
        public ActionResult Index()
        {
            var keepler = db.Wifis.ToList();
            return View(keepler);
        }
        public ActionResult Create()
        {           
            return View();
        }
        [HttpPost]
        public ActionResult Create(Wifi wifi)
        {
            if (ModelState.IsValid)
            {
                wifi.active = true;
                wifi.Date= DateTime.Now;
                db.Wifis.Add(wifi);
                db.SaveChanges();
                return RedirectToAction("Index", "WifiWeb");
            }
           
            return View(wifi);
        }

    }
}