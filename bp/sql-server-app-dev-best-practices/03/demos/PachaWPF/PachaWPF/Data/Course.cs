namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Course.Course")]
    public partial class Course
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Course()
        {
            CourseLanguages = new HashSet<CourseLanguage>();
        }

        public int CourseId { get; set; }

        [Required]
        [StringLength(2)]
        public string Category { get; set; }

        [Required]
        [StringLength(2)]
        public string Domain { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime CreationDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? AnnulationDate { get; set; }

        [StringLength(2000)]
        public string Comments { get; set; }

        public byte Duration { get; set; }

        public byte MaxNbParticipants { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CourseLanguage> CourseLanguages { get; set; }
    }
}
