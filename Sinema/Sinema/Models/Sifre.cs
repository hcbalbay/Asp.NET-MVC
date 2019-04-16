namespace Sinema.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Sifre")]
    public partial class Sifre
    {
        public int sifreID { get; set; }

        public int? kullaniciID { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? tarih { get; set; }

        public Guid? kod { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? gencellemeTarihi { get; set; }

        [StringLength(50)]
        public string eskiSifre { get; set; }
    }
}
