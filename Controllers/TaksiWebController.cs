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
    public class TaksiWebController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: TaksiWeb
        public ActionResult Index()
        {
            var taksiler = db.Taksis.ToList();
            return View(taksiler);
        }
    }
}