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
    
    public partial class Wifi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Wifi()
        {
            this.WifiMesajs = new HashSet<WifiMesaj>();
        }
    
        public int wifiID { get; set; }
        public string wifiAdi { get; set; }
        public string wifiPassword { get; set; }
        public Nullable<bool> active { get; set; }
        public Nullable<int> odaID { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
    
        public virtual Oda Oda { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WifiMesaj> WifiMesajs { get; set; }
    }
}
