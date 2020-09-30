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
    public class RezervasyonWebController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: RezervasyonWeb
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            ViewBag.masorID = new SelectList(db.Masors, "masorID", "masorAdSoyad");
            return View();
        }
        [HttpPost]
        public ActionResult Create(RezervasyonSpa spa)
        {
            if (ModelState.IsValid)
            {
                spa.active = false;
                spa.createDate = DateTime.Now;
                db.RezervasyonSpas.Add(spa);
                
                db.SaveChanges();
                return RedirectToAction("Index", "SpaWeb");
            }
            ViewBag.masorID = new SelectList(db.Masors, "masorID", "masorAdSoyad");
            return View(spa);
        }
    }
}