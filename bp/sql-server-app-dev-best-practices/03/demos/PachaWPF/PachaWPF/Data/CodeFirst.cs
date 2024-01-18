namespace PachaWPF.Data
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class CodeFirst : DbContext
    {
        public CodeFirst()
            : base("name=CodeFirst")
        {
        }

        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<AddressType> AddressTypes { get; set; }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<CompanyAddress> CompanyAddresses { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<ContactMax> ContactMaxes { get; set; }
        public virtual DbSet<Manager> Managers { get; set; }
        public virtual DbSet<Title> Titles { get; set; }
        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<CourseLanguage> CourseLanguages { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<Session> Sessions { get; set; }
        public virtual DbSet<AdressOnEnrollment> AdressOnEnrollments { get; set; }
        public virtual DbSet<Appraisal> Appraisals { get; set; }
        public virtual DbSet<Enrollment> Enrollments { get; set; }
        public virtual DbSet<Invoice> Invoices { get; set; }
        public virtual DbSet<InvoiceFollowUp> InvoiceFollowUps { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<PaymentMode> PaymentModes { get; set; }
        public virtual DbSet<Region> Regions { get; set; }
        public virtual DbSet<TrainingPlace> TrainingPlaces { get; set; }
        public virtual DbSet<TrainingRoom> TrainingRooms { get; set; }
        public virtual DbSet<VAT> VATs { get; set; }
        public virtual DbSet<Rate> Rates { get; set; }
        public virtual DbSet<SpecialRate> SpecialRates { get; set; }
        public virtual DbSet<Trainer> Trainers { get; set; }
        public virtual DbSet<TrainerCompany> TrainerCompanies { get; set; }
        public virtual DbSet<ContactToImport> ContactToImports { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Address>()
                .Property(e => e.Address1)
                .IsUnicode(false);

            modelBuilder.Entity<Address>()
                .Property(e => e.Address2)
                .IsUnicode(false);

            modelBuilder.Entity<Address>()
                .HasMany(e => e.TrainerCompanies)
                .WithRequired(e => e.Address)
                .HasForeignKey(e => e.AdresseFormateurId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Address>()
                .HasMany(e => e.AdressOnEnrollments)
                .WithRequired(e => e.Address)
                .HasForeignKey(e => e.AdresseId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Address>()
                .HasMany(e => e.CompanyAddresses)
                .WithRequired(e => e.Address)
                .HasForeignKey(e => e.AdressId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AddressType>()
                .Property(e => e.Libelle)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.VATNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.Telephone2)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .Property(e => e.Telephone1)
                .IsUnicode(false);

            modelBuilder.Entity<Company>()
                .HasMany(e => e.CompanyAddresses)
                .WithRequired(e => e.Company)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CompanyAddress>()
                .Property(e => e.TypeAdresse)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Fax)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Gender)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.OldLastName)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Comment)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .HasMany(e => e.Trainers)
                .WithRequired(e => e.Contact)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.Fax)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.Gender)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.OldLastName)
                .IsUnicode(false);

            modelBuilder.Entity<ContactMax>()
                .Property(e => e.Comment)
                .IsUnicode(false);

            modelBuilder.Entity<Title>()
                .Property(e => e.TitleCd)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Title>()
                .Property(e => e.Libelle)
                .IsUnicode(false);

            modelBuilder.Entity<Course>()
                .Property(e => e.Category)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Course>()
                .Property(e => e.Domain)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Course>()
                .Property(e => e.Comments)
                .IsUnicode(false);

            modelBuilder.Entity<Course>()
                .HasMany(e => e.CourseLanguages)
                .WithRequired(e => e.Course)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CourseLanguage>()
                .Property(e => e.LanguageCd)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<CourseLanguage>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<CourseLanguage>()
                .Property(e => e.Title2)
                .IsUnicode(false);

            modelBuilder.Entity<CourseLanguage>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<CourseLanguage>()
                .Property(e => e.Requires)
                .IsUnicode(false);

            modelBuilder.Entity<CourseLanguage>()
                .Property(e => e.Atendees)
                .IsUnicode(false);

            modelBuilder.Entity<CourseLanguage>()
                .Property(e => e.Objectives)
                .IsUnicode(false);

            modelBuilder.Entity<CourseLanguage>()
                .HasMany(e => e.Sessions)
                .WithRequired(e => e.CourseLanguage)
                .HasForeignKey(e => new { e.CourseId, e.LanguageCd })
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Language>()
                .Property(e => e.LangueCd)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Language>()
                .Property(e => e.NomLocal)
                .IsUnicode(false);

            modelBuilder.Entity<Language>()
                .Property(e => e.NomFrancais)
                .IsUnicode(false);

            modelBuilder.Entity<Language>()
                .HasMany(e => e.CourseLanguages)
                .WithRequired(e => e.Language)
                .HasForeignKey(e => e.LanguageCd)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Session>()
                .Property(e => e.LanguageCd)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Session>()
                .Property(e => e.Price)
                .HasPrecision(8, 2);

            modelBuilder.Entity<Session>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<Session>()
                .Property(e => e.Comments)
                .IsUnicode(false);

            modelBuilder.Entity<Appraisal>()
                .Property(e => e.Observations)
                .IsUnicode(false);

            modelBuilder.Entity<Appraisal>()
                .Property(e => e.Ajouter)
                .IsUnicode(false);

            modelBuilder.Entity<Appraisal>()
                .Property(e => e.Supprimer)
                .IsUnicode(false);

            modelBuilder.Entity<Appraisal>()
                .Property(e => e.Formation)
                .IsUnicode(false);

            modelBuilder.Entity<Appraisal>()
                .Property(e => e.Moyenne)
                .HasPrecision(4, 2);

            modelBuilder.Entity<Enrollment>()
                .Property(e => e.Reference)
                .IsUnicode(false);

            modelBuilder.Entity<Enrollment>()
                .HasMany(e => e.AdressOnEnrollments)
                .WithRequired(e => e.Enrollment)
                .HasForeignKey(e => e.InscriptionId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Enrollment>()
                .HasMany(e => e.Invoices)
                .WithMany(e => e.Enrollments)
                .Map(m => m.ToTable("EnrollmentInvoice", "Enrollment").MapLeftKey("InscriptionId").MapRightKey("FactureCd"));

            modelBuilder.Entity<Invoice>()
                .Property(e => e.InvoiceId)
                .IsUnicode(false);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.CodeRemise)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.Remise)
                .HasPrecision(10, 7);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.PART)
                .HasPrecision(7, 4);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.ReferenceCommande)
                .IsUnicode(false);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.MontantHT)
                .HasPrecision(7, 2);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.MontantTTC)
                .HasPrecision(7, 2);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.TauxTVA)
                .HasPrecision(5, 2);

            modelBuilder.Entity<Invoice>()
                .HasMany(e => e.InvoiceFollowUps)
                .WithOptional(e => e.Invoice)
                .HasForeignKey(e => e.FactureCd);

            modelBuilder.Entity<InvoiceFollowUp>()
                .Property(e => e.FactureCd)
                .IsUnicode(false);

            modelBuilder.Entity<InvoiceFollowUp>()
                .Property(e => e.TypePaiement)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<InvoiceFollowUp>()
                .Property(e => e.NoChequeBanque)
                .IsUnicode(false);

            modelBuilder.Entity<InvoiceFollowUp>()
                .Property(e => e.NoBordereau)
                .IsUnicode(false);

            modelBuilder.Entity<InvoiceFollowUp>()
                .Property(e => e.Montant)
                .HasPrecision(8, 2);

            modelBuilder.Entity<City>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<City>()
                .Property(e => e.ZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<City>()
                .Property(e => e.Latitude)
                .HasPrecision(6, 2);

            modelBuilder.Entity<City>()
                .Property(e => e.Longitude)
                .IsUnicode(false);

            modelBuilder.Entity<City>()
                .Property(e => e.Eloignement)
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .Property(e => e.PaysCD)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .Property(e => e.FrenchName)
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .Property(e => e.Code2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .Property(e => e.Capital)
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .HasMany(e => e.Regions)
                .WithRequired(e => e.Country)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PaymentMode>()
                .Property(e => e.ModePaiementCd)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PaymentMode>()
                .Property(e => e.Libelle)
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.PaysCD)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.TypeRegion)
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.CodeRegion)
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.Nom)
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.CodeChefLieu)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.NomChefLieu)
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.CodeDepartement)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Region>()
                .Property(e => e.NomDepartement)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.Nom)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.Adresse1)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.Adresse2)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.CodePostal)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.Ville)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.Metro)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.Telephone)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.Fax)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.PlanAcces)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.NomContact)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .Property(e => e.EmailContact)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingPlace>()
                .HasMany(e => e.TrainingRooms)
                .WithRequired(e => e.TrainingPlace)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TrainingRoom>()
                .Property(e => e.Nom)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingRoom>()
                .Property(e => e.Numero)
                .IsUnicode(false);

            modelBuilder.Entity<TrainingRoom>()
                .Property(e => e.Couloir)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TrainingRoom>()
                .Property(e => e.Direction)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TrainingRoom>()
                .HasMany(e => e.Sessions)
                .WithOptional(e => e.TrainingRoom)
                .HasForeignKey(e => e.RoomId);

            modelBuilder.Entity<VAT>()
                .Property(e => e.TAUX1)
                .HasPrecision(5, 2);

            modelBuilder.Entity<VAT>()
                .Property(e => e.TAUX2)
                .HasPrecision(5, 2);

            modelBuilder.Entity<Rate>()
                .Property(e => e.TarifJournalier)
                .HasPrecision(6, 2);

            modelBuilder.Entity<Rate>()
                .HasMany(e => e.SpecialRates)
                .WithRequired(e => e.Rate)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SpecialRate>()
                .Property(e => e.LangueCd)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<SpecialRate>()
                .Property(e => e.TarifJournalier)
                .HasPrecision(6, 2);

            modelBuilder.Entity<Trainer>()
                .Property(e => e.NoSecuriteSociale)
                .IsUnicode(false);

            modelBuilder.Entity<Trainer>()
                .Property(e => e.Statut)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Trainer>()
                .Property(e => e.Commentaires)
                .IsUnicode(false);

            modelBuilder.Entity<Trainer>()
                .Property(e => e.CreationUser)
                .IsUnicode(false);

            modelBuilder.Entity<Trainer>()
                .HasMany(e => e.Rates)
                .WithRequired(e => e.Trainer)
                .HasForeignKey(e => e.FormateurId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TrainerCompany>()
                .Property(e => e.Nom)
                .IsUnicode(false);

            modelBuilder.Entity<TrainerCompany>()
                .Property(e => e.TelephoneSociete)
                .IsUnicode(false);

            modelBuilder.Entity<TrainerCompany>()
                .Property(e => e.TelephoneAdministratif)
                .IsUnicode(false);

            modelBuilder.Entity<TrainerCompany>()
                .Property(e => e.Fax)
                .IsUnicode(false);

            modelBuilder.Entity<TrainerCompany>()
                .Property(e => e.Contact)
                .IsUnicode(false);

            modelBuilder.Entity<TrainerCompany>()
                .Property(e => e.Commentaires)
                .IsUnicode(false);

            modelBuilder.Entity<TrainerCompany>()
                .Property(e => e.Statut)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TrainerCompany>()
                .Property(e => e.EmailContact)
                .IsUnicode(false);

            modelBuilder.Entity<TrainerCompany>()
                .HasMany(e => e.Trainers)
                .WithRequired(e => e.TrainerCompany)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ContactToImport>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<ContactToImport>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<ContactToImport>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<ContactToImport>()
                .Property(e => e.ZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<ContactToImport>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<ContactToImport>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<ContactToImport>()
                .Property(e => e.Email)
                .IsUnicode(false);
        }
    }
}
