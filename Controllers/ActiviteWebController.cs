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
    public class ActiviteWebController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: ActiviteWeb
        public ActionResult Index()
        {

            return View(db.Activites.Where(q=>q.active == true).ToList());
        }

        
    }
}