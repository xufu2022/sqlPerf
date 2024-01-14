-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Prevent Long Blocking Chains
-----------------------------------------------------------------------

-- If you want to create scenarios for testing this "sample" code
-- then you'll need to restore / setup the credit database
--   Course: SQL Server: Optimizing Stored Procedure Performance
--	 Module: Creation, Compilation, and Invalidation
--   Demo: Credit Sample Database Setup  
-- Open Script: CreditDemoDatabaseSetup.sql
-- Execute your modified version of this script

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------

-- This is not really a formal demo but some "sample" code related to
-- dealing with administrative blocking for things like sp_recompile.

-- The idea is two-fold: 

-- (1) Don't even get in the queue IF
-- * anyone else holds a table-lock of any kind for more than XX amount 
--   of time (from a long running query)
--		NOTE: Since we're looking for long running operations you'll 
--      probably want to set this fairly high. (E.G. 30 seconds or more)
--
--	  WHERE TO SET: 
--		Change the number (in milliseconds) in the WHERE clause:
--          [des].[last_request_start_time] 
--                   < DATEADD(ms, -30000, SYSDATETIME())) > 0 

-- (2) Once you get into the queue then don't stay there (creating a long
--     blocking chain) if we can't acquire the lock after XX seconds
--      NOTE: Since this will prevent ALL other operations, you'll want
--      to set fairly low. (E.G. 5 seconds or less)
--
--	  WHERE TO SET: 
--		Change the number (in milliseconds) of the LOCK_TIMEOUT statement:
--			SET LOCK_TIMEOUT 2000
--
-- 
-- How many attempts and for how long are we going to keep trying to
-- succeed?
--		Change the number of retries to do this again and again
--			, @Retries = 2000
--		NOTE: It's best to have retries HIGH and lock_timeout low so that 
--      you keep letting other transactions through but you keep trying 
--      for a certain amount of time?

-- One final safety setting is to give up after a certain number of total 
-- minutes waiting to even get started OR if you reach the max during 
-- retries.
--	  WHERE TO SET: 
--		Change the number (in MINUTEs) of the @MaxRunTime variable:
--			, @MaxRunTime = 1

SET NOCOUNT ON;
SET LOCK_TIMEOUT 2000;

DECLARE @timeout	INT
	, @Retries		TINYINT
	, @CurrentRetry	TINYINT
	, @CurrentTime	NVARCHAR(100)
	, @StartTime	DATETIME
	, @MaxRunTime	TINYINT;

-- The timeout variable is only used in the informational message
SELECT @timeout = @@LOCK_TIMEOUT	-- milliseconds
	, @StartTime = GETDATE()	    -- Don't need high precision
	, @MaxRunTime = 1			    -- minutes
	, @Retries = 4				    -- number of attempts 
	, @CurrentRetry = 0;
	
TryAgain:;

BEGIN TRY
	BEGIN
	WHILE (SELECT COUNT(*) 
            FROM [sys].[dm_tran_locks] AS [l]
                JOIN [sys].[dm_exec_sessions] AS [des]
                    ON [l].[request_session_id] = [des].[session_id]
            WHERE [l].[resource_database_id] = DB_ID() 
	            AND [l].[resource_associated_entity_id] 
                        = OBJECT_ID(N'dbo.member')
	            AND [des].[last_request_start_time] 
                        < DATEADD(ms, -30000, SYSDATETIME())) > 0 
		BEGIN
            -- this acts like a spin lock (now? now? now? etc.)
			WAITFOR DELAY '00:00:00.001' 

			IF DATEADD(mi, @MaxRunTime, @StartTime) < GETDATE()
			BEGIN
				SELECT @CurrentTime = 
                    CONVERT(nvarchar, SYSDATETIME(), 109)

				RAISERROR ('Time: %s. Giving up. Could not gain access to the table in %d minute(s). Too many long running operations on the table. '
                    , 10, 1, @CurrentTime, @MaxRunTime)
				
                GOTO GivingUp
			END
		END
	
	-- This won't even run until there are no locks from batches 
    -- more than 20 seconds old.

	-- This is where you put the maintenance operation that requires 
    -- that requires the SCH_M lock that you want to be "low priority"
	
    EXEC [sp_recompile] N'dbo.member'

	END
END TRY

BEGIN CATCH
BEGIN
	IF @@TRANCOUNT > 1  -- This is only needed if your maintenance op starts
                        -- a transaction. It's needed because LOCK_TIMEOUT
                        -- kills the statement but not the transaction.
        ROLLBACK TRAN

    SELECT @CurrentRetry = @CurrentRetry + 1 
	
    SELECT @CurrentTime = CONVERT(NVARCHAR, SYSDATETIME(), 109)
	
    RAISERROR ('Time: %s. Could not obtain lock in a timely [%d ms] manner. Retry attempt %d of %d.'
        , 10, 1, @CurrentTime, @timeout, @CurrentRetry, @Retries)
            	
    IF @CurrentRetry < @Retries
		GOTO TryAgain
	ELSE
		BEGIN
			SELECT @CurrentTime = CONVERT(NVARCHAR, SYSDATETIME(), 109);
			RAISERROR ('Time: %s. Could not obtain lock in a timely [%d ms] manner. Retries failed.'
                , 10, 1, @CurrentTime, @timeout, @CurrentRetry, @Retries);
            RETURN
		END
END
END CATCH;

GivingUp:;

SET LOCK_TIMEOUT -1;
GO