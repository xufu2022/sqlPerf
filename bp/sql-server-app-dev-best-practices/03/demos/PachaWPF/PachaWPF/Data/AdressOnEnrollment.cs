namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Enrollment.AdressOnEnrollment")]
    public partial class AdressOnEnrollment
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int InscriptionId { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AdresseId { get; set; }

        public bool Invoicing { get; set; }

        public bool Convention { get; set; }

        public bool ConventionLetter { get; set; }

        public bool Certificate { get; set; }

        public bool Copy { get; set; }

        public virtual Address Address { get; set; }

        public virtual Enrollment Enrollment { get; set; }
    }
}
