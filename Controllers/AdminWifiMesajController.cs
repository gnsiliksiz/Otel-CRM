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
    public class AdminWifiMesajController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();

        // GET: AdminWifiMesaj
        public ActionResult Index()
        {
            var wifimesaj = db.WifiMesajs.ToList();
            return View(wifimesaj);
        }
    }
}