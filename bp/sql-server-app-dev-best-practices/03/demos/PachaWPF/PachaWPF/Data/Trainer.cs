namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Trainer.Trainer")]
    public partial class Trainer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Trainer()
        {
            Sessions = new HashSet<Session>();
            Rates = new HashSet<Rate>();
        }

        public int TrainerId { get; set; }

        [StringLength(18)]
        public string NoSecuriteSociale { get; set; }

        [StringLength(1)]
        public string Statut { get; set; }

        [StringLength(1000)]
        public string Commentaires { get; set; }

        public bool NePasContacter { get; set; }

        public bool? CV { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreationDate { get; set; }

        [Required]
        [StringLength(128)]
        public string CreationUser { get; set; }

        public int ContactId { get; set; }

        public int TrainerCompanyId { get; set; }

        public virtual Contact Contact { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Session> Sessions { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rate> Rates { get; set; }

        public virtual TrainerCompany TrainerCompany { get; set; }
    }
}
