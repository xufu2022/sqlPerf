namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Trainer.TrainerCompany")]
    public partial class TrainerCompany
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TrainerCompany()
        {
            Trainers = new HashSet<Trainer>();
        }

        public int TrainerCompanyId { get; set; }

        [Required]
        [StringLength(50)]
        public string Nom { get; set; }

        public int AdresseFormateurId { get; set; }

        [StringLength(30)]
        public string TelephoneSociete { get; set; }

        [StringLength(30)]
        public string TelephoneAdministratif { get; set; }

        [StringLength(30)]
        public string Fax { get; set; }

        [StringLength(150)]
        public string Contact { get; set; }

        [StringLength(1000)]
        public string Commentaires { get; set; }

        [StringLength(1)]
        public string Statut { get; set; }

        [StringLength(150)]
        public string EmailContact { get; set; }

        public virtual Address Address { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Trainer> Trainers { get; set; }
    }
}
