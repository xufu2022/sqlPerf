namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Reference.TrainingRoom")]
    public partial class TrainingRoom
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TrainingRoom()
        {
            Sessions = new HashSet<Session>();
        }

        [Key]
        public int SalleFormationId { get; set; }

        public int LieuFormationId { get; set; }

        public byte Places { get; set; }

        [StringLength(20)]
        public string Nom { get; set; }

        [StringLength(3)]
        public string Numero { get; set; }

        [StringLength(1)]
        public string Couloir { get; set; }

        [StringLength(1)]
        public string Direction { get; set; }

        public byte? Etage { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Session> Sessions { get; set; }

        public virtual TrainingPlace TrainingPlace { get; set; }
    }
}
