namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Reference.VAT")]
    public partial class VAT
    {
        [Key]
        [Column(TypeName = "date")]
        public DateTime DateDebut { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateFin { get; set; }

        public decimal TAUX1 { get; set; }

        public decimal? TAUX2 { get; set; }
    }
}
