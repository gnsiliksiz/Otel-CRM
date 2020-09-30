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
    public class KategoriController : Controller
    {

        // GET: Kategori
        OtelQrEntities db = new OtelQrEntities();
        public ActionResult Index()
        {
            //var urunler = db.Uruns.Where(x => x.isDeleted == false).ToList();
            //return View(urunler);
            var kategoriler = db.Kategoris.Where(x => x.isDeleted == false).ToList();
            //Sepet sepet1 = (Sepet)Session["cart"];

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

            return View(kategoriler);
        }
        
        public ActionResult AddToCart(Sepet sepet, int urunID)
        {
            var urun = db.Uruns.Find(urunID);
            if (Session["cart"] == null)
            {
                List<CartModel> cartModels = new List<CartModel>();
                cartModels.Add(new CartModel { Urun = urun, Quantity = 1,odaID=0,SepetDurum=false,SepetZaman=DateTime.Now});
                Session["cart"] = cartModels;
            }
            else
            {
                List<CartModel> cartModels = (List<CartModel>)Session["cart"];
                CartModel sameCart=cartModels.Where(t => t.Urun.urunID == urun.urunID).FirstOrDefault();
                if (sameCart != null)
                {
                    sameCart.Quantity++;
                }
                else
                {
                    cartModels.Add(new CartModel { Urun = urun, Quantity = 1, odaID = 0,  SepetDurum = false, SepetZaman = DateTime.Now });
                }

                Session["cart"] = cartModels;
            }
            return Redirect("Index");
        }
     
        //public ActionResult AddSepet()
        //{
         


        //    List<CartModel> carts = (List<CartModel>)Session["cart"];
        //        List<Sepet> sepets = new List<Sepet>();
           
        //        using (var dbEntities = new OtelQrEntities())
        //    {
                
        //        foreach (var item in carts)
        //            {

        //            sepets.Add(new Sepet
        //            {

        //                urunID = item.Urun.urunID,
        //                odaID = 1,
        //                urunToplamFiyat = (double)item.Urun.urunFiyat,
                        
        //                urunMiktar = item.Quantity,
        //                SepetDurum = item.SepetDurum,
        //                SepetZaman = DateTime.Now

        //            });
        //        }
        //        db.Sepets.AddRange(sepets);
        //        db.SaveChanges();
                 

        //        }
        //    return Redirect("Index");






        //}

        



        }
}