namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.ContactMax")]
    public partial class ContactMax
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ContactMaxId { get; set; }

        public string Title { get; set; }

        [Required]
        public string LastName { get; set; }

        public string FirstName { get; set; }

        public string Email { get; set; }

        public string Phone { get; set; }

        public string Fax { get; set; }

        public string Gender { get; set; }

        public string Mobile { get; set; }

        public int AddressId { get; set; }

        public int? CompanyId { get; set; }

        public string OldLastName { get; set; }

        [Required]
        public string Comment { get; set; }
    }
}
