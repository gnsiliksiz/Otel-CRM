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
    
    public partial class Activite
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Activite()
        {
            this.RezervasyonActivites = new HashSet<RezervasyonActivite>();
        }
    
        public int activiteID { get; set; }
        public string activiteResim { get; set; }
        public string activiteAciklama { get; set; }
        public Nullable<bool> active { get; set; }
        public Nullable<decimal> activiteFiyat { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<int> kontenjan { get; set; }
        public string activiteAdi { get; set; }
        public Nullable<bool> Restoran { get; set; }
        public Nullable<bool> Konaklama { get; set; }
        public string activiteYer { get; set; }
        public string activiteSure { get; set; }
        public Nullable<System.DateTime> startDate { get; set; }
        public Nullable<System.DateTime> endDate { get; set; }
        public string startTime { get; set; }
        public string endTime { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RezervasyonActivite> RezervasyonActivites { get; set; }
    }
}
