namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Enrollment.InvoiceFollowUp")]
    public partial class InvoiceFollowUp
    {
        [Key]
        public int SuiviFactureId { get; set; }

        [StringLength(50)]
        public string FactureCd { get; set; }

        [Column(TypeName = "date")]
        public DateTime DatePaiement { get; set; }

        [Required]
        [StringLength(1)]
        public string TypePaiement { get; set; }

        [StringLength(50)]
        public string NoChequeBanque { get; set; }

        [StringLength(10)]
        public string NoBordereau { get; set; }

        public decimal Montant { get; set; }

        public virtual Invoice Invoice { get; set; }
    }
}
