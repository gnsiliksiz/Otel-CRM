﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class OtelQrEntities : DbContext
    {
        public OtelQrEntities()
            : base("name=OtelQrEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Activite> Activites { get; set; }
        public virtual DbSet<Ariza> Arizas { get; set; }
        public virtual DbSet<Bildirim> Bildirims { get; set; }
        public virtual DbSet<Duyuru> Duyurus { get; set; }
        public virtual DbSet<ExtraUrun> ExtraUruns { get; set; }
        public virtual DbSet<Kategori> Kategoris { get; set; }
        public virtual DbSet<Keep> Keeps { get; set; }
        public virtual DbSet<Masor> Masors { get; set; }
        public virtual DbSet<Musteri> Musteris { get; set; }
        public virtual DbSet<Oda> Odas { get; set; }
        public virtual DbSet<OdemeTip> OdemeTips { get; set; }
        public virtual DbSet<Reception> Receptions { get; set; }
        public virtual DbSet<RezervasyonActivite> RezervasyonActivites { get; set; }
        public virtual DbSet<RezervasyonSpa> RezervasyonSpas { get; set; }
        public virtual DbSet<Sepet> Sepets { get; set; }
        public virtual DbSet<Sipari> Siparis { get; set; }
        public virtual DbSet<SiparisDetay> SiparisDetays { get; set; }
        public virtual DbSet<Spa> Spas { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Taksi> Taksis { get; set; }
        public virtual DbSet<Urun> Uruns { get; set; }
        public virtual DbSet<UrunMesaj> UrunMesajs { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Vale> Vales { get; set; }
        public virtual DbSet<Wifi> Wifis { get; set; }
        public virtual DbSet<WifiMesaj> WifiMesajs { get; set; }
        public virtual DbSet<Yetki> Yetkis { get; set; }
    }
}