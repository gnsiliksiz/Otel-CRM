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
    public class UrunWebController : Controller
    {
        // GET: UrunWeb
      
        OtelQrEntities db = new OtelQrEntities();
     
        
        public ActionResult Detail(int id)
        {

            var prod = db.Uruns.Where(x =>x.urunID == id).FirstOrDefault();
            return View(prod);
        }
    }
}