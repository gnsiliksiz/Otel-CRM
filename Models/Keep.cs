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
    
    public partial class Keep
    {
        public int id { get; set; }
        public int keepID { get; set; }
        public Nullable<int> odaID { get; set; }
        public string keepAd { get; set; }
        public string keepMesaj { get; set; }
        public Nullable<bool> keepDurum { get; set; }
        public Nullable<bool> active { get; set; }
        public Nullable<bool> isSelected { get; set; }
    
        public virtual Oda Oda { get; set; }
    }
}
