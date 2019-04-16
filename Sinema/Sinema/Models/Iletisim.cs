namespace Sinema.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Iletisim")]
    public partial class Iletisim
    {
        [Key]
        public int ıletisimID { get; set; }

        [StringLength(100)]
        public string ad { get; set; }

        [StringLength(100)]
        public string soyad { get; set; }

        [StringLength(50)]
        public string eposta { get; set; }

        [StringLength(50)]
        public string telefon { get; set; }

        [StringLength(100)]
        public string konu { get; set; }

        public string mesaj { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? tarih { get; set; }
    }
}
