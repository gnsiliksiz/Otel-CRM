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
    public class AdminHousekeepingController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        public ActionResult Index()
        {
            var keepler = db.Keeps.ToList();

            return View(keepler);
        }
        public ActionResult Create()
        {
            ViewBag.keepID = new SelectList(db.Keeps, "keepID", "keepAd");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Keep usr)
        {
           
            ViewBag.keepID = new SelectList(db.Keeps, "keepID", "keepAd");
            db.Keeps.Add(usr);
            db.SaveChanges();
            return RedirectToAction("Index", "AdminHousekeeping");

        }

        public ActionResult Edit(int keepID)
        {
            var keepler = db.Keeps.Where(x => x.keepID == keepID).SingleOrDefault();
            ViewBag.keepID = new SelectList(db.Keeps, "keepID", "keepAd", keepler.keepID);
            if (keepler == null)
            {
                return HttpNotFound();
            }
            return View(keepler);
        }
        [HttpPost]
        public ActionResult Edit(Keep keep, int keepID)
        {
            var keepler = db.Keeps.Where(u => u.keepID == keepID).SingleOrDefault();

            keepler.keepAd = keep.keepAd;

            db.SaveChanges();
            return RedirectToAction("Index", "AdminHousekeeping", new { keepID = keepler.keepID });
            //ViewBag.keepID = new SelectList(db.Keeps, "keepID", "keepAd", keep.keepID);
           
        }

        public JsonResult DeleteKeepRecord(int keepID)
        {
            bool result = false;
            Keep usr = db.Keeps.SingleOrDefault(x => x.keepID == keepID);
            if (usr != null)
            {
                usr.active = false;
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }



    
    }
}