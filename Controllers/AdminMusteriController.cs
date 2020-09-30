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
    public class AdminMusteriController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: Musteri
        public ActionResult Index()
        {
            var musteriler = db.Musteris.Where(u => u.active == true).OrderByDescending(q => q.active).ToList();
            return View(musteriler);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Musteri mus)
        {
            if (ModelState.IsValid)
            {
                db.Musteris.Add(mus);
                db.SaveChanges();
                return RedirectToAction("Index", "AdminMusteri");
            }
            else
            {
                var errors1 = ModelState.Select(x => x.Value.Errors).Where(y => y.Count > 0).ToList();
            }
            return View();


        }
        public ActionResult Edit(int musteriID)
        {
            var musteriler = db.Musteris.Where(x => x.musteriID == musteriID).SingleOrDefault();


            if (musteriler == null)
            {
                return HttpNotFound();
            }
            return View(musteriler);
        }
        [HttpPost]
        public ActionResult Edit(Musteri musteri, int musteriID)
        {
            var musteris = db.Musteris.Where(u => u.musteriID == musteriID).SingleOrDefault();

            musteris.musteriAdi = musteri.musteriAdi;
            musteris.musteriSoyadi = musteri.musteriSoyadi;
            musteris.musteriTC = musteri.musteriTC;
            musteris.musteriTelefon = musteri.musteriTelefon;
            musteris.musteriDogTar = musteri.musteriDogTar;
            musteris.active = musteri.active;

            db.SaveChanges();



            return RedirectToAction("Index", "AdminMusteri", new { musteri = musteris.musteriID });



        }

        public JsonResult DeleteMusteriRecord(int musteriID)
        {
            bool result = false;
            Musteri mus = db.Musteris.SingleOrDefault(x => x.musteriID == musteriID);
            if (mus != null)
            {
                mus.active = false;
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }



    }
}