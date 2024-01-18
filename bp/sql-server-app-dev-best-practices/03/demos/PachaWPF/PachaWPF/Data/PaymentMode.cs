namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Reference.PaymentMode")]
    public partial class PaymentMode
    {
        [Key]
        [StringLength(8)]
        public string ModePaiementCd { get; set; }

        [Required]
        [StringLength(64)]
        public string Libelle { get; set; }
    }
}
