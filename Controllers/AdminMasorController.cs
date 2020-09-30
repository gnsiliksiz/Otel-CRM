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
    public class AdminMasorController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: AdminMasor
        public ActionResult Index()
        {
            var masorler = db.Masors.ToList();
            return View(masorler);
      
        }
        public ActionResult Create()
        {
            ViewBag.spaID = new SelectList(db.Spas, "spaID", "spaAd");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Masor masor)
        {
            if (ModelState.IsValid)
            {
                
                db.Masors.Add(masor);
                db.SaveChanges();

                return RedirectToAction("Index", "AdminMasor");
            }
            ViewBag.spaID = new SelectList(db.Spas, "spaID", "spaAd");
            return View(masor);
        }


        public ActionResult Edit(int masorID)
        {
            var masorler = db.Masors.Where(x => x.masorID == masorID).SingleOrDefault();
            ViewBag.spaID = new SelectList(db.Spas, "spaID", "spaAd", masorler.spaID);

            if (masorler == null)
            {
                return HttpNotFound();
            }
            return View(masorler);
        }
        [HttpPost]
        public ActionResult Edit(Masor masor, int masorID)
        {
            if (ModelState.IsValid)
            {
                var masors = db.Masors.Where(u => u.masorID == masorID).SingleOrDefault();
                masors.spaID = masor.spaID;
                masors.masorAdSoyad = masor.masorAdSoyad;
                masors.masorTC = masor.masorTC;
                masors.masorCinsiyet = masor.masorCinsiyet;
                masors.masorDogTar = masor.masorDogTar;
                masors.masorTel = masor.masorTel;





                db.SaveChanges();
                return RedirectToAction("Index", "AdminMasor", new { masorID = masors.masorID });
            }
            ViewBag.spaID = new SelectList(db.Spas, "spaID", "spaAd", masor.spaID);

            return View();

        }
        public JsonResult DeleteMasorRecord(int masorID)
        {
            bool result = false;
            Masor msr = db.Masors.SingleOrDefault(x => x.masorID == masorID);
            if (msr != null)
            {
                db.Masors.Remove(msr);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

    }
}