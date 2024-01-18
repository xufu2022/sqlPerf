namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.Company")]
    public partial class Company
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Company()
        {
            Contacts = new HashSet<Contact>();
            CompanyAddresses = new HashSet<CompanyAddress>();
        }

        public int CompanyId { get; set; }

        [Required]
        [StringLength(60)]
        public string Name { get; set; }

        [StringLength(30)]
        public string VATNumber { get; set; }

        public short TypeRelance { get; set; }

        public bool FacturationAvantInscription { get; set; }

        [StringLength(30)]
        public string Telephone2 { get; set; }

        [StringLength(30)]
        public string Telephone1 { get; set; }

        public byte Remise { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Contact> Contacts { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CompanyAddress> CompanyAddresses { get; set; }
    }
}
