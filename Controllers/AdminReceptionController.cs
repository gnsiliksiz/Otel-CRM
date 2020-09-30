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
    public class AdminReceptionController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: AdminReception
        public ActionResult Index()
        {
            var resepsiyon = db.Receptions.ToList();
            return View(resepsiyon);

       
        }

        public ActionResult Create()
        {
            ViewBag.receptionID = new SelectList(db.Receptions, "receptionID", "receptionNumara");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Reception rcpt)
        {

            ViewBag.receptionID = new SelectList(db.Receptions, "receptionID", "receptionNumara");
            db.Receptions.Add(rcpt);
            db.SaveChanges();
            return RedirectToAction("Index", "AdminReception");

        }

        public ActionResult Edit(int receptionID)
        {
            var resepsiyonlar = db.Receptions.Where(x => x.receptionID == receptionID).SingleOrDefault();
            ViewBag.receptionID = new SelectList(db.Receptions, "receptionID", "receptionNumara", resepsiyonlar.receptionID);
            if (resepsiyonlar == null)
            {
                return HttpNotFound();
            }
            return View(resepsiyonlar);
        }
        [HttpPost]
        public ActionResult Edit(Reception rcpt, int receptionID)
        {
            var resepsiyonlar = db.Receptions.Where(u => u.receptionID == receptionID).SingleOrDefault();

            resepsiyonlar.receptionNumara = rcpt.receptionNumara;

            db.SaveChanges();
            return RedirectToAction("Index", "AdminReception", new { keepID = resepsiyonlar.receptionID });
 
        
        }

        public JsonResult DeleteReceptionRecord(int receptionID)
        {
            bool result = false;
            Reception rcpt = db.Receptions.SingleOrDefault(x => x.receptionID == receptionID);
            if (rcpt != null)
            {
                db.Receptions.Remove(rcpt);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}