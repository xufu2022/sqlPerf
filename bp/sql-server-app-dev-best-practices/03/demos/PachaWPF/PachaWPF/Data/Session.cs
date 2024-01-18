namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Course.Session")]
    public partial class Session
    {
        public int SessionId { get; set; }

        public int CourseId { get; set; }

        [Required]
        [StringLength(2)]
        public string LanguageCd { get; set; }

        public int? RoomId { get; set; }

        [Column(TypeName = "date")]
        public DateTime StartDate { get; set; }

        public decimal? Price { get; set; }

        public byte? Note { get; set; }

        [StringLength(10)]
        public string Status { get; set; }

        [Column(TypeName = "date")]
        public DateTime CreationDate { get; set; }

        public byte? Duration { get; set; }

        public bool IntraEntrerprise { get; set; }

        [StringLength(1500)]
        public string Comments { get; set; }

        public int? TrainerId { get; set; }

        public virtual CourseLanguage CourseLanguage { get; set; }

        public virtual Trainer Trainer { get; set; }

        public virtual TrainingRoom TrainingRoom { get; set; }
    }
}
