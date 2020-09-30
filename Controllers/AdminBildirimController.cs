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
    public class AdminBildirimController : Controller
    {
        // GET: AdminBildirim
        OtelQrEntities db = new OtelQrEntities();
        public ActionResult HousekeepingBildirim()
        {
            using (var db = new OtelQrEntities())
            {
                var bildirimler = db.Bildirims.Where(q => q.bildirimTur == "1").OrderByDescending(q => q.bildirimDate).ToList();
                return View(bildirimler);
            }
        }


        public ActionResult ArizaBildirim()
        {
            using (var db = new OtelQrEntities())
            {
                var bildirimler = db.Bildirims.Where(q => q.bildirimTur == "2").OrderByDescending(q => q.bildirimDate).ToList();
             
                return View(bildirimler);

            }

        }
        public ActionResult ValeBildirim()
        {
            using (var db = new OtelQrEntities())
            {
                var bildirimler = db.Bildirims.Where(q => q.bildirimTur == "3").OrderByDescending(q=>q.bildirimDate).ToList();
                return View(bildirimler);

            }


        }

        [HttpPost]
        public ActionResult GuncelleBildirimDurum(List<Bildirim> model)
        {
            using (var dbEntites = new OtelQrEntities())
            {
               
                foreach (var item in model)
                {
                    var bildirimModel = dbEntites.Bildirims.FirstOrDefault(q => q.bildirimID == item.bildirimID);

                    if (bildirimModel != null)
                    {
                        if(bildirimModel.bildirimDurum == false)
                        {
                            bildirimModel.bildirimDurum = true;
                        }
                        else
                        {
                            bildirimModel.bildirimDurum = false;
                        }
                        
                        dbEntites.SaveChanges();
                    }
                }
            }

            return RedirectToAction("HousekeepingBildirim");
        }

        public ActionResult ActiviteBildirim()
        {

            //ViewBag.activiteler = db.RezervasyonActivites.ToList();
            var activiteler = db.RezervasyonActivites.OrderByDescending(x=>x.createAt).ToList();
                return View(activiteler);

            
           

        }
        public ActionResult GuncelleActiviteDurum(List<RezervasyonActivite> model)
        {
            using (var dbEntites = new OtelQrEntities())
            {

                foreach (var item in model)
                {
                    var bildirimModel = dbEntites.RezervasyonActivites.FirstOrDefault(q => q.rezervasyonID == item.rezervasyonID);

                    if (bildirimModel != null)
                    {
                        bildirimModel.active = true;
                        dbEntites.SaveChanges();
                    }

                }

            }

            return RedirectToAction("ActiviteBildirim");
        }

        public ActionResult SpaBildirim()
        {

            //ViewBag.activiteler = db.RezervasyonActivites.ToList();
            var spalar = db.RezervasyonSpas.OrderByDescending(q => q.createDate).ToList();
            return View(spalar);
        }

        public ActionResult GuncelleSpaDurum(List<RezervasyonSpa> model)
        {
            using (var dbEntites = new OtelQrEntities())
            {

                foreach (var item in model)
                {
                    var bildirimModel = dbEntites.RezervasyonSpas.FirstOrDefault(q => q.rezervasyonID == item.rezervasyonID);

                    if (bildirimModel != null)
                    {
                        bildirimModel.active = true;
                        dbEntites.SaveChanges();
                    }

                }

            }

            return RedirectToAction("SpaBildirim");
        }


        public JsonResult DeleteBildirimRecord(int bildirimID)
        {
            bool result = false;
            Bildirim usr = db.Bildirims.SingleOrDefault(x => x.bildirimID == bildirimID);
            if (usr != null)
            {
                //db.Bildirims.Remove(usr);
                db.Bildirims.Remove(usr);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteRezervasyonRecord(int rezervasyonID)
        {
            bool result = false;
            RezervasyonActivite usr = db.RezervasyonActivites.SingleOrDefault(x => x.rezervasyonID == rezervasyonID);
            if (usr != null)
            {
                //db.Bildirims.Remove(usr);
                db.RezervasyonActivites.Remove(usr);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DeleteRezervasyonSpaRecord(int rezervasyonID)
        {
            bool result = false;
            RezervasyonSpa usr = db.RezervasyonSpas.SingleOrDefault(x => x.rezervasyonID == rezervasyonID);
            if (usr != null)
            {
                //db.Bildirims.Remove(usr);
                db.RezervasyonSpas.Remove(usr);
                db.SaveChanges();
                result = true;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }


    }
}