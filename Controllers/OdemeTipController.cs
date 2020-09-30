using Otel.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Configuration;

namespace Otel.Controllers
{
    public class OdemeTipController : Controller
    {
        OtelQrEntities db = new OtelQrEntities();
        // GET: OdemeTip
        public ActionResult Index()
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

            return View();
        }


        public ActionResult AddSepet()
        {
            List<CartModel> carts = (List<CartModel>)Session["cart"];
            List<Sepet> sepets = new List<Sepet>();

            using (var dbEntities = new OtelQrEntities())
            {

                foreach (var item in carts)
                {

                    sepets.Add(new Sepet
                    {

                        urunID = item.Urun.urunID,
                        odaID = 1,
                        urunToplamFiyat = (double)item.Urun.urunFiyat,
                        urunMiktar = item.Quantity,
                        SepetDurum = item.SepetDurum,
                        SepetZaman = DateTime.Now

                    });
                }
                db.Sepets.AddRange(sepets);
                db.SaveChanges();


            }
            return Redirect("Index");

        }
    }
}