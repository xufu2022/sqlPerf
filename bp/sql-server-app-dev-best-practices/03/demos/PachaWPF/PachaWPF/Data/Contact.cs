namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.Contact")]
    public partial class Contact
    {
        public Contact()
        {
            Enrollments = new HashSet<Enrollment>();
        }

        [Key]
        public int ContactId { get; set; }

        [Required]
        [StringLength(3)]
        public string Title { get; set; }

        [Required]
        [StringLength(50)]
        [Index("nix$Contact$LastNameFirstName", 1)]
        public string LastName { get; set; }

        [StringLength(50)]
        [Index("nix$Contact$LastNameFirstName", 2)]
        public string FirstName { get; set; }

        [StringLength(150)]
        [EmailAddress(ErrorMessage = "Invalid Email!")]
        public string Email { get; set; }

        [StringLength(15)]
        [RegularExpression(@"((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}", 
            ErrorMessage = "Invalid Phone Number!")]
        public string Phone { get; set; }

        [StringLength(15)]
        public string Fax { get; set; }

        [StringLength(1)]
        public string Gender { get; set; }

        [StringLength(15)]
        public string Mobile { get; set; }

        public int AddressId { get; set; }

        public int? CompanyId { get; set; }

        [StringLength(50)]
        public string OldLastName { get; set; }

        [Required]
        [StringLength(2000)]
        public string Comment { get; set; }

        public virtual Company Company { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Manager> Managers { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Appraisal> Appraisals { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Trainer> Trainers { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Enrollment> Enrollments { get; set; }
    }
}
