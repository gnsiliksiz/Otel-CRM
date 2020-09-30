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
    public class ResepsiyonWebController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: ResepsiyonWeb
        public ActionResult Index()
        {
            var resepsiyonlar = db.Receptions.ToList();
            return View(resepsiyonlar);
        }
      


    }
}