namespace Sinema.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class SinemaContext : DbContext
    {
        public SinemaContext()
            : base("name=SinemaContext")
        {
        }

        public virtual DbSet<Bilet> Bilet { get; set; }
        public virtual DbSet<Film> Film { get; set; }
        public virtual DbSet<Iletisim> Iletisim { get; set; }
        public virtual DbSet<Kullanici> Kullanici { get; set; }
        public virtual DbSet<Oynar> Oynar { get; set; }
        public virtual DbSet<Oyuncu> Oyuncu { get; set; }
        public virtual DbSet<Sifre> Sifre { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Tur> Tur { get; set; }
        public virtual DbSet<YasGrup> YasGrup { get; set; }
        public virtual DbSet<Yetki> Yetki { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Bilet>()
                .Property(e => e.tutar)
                .HasPrecision(19, 4);
        }
    }
}
