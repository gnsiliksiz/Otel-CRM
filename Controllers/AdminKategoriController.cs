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
    public class AdminKategoriController : Controller
    {
        // GET: AdminKategori
        OtelQrEntities db = new OtelQrEntities();
        public ActionResult Index()
        {
            var data = db.Kategoris.Where(x=>x.isDeleted==false).ToList();

            
            return View(data);
        }
        public ActionResult KategoriDetay(int id)
        {
            var degerler = db.Uruns.Where(x => x.kategoriID == id && x.isDeleted == false).ToList();
            return View(degerler);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Kategori kategori, HttpPostedFileBase kategoriResim)
        {
            int sess = Convert.ToInt32(Session["userID"]);
            if (ModelState.IsValid)
            {
                if (kategoriResim != null)
                {
                    WebImage img = new WebImage(kategoriResim.InputStream);
                    FileInfo fotoinfo = new FileInfo(kategoriResim.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(925, 165);
                    img.Save("~/Uploads/KategoriPhoto/" + newfoto);
                    kategori.kategoriResim = "/Uploads/KategoriPhoto/" + newfoto;
                    kategori.isDeleted = false;
                    db.Kategoris.Add(kategori);
                    db.SaveChanges();
                    return RedirectToAction("Index", "AdminKategori");
                }
                else
                {
                    ModelState.AddModelError("Fotoğraf", "Fotoğraf Seçiniz");
                }
            }
            return View(kategori);
        }
        public ActionResult Edit(int kategoriID)
        {
            var kategoriler = db.Kategoris.Where(x => x.kategoriID == kategoriID).SingleOrDefault();
            ViewBag.kategoriID = new SelectList(db.Kategoris, "kategoriID", "kategoriAd", kategoriler.kategoriID);
            if (kategoriler == null)
            {
                return HttpNotFound();
            }
            return View(kategoriler);
        }
        [HttpPost]
        public ActionResult Edit(Kategori kategori, int kategoriID)
        {
            if (ModelState.IsValid)
            {
                var kategoris = db.Kategoris.Where(k => k.kategoriID == kategoriID).SingleOrDefault();
                
                kategoris.kategoriAd = kategori.kategoriAd;
              
            
                db.SaveChanges();
                return RedirectToAction("Index", "AdminKategori", new { kategoriID = kategoris.kategoriID });
            }
           
            return View();
        }

        public JsonResult DeleteKategoriRecord(int? kategoriID)
        {
            bool result = false;
            Kategori ktgr = db.Kategoris.SingleOrDefault(x => x.isDeleted == false && x.kategoriID == kategoriID);
            if (ktgr != null)
            {
                ktgr.isDeleted = true;
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
