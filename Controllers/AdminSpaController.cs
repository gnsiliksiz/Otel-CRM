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
    public class AdminSpaController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: AdminSpa
        public ActionResult Index()
        {
            var oteller = db.Spas.Where(q=>q.active ==true).ToList();
            return View(oteller);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Spa spa, HttpPostedFileBase spaResim)
        {
            if (ModelState.IsValid)
            {
                if (spaResim != null)
                {
                    WebImage img = new WebImage(spaResim.InputStream);
                    FileInfo fotoinfo = new FileInfo(spaResim.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(300, 200);
                    img.Save("~/Uploads/" + newfoto);
                    spa.spaResim = "/Uploads/" + newfoto;
                    spa.active = true;
                    db.Spas.Add(spa);
                    db.SaveChanges();
                    return RedirectToAction("Index", "AdminSpa");
                }
                else
                {
                    ModelState.AddModelError("Fotoğraf", "Fotoğraf Seçiniz");
                }
            }

            return View(spa);
        }

        public ActionResult Edit(int spaID)
        {
            var spalar = db.Spas.Where(x => x.spaID == spaID).SingleOrDefault();
           
            if (spalar == null)
            {
                return HttpNotFound();
            }
            return View(spalar);
        }
        [HttpPost]
        public ActionResult Edit(Spa spa, int spaID, HttpPostedFileBase spaResim)
        {
            if (ModelState.IsValid)
            {
                var spas = db.Spas.Where(u => u.spaID == spaID).SingleOrDefault();
                if (spaResim != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(spa.spaResim)))
                    {
                        System.IO.File.Delete(Server.MapPath(spa.spaResim));
                    }
                    WebImage img = new WebImage(spaResim.InputStream);
                    FileInfo fotoinfo = new FileInfo(spaResim.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(150, 150);
                    img.Save("~/Uploads/" + newfoto);
                    spas.spaResim = "/Uploads/" + newfoto;
                }
                spas.spaAd = spa.spaAd;
                spas.spaAciklama = spa.spaAciklama;
                spas.active = spa.active;             
                spas.spaFiyat = spa.spaFiyat;
                spas.spaSuresi = spa.spaSuresi;



                db.SaveChanges();
                return RedirectToAction("Index", "AdminSpa", new { spaID = spas.spaID });
            }
        
            return View();
        }


        public JsonResult DeleteSpaRecord(int spaID)
        {
            bool result = false;
            Spa usr = db.Spas.SingleOrDefault(x => x.spaID == spaID);
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