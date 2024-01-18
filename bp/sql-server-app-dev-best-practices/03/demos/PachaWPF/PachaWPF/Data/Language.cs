namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Course.Language")]
    public partial class Language
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Language()
        {
            CourseLanguages = new HashSet<CourseLanguage>();
        }

        [Key]
        [StringLength(2)]
        public string LangueCd { get; set; }

        [Required]
        [StringLength(50)]
        public string NomLocal { get; set; }

        [Required]
        [StringLength(50)]
        public string NomFrancais { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CourseLanguage> CourseLanguages { get; set; }
    }
}
