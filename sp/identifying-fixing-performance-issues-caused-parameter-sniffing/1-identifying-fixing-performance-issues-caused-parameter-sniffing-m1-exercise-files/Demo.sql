EXEC dbo.SalesTotalsPerMonth @Country = 'US' -- Fast

DBCC FREEPROCCACHE -- to simulate a server restart or similar. DO NOT RUN this on a production server!


EXEC dbo.SalesTotalsPerMonth @Country = 'MU' -- 35 rows
GO
EXEC dbo.SalesTotalsPerMonth @Country = 'US' -- slow