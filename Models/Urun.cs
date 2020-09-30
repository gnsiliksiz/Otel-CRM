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
    
    public partial class Urun
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Urun()
        {
            this.ExtraUruns = new HashSet<ExtraUrun>();
            this.Sepets = new HashSet<Sepet>();
            this.SiparisDetays = new HashSet<SiparisDetay>();
            this.UrunMesajs = new HashSet<UrunMesaj>();
        }
    
        public int urunID { get; set; }
        public string urunAd { get; set; }
        public Nullable<decimal> urunFiyat { get; set; }
        public string urunResim { get; set; }
        public Nullable<int> kategoriID { get; set; }
        public Nullable<int> odaID { get; set; }
        public Nullable<bool> isDeleted { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<int> urunStok { get; set; }
        public Nullable<bool> urunDurum { get; set; }
        public Nullable<int> userID { get; set; }
        public string urun1 { get; set; }
        public Nullable<bool> isSelected { get; set; }
        public string urunAciklama { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ExtraUrun> ExtraUruns { get; set; }
        public virtual Kategori Kategori { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sepet> Sepets { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SiparisDetay> SiparisDetays { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UrunMesaj> UrunMesajs { get; set; }
    }
}
