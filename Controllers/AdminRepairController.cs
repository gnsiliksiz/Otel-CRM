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
    public class AdminRepairController : Controller
    {
        // GET: AdminRepair
        OtelQrEntities db = new OtelQrEntities();
        public ActionResult Index()
        {
            //var arizalar = db.Arizas.Where(x=>x.active == true).ToList();
            var arizalar = db.Arizas.ToList();
            return View(arizalar);
        }

        public ActionResult Create()
        {
            ViewBag.arizaID = new SelectList(db.Arizas, "arizaID", "arizaAd");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Ariza usr)
        {

            ViewBag.arizaID = new SelectList(db.Arizas, "arizaID", "arizaAd");
            db.Arizas.Add(usr);
            db.SaveChanges();
            return RedirectToAction("Index", "AdminRepair");

        }

        public ActionResult Edit(int arizaID)
        {
            var arizalar = db.Arizas.Where(x => x.arizaID == arizaID ).SingleOrDefault();
            ViewBag.arizaID = new SelectList(db.Arizas, "arizaID", "arizaAd", arizalar.arizaID);
            if (arizalar == null)
            {
                return HttpNotFound();
            }
            return View(arizalar);
        }
        [HttpPost]
        public ActionResult Edit(Ariza ariza, int arizaID)
        {

            ViewBag.arizaID = new SelectList(db.Arizas, "arizaID", "arizaAd", ariza.arizaID);
            //return RedirectToAction("Index", "AdminRepair");
            return View();
        }

        public JsonResult DeleteRepairRecord(int arizaID)
        {
            bool result = false;
            Ariza usr = db.Arizas.SingleOrDefault(x => x.arizaID == arizaID);
            if (usr != null)
            {
                db.Arizas.Remove(usr);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}