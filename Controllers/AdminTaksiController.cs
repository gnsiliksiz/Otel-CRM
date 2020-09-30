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
    public class AdminTaksiController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: AdminTaksi
        public ActionResult Index()
        {
            var taksiler = db.Taksis.ToList();
            return View(taksiler);
        }
        public ActionResult Create()
        {
            ViewBag.taksiID = new SelectList(db.Taksis, "taksiID", "taksiAd");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Taksi taksi)
        {
           
            ViewBag.taksiID = new SelectList(db.Taksis, "taksiID", "taksiAd");
            db.Taksis.Add(taksi);
            db.SaveChanges();
            return RedirectToAction("Index", "AdminTaksi");

        }

        public ActionResult Edit(int taksiID)
        {
            var taksiler = db.Taksis.Where(x => x.taksiID == taksiID).SingleOrDefault();
            ViewBag.taksiID = new SelectList(db.Taksis, "taksiID", "taksiAd", taksiler.taksiID);
            if (taksiler == null)
            {
                return HttpNotFound();
            }
            return View(taksiler);
        }
        [HttpPost]
        public ActionResult Edit(Taksi taksi, int taksiID)
        {
            var taksiler = db.Taksis.Where(u => u.taksiID == taksiID).SingleOrDefault();

            taksiler.taksiAd = taksi.taksiAd;
            taksiler.taksiAdres = taksi.taksiAdres;
            taksiler.taksiDurakAd = taksi.taksiDurakAd;
            taksiler.taksiTelefon = taksi.taksiTelefon;
            db.SaveChanges();
            return RedirectToAction("Index", "AdminTaksi", new { taksiID = taksiler.taksiID });
       
        }
        public JsonResult DeleteTaksiRecord(int taksiID)
        {
            bool result = false;
            Taksi usr = db.Taksis.SingleOrDefault(x => x.taksiID == taksiID);
            if (usr != null)
            {
                db.Taksis.Remove(usr);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

    }
}