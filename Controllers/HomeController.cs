using Otel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Otel.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        OtelQrEntities db = new OtelQrEntities();
        public PartialViewResult Basket()
        {
            List<CartModel> carts = (List<CartModel>)Session["cart"];
            int count = 0;
            if (carts != null)
            {
                count = carts.Count();
                decimal totalprice = 0;
                foreach (var item in carts)
                {
                    totalprice += (decimal)((decimal)item.Quantity * item.Urun.urunFiyat);
                }
                ViewBag.totalprice = totalprice;
                ViewBag.carts = carts;
                ViewBag.count = count;
            }

            return PartialView("_PartialBasket",carts);
            
        }
        public ActionResult Index()
        {

            ViewBag.wifiID = new SelectList(db.Wifis, "wifiID", "wifiPassword");


            return View();
        }

        [HttpPost]
        public ActionResult Index(WifiMesaj wifi)
        {
            if (ModelState.IsValid)
            {
                db.WifiMesajs.Add(wifi);
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            ViewBag.wifiID = new SelectList(db.Wifis, "wifiID", "wifiPassword");
            return View(wifi);
        }
    }
}