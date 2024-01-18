namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.Manager")]
    public partial class Manager
    {
        [Key]
        public int DecideurId { get; set; }

        public int? ContactId { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateAnnulation { get; set; }

        public int EnvoisParEmail { get; set; }

        public int EnvoisParCourrier { get; set; }

        public virtual Contact Contact { get; set; }
    }
}
