namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.AddressType")]
    public partial class AddressType
    {
        [Key]
        public byte TypeAdresseId { get; set; }

        [Required]
        [StringLength(20)]
        public string Libelle { get; set; }
    }
}
