namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.ContactToImport")]
    public partial class ContactToImport
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string LastName { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        public string Address { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(20)]
        public string ZipCode { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(255)]
        public string City { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(100)]
        public string Email { get; set; }
    }
}
