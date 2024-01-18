USE PachaDataTraining;
GO

DROP INDEX IF EXISTS nix_TallyDate_DayOfWeek
ON Tools.TallyDate;
GO

CREATE INDEX nix_TallyDate_DayOfWeek
ON Tools.TallyDate (DayOfWeek);