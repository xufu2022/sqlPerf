namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Reference.TrainingPlace")]
    public partial class TrainingPlace
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TrainingPlace()
        {
            TrainingRooms = new HashSet<TrainingRoom>();
        }

        [Key]
        public int LieuFormationId { get; set; }

        [StringLength(30)]
        public string Nom { get; set; }

        [StringLength(40)]
        public string Adresse1 { get; set; }

        [StringLength(40)]
        public string Adresse2 { get; set; }

        [StringLength(7)]
        public string CodePostal { get; set; }

        [StringLength(20)]
        public string Ville { get; set; }

        [StringLength(30)]
        public string Metro { get; set; }

        [StringLength(25)]
        public string Telephone { get; set; }

        [StringLength(25)]
        public string Fax { get; set; }

        [StringLength(255)]
        public string PlanAcces { get; set; }

        [StringLength(50)]
        public string NomContact { get; set; }

        [StringLength(200)]
        public string EmailContact { get; set; }

        public bool EstCentrePacha { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TrainingRoom> TrainingRooms { get; set; }
    }
}
