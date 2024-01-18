-- play this script to do the tests

USE [StructuredIndex];
GO

BEGIN TRAN;
GO

UPDATE [BetterKeyTable]
SET [c3] = 'b'
WHERE [c1] = 3455;
GO


rollback

COMMIT TRAN;
GO


-- -- We've been deconnected

dbcc opentran