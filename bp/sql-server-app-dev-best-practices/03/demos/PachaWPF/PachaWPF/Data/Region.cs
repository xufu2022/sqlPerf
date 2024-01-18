namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Reference.Region")]
    public partial class Region
    {
        public int RegionId { get; set; }

        [Required]
        [StringLength(3)]
        public string PaysCD { get; set; }

        [StringLength(20)]
        public string TypeRegion { get; set; }

        [StringLength(10)]
        public string CodeRegion { get; set; }

        [Required]
        [StringLength(50)]
        public string Nom { get; set; }

        [StringLength(3)]
        public string CodeChefLieu { get; set; }

        [StringLength(50)]
        public string NomChefLieu { get; set; }

        public short? XChefLieu { get; set; }

        public short? YChefLieu { get; set; }

        public short? XCentroide { get; set; }

        public short? YCentroide { get; set; }

        [StringLength(2)]
        public string CodeDepartement { get; set; }

        [StringLength(50)]
        public string NomDepartement { get; set; }

        public DbGeography geog_GADM_FRA2 { get; set; }

        public DbGeometry geometrie { get; set; }

        [Column(TypeName = "xml")]
        public string DepartementVariantes { get; set; }

        public virtual Country Country { get; set; }
    }
}
