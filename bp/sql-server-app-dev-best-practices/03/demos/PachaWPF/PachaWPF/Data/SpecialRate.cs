namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Trainer.SpecialRate")]
    public partial class SpecialRate
    {
        [Key]
        public int TarifSpecialId { get; set; }

        public int TarifFormateurId { get; set; }

        public byte? RegionId { get; set; }

        public int? StageId { get; set; }

        [StringLength(2)]
        public string LangueCd { get; set; }

        public decimal TarifJournalier { get; set; }

        public virtual Rate Rate { get; set; }
    }
}
