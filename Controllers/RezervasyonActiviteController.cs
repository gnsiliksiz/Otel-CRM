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
    public class RezervasyonActiviteController : Controller
    {

        OtelQrEntities db = new OtelQrEntities();
        // GET: RezervasyonActivite
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Create()
        {
            ViewBag.activiteID = new SelectList(db.Activites, "activiteID", "activiteAdi");
            return View();
        }
        [HttpPost]
        public ActionResult Create(RezervasyonActivite activite)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    db.RezervasyonActivites.Add(activite);
                    activite.active = false;
                    activite.createAt = DateTime.Now;
                    db.SaveChanges();
                    //return RedirectToAction("Create", "RezervasyonActivite");
                    return new HttpStatusCodeResult(System.Net.HttpStatusCode.OK);
                }
                catch (Exception)
                {
                    return new HttpStatusCodeResult(System.Net.HttpStatusCode.InternalServerError);
                }
            }
            ViewBag.activiteID = new SelectList(db.Activites, "activiteID", "activiteAdi");
            return View(activite);
        }
    }
}