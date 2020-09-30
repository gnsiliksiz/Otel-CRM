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
    public class AdminActiviteController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: AdminActivite
        public ActionResult Index()
        {
            var oteller = db.Activites.ToList();
            return View(oteller);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Activite act, HttpPostedFileBase activiteResim)
        {
            if (ModelState.IsValid)
            {
                if (activiteResim != null)
                {
                    WebImage img = new WebImage(activiteResim.InputStream);
                    FileInfo fotoinfo = new FileInfo(activiteResim.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(300, 200);
                    img.Save("~/Uploads/" + newfoto);
                    act.activiteResim = "/Uploads/" + newfoto;
                    act.active = true;
                    db.Activites.Add(act);
                    db.SaveChanges();
                    return RedirectToAction("Index", "AdminActivite");
                }
                else
                {
                    ModelState.AddModelError("Fotoğraf", "Fotoğraf Seçiniz");
                }
            }
         
            return View(act);
        }

        public ActionResult Edit(int activiteID)
        {
            var activiteler = db.Activites.Where(x => x.activiteID == activiteID).SingleOrDefault();
            ViewBag.activiteID = new SelectList(db.Activites, "activiteID", "activiteAD", activiteler.activiteID);
            if (activiteler == null)
            {
                return HttpNotFound();
            }
            return View(activiteler);
        }
        [HttpPost]
        public ActionResult Edit(Activite activite, int activiteID, HttpPostedFileBase activiteResim)
        {
            if (ModelState.IsValid)
            {
                var activites = db.Activites.Where(u => u.activiteID == activiteID).SingleOrDefault();
                if (activiteResim != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(activite.activiteResim)))
                    {
                        System.IO.File.Delete(Server.MapPath(activite.activiteResim));
                    }
                    WebImage img = new WebImage(activiteResim.InputStream);
                    FileInfo fotoinfo = new FileInfo(activiteResim.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(150, 150);
                    img.Save("~/Uploads/" + newfoto);
                    activites.activiteResim = "/Uploads/" + newfoto;
                }
                activites.activiteAdi = activite.activiteAdi;
                activites.activiteAciklama = activite.activiteAciklama;
                activites.active = activite.active;
                activites.startDate = activite.startDate;
                activites.endDate = activite.endDate;
                activites.activiteYer = activite.activiteYer;
                activites.startTime = activite.startTime;
                activites.endTime = activite.endTime;
              
                activites.activiteSure = activite.activiteSure;
                activites.kontenjan = activite.kontenjan;
                activites.activiteFiyat = activite.activiteFiyat;

                activites.Konaklama = activite.Konaklama;
                activites.Restoran = activite.Restoran;
         



                db.SaveChanges();
                return RedirectToAction("Index", "AdminActivite", new { activiteID = activites.activiteID });
            }
            //ViewBag.activiteID = new SelectList(db.Activites, "activiteID", "activiteAD", activite.activiteID);
            return View();
        }


        public JsonResult DeleteActiviteRecord(int activiteID)
        {
            bool result = false;
            Activite usr = db.Activites.SingleOrDefault(x => x.activiteID == activiteID);
            if (usr != null)
            {
                //usr.active = false;
                db.Activites.Remove(usr);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}