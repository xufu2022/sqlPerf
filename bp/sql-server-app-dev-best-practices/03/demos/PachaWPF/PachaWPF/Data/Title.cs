namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.Title")]
    public partial class Title
    {
        [Key]
        [StringLength(8)]
        public string TitleCd { get; set; }

        [Required]
        [StringLength(32)]
        public string Libelle { get; set; }
    }
}
