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
    public class HousekeepingWebController : Controller
    {

        // GET: AdminHousekeeping
        public ActionResult Index()
        {
            using (var db = new OtelQrEntities())
            {
                var keepler = db.Keeps.Where(q => q.active == true).ToList();
                return View(keepler);
            }
        }

        public JsonResult AddNotification(List<NotificationModel> model)
        {
            try
            {
                var bildirimId = 0;
                using (var dbEntities = new OtelQrEntities())
                {
                    foreach (var item in model)
                    {
                        Bildirim bildirim = new Bildirim()
                        {
                            bildirimTur = item.BildirimTur,
                            bildirimDurum = item.BildirimDurum,
                            bildirimİcerik = item.Bildirimİcerik,
                            bildirimDate = DateTime.Now
                           
                        };

                        dbEntities.Bildirims.Add(bildirim);
                    
                    }
                    dbEntities.SaveChanges();

                    bildirimId = dbEntities.Bildirims.OrderByDescending(q => q.bildirimID).FirstOrDefault().bildirimID;

                }
                return Json(bildirimId);
            }
            catch (Exception )
            {
               
            }
            return null;
        }

    }
}