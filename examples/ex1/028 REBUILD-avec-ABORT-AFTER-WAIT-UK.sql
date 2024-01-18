/*******************************************************************************
*******************  REBUILD INDEX with ABORT_AFTER_WAIT    *******************
********************************************************************************/
--ABORT_AFTER_WAIT: 

--ABORT_AFTER_WAIT: has 3 interesting options. 
--It essentially provides you with hands on access to the various locking mechanisms. Here are the details:

--NONE: it implements no locking on the inline index rebuild operation,
-- it performs an operation as a normal scenario. 

--SELF: drops the online index rebuild operation using normal priority. 
--It gives priority to the user operation instead of rebuilding the index. 


--BLOCKERS: removes all user transactions which usually block the online index rebuild, 
--which allows you to easily rebuild the index. 
-- This is not recommended if you are using at peak times.

-- Demo script for Low Priority Lock Waits demo


USE [master];
GO

IF DATABASEPROPERTYEX (N'Structuredindex', N'Version') > 0
BEGIN
	ALTER DATABASE [Structuredindex] SET SINGLE_USER
		WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [Structuredindex];
END
GO

CREATE DATABASE [Structuredindex] 
GO
ALTER DATABASE [Structuredindex] SET RECOVERY simple
GO

USE [Structuredindex];
GO

SET NOCOUNT ON;
GO

-- Create  table and Insert :
CREATE TABLE [BetterKeyTable] (
	[c1] INT,
    [c2] DATETIME DEFAULT GETDATE (),
	[c3] CHAR (400) DEFAULT 'a',
	[c4] VARCHAR(MAX) DEFAULT 'b');
CREATE CLUSTERED INDEX [BetterKeyTable_CL] ON
	[BetterKeyTable] ([c1]);
GO

SET NOCOUNT ON;
GO
DECLARE @a INT;
SELECT @a = 0;
WHILE (@a < 25000)
BEGIN
	INSERT INTO [BetterKeyTable] (c1) VALUES (@a);
	SELECT @a = @a + 1;
END;
GO

-- Play the other script to cause the transaction to open:
-- let's try this one 

ALTER INDEX [BetterKeyTable_CL] ON [BetterKeyTable] REBUILD
WITH (FILLFACTOR = 70, ONLINE = ON);
GO

-- it's locked, you have to KILL.
-- try SELF

ALTER INDEX [BetterKeyTable_CL] ON [BetterKeyTable] REBUILD
WITH (FILLFACTOR = 70, ONLINE = ON (
	WAIT_AT_LOW_PRIORITY (
		MAX_DURATION = 1 MINUTES, ABORT_AFTER_WAIT = SELF)
	)
) ;
GO
-- After 1 minute it stops
-- and with BLOCKERS : 

ALTER INDEX [BetterKeyTable_CL] ON [BetterKeyTable] REBUILD
WITH (FILLFACTOR = 70, ONLINE = ON (
	WAIT_AT_LOW_PRIORITY (
		MAX_DURATION = 1 MINUTES, ABORT_AFTER_WAIT = BLOCKERS)
	)
) ;
GO 
