namespace Sinema.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bilet")]
    public partial class Bilet
    {
        public int biletID { get; set; }

        [StringLength(50)]
        public string koltukno { get; set; }

        [Column(TypeName = "money")]
        public decimal? tutar { get; set; }

        public int? hediyebilet { get; set; }

        public int? filmID { get; set; }

        public int? kullaniciID { get; set; }

        public virtual Film Film { get; set; }

        public virtual Kullanici Kullanici { get; set; }
    }
}
