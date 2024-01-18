namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Enrollment.Invoice")]
    public partial class Invoice
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Invoice()
        {
            InvoiceFollowUps = new HashSet<InvoiceFollowUp>();
            Enrollments = new HashSet<Enrollment>();
        }

        [StringLength(50)]
        public string InvoiceId { get; set; }

        [StringLength(2)]
        public string CodeRemise { get; set; }

        public decimal? Remise { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime CreationDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? InvoiceDate { get; set; }

        public byte Relance { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateRelance { get; set; }

        public decimal? PART { get; set; }

        [StringLength(100)]
        public string ReferenceCommande { get; set; }

        public decimal MontantHT { get; set; }

        public decimal MontantTTC { get; set; }

        public decimal TauxTVA { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InvoiceFollowUp> InvoiceFollowUps { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Enrollment> Enrollments { get; set; }
    }
}
