using System;


namespace Otel.Models
{
    public class SepetModel
    {
        //public Urun urun { get; set; }
        //public int miktar { get; set; }
        public string SepetTur { get; set; }
        public Nullable<System.DateTime> SepetZaman { get; set; }
        public bool SepetDurum { get; set; }
        public int urunMiktar{ get; set; }
        public float urunToplamFiyat { get; set; }
        public int odaID { get; set; }
        public int urunID { get; set; }

    }
}