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
    public class OtelController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        public ActionResult Index()
        {
            var oteller = db.Users.OrderByDescending(q => q.active).ToList();
            return View(oteller);
        }
        public ActionResult Create()
        {
            ViewBag.yetkiID = new SelectList(db.Yetkis, "yetkiID", "yetkiAd");
            return View();
        }
        [HttpPost]
        public ActionResult Create(User usr, HttpPostedFileBase logo)
        {
            if (ModelState.IsValid)
            {
                if (logo != null)
                {
                    WebImage img = new WebImage(logo.InputStream);
                    FileInfo fotoinfo = new FileInfo(logo.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(150, 150);
                    img.Save("~/Uploads/" + newfoto);
                    usr.logo = "/Uploads/" + newfoto;
                    usr.active = true;
                    db.Users.Add(usr);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Otel");
                }
                else
                {
                    ModelState.AddModelError("Fotoğraf", "Fotoğraf Seçiniz");
                }
            }
            ViewBag.yetkiID = new SelectList(db.Yetkis, "yetkiID", "yetkiAd");
            return View(usr);
        }
        public ActionResult Edit(int userID)
        {
            var userlar = db.Users.Where(x => x.userID == userID).SingleOrDefault();
            ViewBag.yetkiID = new SelectList(db.Yetkis, "yetkiID", "yetkiAd", userlar.yetkiID);
            if (userlar == null)
            {
                return HttpNotFound();
            }
            return View(userlar);
        }
        [HttpPost]
        public ActionResult Edit(User user, int userID, HttpPostedFileBase logo)
        {
            if (ModelState.IsValid)
            {
                var users = db.Users.Where(u => u.userID == userID).SingleOrDefault();
                if (logo != null)
                {
                    if (System.IO.File.Exists(Server.MapPath(user.logo)))
                    {
                        System.IO.File.Delete(Server.MapPath(user.logo));
                    }
                    WebImage img = new WebImage(logo.InputStream);
                    FileInfo fotoinfo = new FileInfo(logo.FileName);

                    string newfoto = Guid.NewGuid().ToString() + fotoinfo.Extension;
                    img.Resize(150, 150);
                    img.Save("~/Uploads/" + newfoto);
                    users.logo = "/Uploads/" + newfoto;
                }
                users.username = user.username;
                users.password = user.password;
                users.active = user.active;
               
                db.SaveChanges();
                return RedirectToAction("Index", "Otel", new { userID = users.userID });
            }
            //ViewBag.yetkiID = new SelectList(db.Yetkis, "yetkiID", "yetkiAd", user.yetkiID);
            return View();
        }

        public JsonResult DeleteUserRecord(int userID)
        {
            bool result = false;
            User usr = db.Users.SingleOrDefault(x=>x.userID == userID);
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