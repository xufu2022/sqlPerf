namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Reference.City")]
    public partial class City
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public City()
        {
            Addresses = new HashSet<Address>();
        }

        public int CityId { get; set; }

        public int? RegionId { get; set; }

        [StringLength(255)]
        public string Name { get; set; }

        [StringLength(10)]
        public string ZipCode { get; set; }

        public double? CodeINSEE { get; set; }

        public double? CodeRegion { get; set; }

        public decimal? Latitude { get; set; }

        [StringLength(255)]
        public string Longitude { get; set; }

        [StringLength(255)]
        public string Eloignement { get; set; }

        public DbGeography PointGeographique { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Address> Addresses { get; set; }
    }
}
