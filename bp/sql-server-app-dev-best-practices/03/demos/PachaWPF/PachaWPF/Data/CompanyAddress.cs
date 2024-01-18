namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.CompanyAddress")]
    public partial class CompanyAddress
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CompanyId { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AdressId { get; set; }

        [Required]
        [StringLength(1)]
        public string TypeAdresse { get; set; }

        public virtual Address Address { get; set; }

        public virtual Company Company { get; set; }
    }
}
