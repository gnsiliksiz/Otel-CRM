//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Otel.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RezervasyonSpa
    {
        public int rezervasyonID { get; set; }
        public Nullable<int> masorID { get; set; }
        public Nullable<int> musteriID { get; set; }
        public Nullable<System.DateTime> tarih { get; set; }
        public Nullable<System.TimeSpan> saat { get; set; }
        public Nullable<bool> musterigeldimi { get; set; }
        public Nullable<bool> masorgeldimi { get; set; }
        public Nullable<bool> active { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
    
        public virtual Masor Masor { get; set; }
        public virtual Musteri Musteri { get; set; }
    }
}
