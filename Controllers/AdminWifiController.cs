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
    public class AdminWifiController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: AdminWifi
        public ActionResult Index()
        {
            var wifiler = db.Wifis.ToList();

            return View(wifiler);
        }
        public ActionResult Create()
        {
            ViewBag.odaID = new SelectList(db.Odas, "odaID", "odaNo");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Wifi wifi )
        {
            if (ModelState.IsValid)
            {
                db.Wifis.Add(wifi);
            db.SaveChanges();
            return RedirectToAction("Index", "AdminWifi");
            }

            ViewBag.odaID = new SelectList(db.Odas, "odaID", "odaNo");
            return View(wifi);

        }


        public ActionResult Edit(int wifiID)
        {
            var wifiler = db.Wifis.Where(x => x.wifiID == wifiID).SingleOrDefault();
            ViewBag.odaID = new SelectList(db.Odas, "odaID", "odaNo", wifiler.odaID);

            if (wifiler == null)
            {
                return HttpNotFound();
            }
            return View(wifiler);
        }
        [HttpPost]
        public ActionResult Edit(Wifi wifi, int wifiID)
        {

            if (ModelState.IsValid)
            {
                var wifiler = db.Wifis.Where(u => u.wifiID == wifiID).SingleOrDefault();
                
           
                wifiler.wifiPassword = wifi.wifiPassword;
                wifiler.active=wifi.active;


                db.SaveChanges();
                return RedirectToAction("Index", "AdminWifi", new { wifiID = wifiler.wifiID });
            }
            ViewBag.odaID = new SelectList(db.Odas, "odaID", "odaNo", wifi.odaID);
            return View(wifi);
        }


        public JsonResult DeleteWifiRecord(int wifiID)
        {
            bool result = false;
            Wifi usr = db.Wifis.SingleOrDefault(x => x.wifiID == wifiID);
            if (usr != null)
            {
                db.Wifis.Remove(usr);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}