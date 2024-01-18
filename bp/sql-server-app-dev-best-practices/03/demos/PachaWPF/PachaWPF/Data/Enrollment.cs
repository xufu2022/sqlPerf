namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Enrollment.Enrollment")]
    public partial class Enrollment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Enrollment()
        {
            AdressOnEnrollments = new HashSet<AdressOnEnrollment>();
            Invoices = new HashSet<Invoice>();
        }

        public int EnrollmentId { get; set; }

        public int SessionId { get; set; }

        public int? ContactId { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CancellationDate { get; set; }

        public byte Discount { get; set; }

        public bool Present { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime CreationDate { get; set; }

        [StringLength(100)]
        public string Reference { get; set; }

        [Column("Documents Sent")]
        public bool Documents_Sent { get; set; }

        public virtual Contact Contact { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AdressOnEnrollment> AdressOnEnrollments { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}
