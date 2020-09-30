using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Otel.Models
{
    public class CartModel
    {
        public Urun Urun { get; set; }
        public int Quantity { get; set; }
        public Nullable<System.DateTime> SepetZaman { get; set; }
        public string OdemeTur { get; set; }
        public bool SepetDurum { get; set; }
        public int urunMiktar { get; set; }
        public float urunToplamFiyat { get; set; }
        public int odaID { get; set; }
    }
}