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
    public class SpaWebController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: SpaWeb
        public ActionResult Index()
        {
            var keepler = db.Spas.ToList();
            return View(keepler);
        }



    }
}