namespace PachaWPF.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Enrollment.Appraisal")]
    public partial class Appraisal
    {
        [Key]
        public int EvaluationId { get; set; }

        public int? ContactId { get; set; }

        public int TauxSatisfaction { get; set; }

        public int? Interet { get; set; }

        public int? TempsAccorde { get; set; }

        public int? Exercices { get; set; }

        public int? Support { get; set; }

        public int? Animation { get; set; }

        public int? Equilibre { get; set; }

        [StringLength(2048)]
        public string Observations { get; set; }

        [StringLength(2048)]
        public string Ajouter { get; set; }

        [StringLength(2048)]
        public string Supprimer { get; set; }

        public int? Attentes { get; set; }

        public int? Organisation { get; set; }

        public int? Accueil { get; set; }

        public int? Confort { get; set; }

        public int? ConnaissancePacha { get; set; }

        public int? Nouveautes { get; set; }

        public int? Recommandation { get; set; }

        public int? Jour1Interet { get; set; }

        public int? Jour2Interet { get; set; }

        public int? Jour3Interet { get; set; }

        public int? Jour4Interet { get; set; }

        public int? Jour5Interet { get; set; }

        public int? Jour1Pedagogie { get; set; }

        public int? Jour2Pedagogie { get; set; }

        public int? Jour3Pedagogie { get; set; }

        public int? Jour4Pedagogie { get; set; }

        public int? Jour5Pedagogie { get; set; }

        [StringLength(512)]
        public string Formation { get; set; }

        public DateTime DateEvaluation { get; set; }

        public bool? TypeSaisie { get; set; }

        public bool? Annulee { get; set; }

        public decimal? Moyenne { get; set; }

        public bool MiseAJour { get; set; }

        public DateTime? DateMiseAJour { get; set; }

        public virtual Contact Contact { get; set; }
    }
}
