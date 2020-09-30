using Otel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Otel.Controllers
{
    public class MenuController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        public ActionResult Index(int kategoriID)
        {
            var menuler = db.Uruns.Where(x=>x.kategoriID == kategoriID).ToList();
            return View(menuler);
        }
    }
}