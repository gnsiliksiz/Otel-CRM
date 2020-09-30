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
    public class UrunController : Controller
    {
        // GET: Urun
        OtelQrEntities db = new OtelQrEntities();
        public ActionResult Index()
        {
            int sess = Convert.ToInt32(Session["userID"]);
            var menuler = db.Uruns.Where(x => x.isDeleted == false && x.userID == sess ).ToList();
            ViewBag.kategoriID = new SelectList(db.Kategoris, "kategoriID", "kategoriAd");
            return View(menuler);
        }

      
        public ActionResult Create()
        {
            ViewBag.kategoriID = new SelectList(db.Kategoris, "kategoriID", "KategoriAd");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Urun urun, HttpPostedFileBase urunResim)
        {
            int sess = Convert.ToInt32(Session["userID"]);
            if (ModelState.IsValid)
            {
                if (urunResim != null)
                {
                    WebImage img = new WebImage(urunResim.InputStream);
                    FileInfo fotoinfo = new FileInfo(urunResim.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(300, 200);
                    img.Save("~/Uploads/" + newfoto);
                    urun.urunResim = "/Uploads/" + newfoto;
                    urun.isDeleted = false;
                    urun.userID = sess;
                    db.Uruns.Add(urun);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Urun");
                }
                else
                {
                    ModelState.AddModelError("Fotoğraf", "Fotoğraf Seçiniz");
                }
            }
            return View(urun);
        }
        public ActionResult Edit(int urunID)
        {
            var menuler = db.Uruns.Where(x => x.urunID == urunID).SingleOrDefault();
            ViewBag.kategoriID = new SelectList(db.Kategoris, "kategoriID", "kategoriAd", menuler.kategoriID);
            if (menuler == null)
            {
                return HttpNotFound();
            }
            return View(menuler);
        }
        [HttpPost]
        public ActionResult Edit(Urun urun, int urunID, HttpPostedFileBase urunResim)
        {
            if (ModelState.IsValid)
            {
                var uruns = db.Uruns.Where(u => u.urunID == urunID).SingleOrDefault();
                if (urunResim != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(urun.urunResim)))
                    {
                        System.IO.File.Delete(Server.MapPath(uruns.urunResim));
                    }
                    WebImage img = new WebImage(urunResim.InputStream);
                    FileInfo fotoinfo = new FileInfo(urunResim.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(150, 150);
                    img.Save("~/Uploads/" + newfoto);
                    uruns.urunResim = "/Uploads/" + newfoto;
                }
                uruns.urunAd = urun.urunAd;
                uruns.urunAciklama = urun.urunAciklama;
                uruns.urunFiyat = urun.urunFiyat;
                uruns.kategoriID = urun.kategoriID;
                db.SaveChanges();
                return RedirectToAction("Index", "Urun", new { urunID = uruns.urunID });
            }
            ViewBag.kategoriID = new SelectList(db.Kategoris, "kategoriID", "kategoriAd", urun.kategoriID);
            return View();
        }
        public JsonResult DeleteUrunRecord(int? urunID)
        {
            bool result = false;
            Urun urn = db.Uruns.SingleOrDefault(x => x.isDeleted == false && x.urunID == urunID);
            if (urn != null)
            {
                urn.isDeleted = true;
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}