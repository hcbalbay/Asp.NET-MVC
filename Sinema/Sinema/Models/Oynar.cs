namespace Sinema.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Oynar")]
    public partial class Oynar
    {
        public int oynarID { get; set; }

        public int? filmID { get; set; }

        public int? oyuncuID { get; set; }

        public virtual Film Film { get; set; }

        public virtual Oyuncu Oyuncu { get; set; }
    }
}
