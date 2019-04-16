namespace Sinema.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Film")]
    public partial class Film
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Film()
        {
            Bilet = new HashSet<Bilet>();
            Oynar = new HashSet<Oynar>();
        }

        public int filmID { get; set; }

        [StringLength(50)]
        public string ad { get; set; }

        public string aciklama { get; set; }

        [Column(TypeName = "date")]
        public DateTime? vizyontarih { get; set; }

        [StringLength(50)]
        public string seans { get; set; }

        [StringLength(50)]
        public string salon { get; set; }

        public string resim { get; set; }

        public int? yasgrupID { get; set; }

        public int? turID { get; set; }

        public string fragman { get; set; }

        [StringLength(50)]
        public string yonetmen { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Bilet> Bilet { get; set; }

        public virtual Tur Tur { get; set; }

        public virtual YasGrup YasGrup { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Oynar> Oynar { get; set; }
    }
}
