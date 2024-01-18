USE [WiredBrainCoffee];
GO

DROP TABLE IF EXISTS [dbo].[IndexKeyOrder];

CREATE TABLE [dbo].[IndexKeyOrder]
(
    [First] INT IDENTITY(1, 1),
    [Fourth] INT NOT NULL,
    [Third] INT NOT NULL,
    [Second] INT NOT NULL,
	[Notes] NVARCHAR(250) NULL
        CONSTRAINT [PK_IndexKeyOrder_First]
        PRIMARY KEY CLUSTERED ([First])
);
GO

INSERT INTO [dbo].[IndexKeyOrder]
(
    [Second],
    [Third],
    [Fourth],
	[Notes]
)
SELECT TOP (100000)
       ABS(CHECKSUM(NEWID()) % 10000) + 1 AS [Second],
       ABS(CHECKSUM(NEWID()) % 1000) + 1 AS [Third],
       ABS(CHECKSUM(NEWID()) % 10) + 1 AS [Fourth],
	   REPLICATE('The answer to life is 42',10)
FROM [sys].[all_columns] AS n1
    CROSS JOIN [sys].[all_columns] AS n2;
GO



SELECT TOP (1)
       [Second],
       [Third],
       [Fourth]
FROM [dbo].[IndexKeyOrder]
ORDER BY RAND();


-- Second | Third | Fourth
--


SET STATISTICS IO ON;

SELECT [Second],
       [Third],
       [Fourth]
FROM [dbo].[IndexKeyOrder]
WHERE [Second] = xxxx
      AND [Third] = xxx
      AND [Fourth] = x;

SET STATISTICS IO OFF;


CREATE NONCLUSTERED INDEX [IX_Fourth_Third_Second]
ON [dbo].[IndexKeyOrder] (
                         [Fourth],
                         [Third],
                         [Second]
                     );
GO



SET STATISTICS IO ON;

SELECT [Second],
       [Third],
       [Fourth]
FROM [dbo].[IndexKeyOrder]
WHERE [Second] = xxxx;

SET STATISTICS IO OFF;






CREATE NONCLUSTERED INDEX [IX_Second_Third_Fourth]
ON [dbo].[IndexKeyOrder] (
                         [Second],
                         [Third],
                         [Fourth]
                     );



SET STATISTICS IO ON;

SELECT [Second],
       [Third],
       [Fourth]
FROM [dbo].[IndexKeyOrder]
WHERE [Second] = xxxx
      AND [Third] = xxx
      AND [Fourth] = x;

SELECT [Second],
       [Third],
       [Fourth]
FROM [dbo].[IndexKeyOrder]
WHERE [Second] = xxxx;


SET STATISTICS IO OFF;



SET STATISTICS IO ON;

SELECT [Second],
       [Third],
       [Fourth]
FROM [dbo].[IndexKeyOrder]
WHERE [Fourth] = 3
ORDER BY [Third] DESC;

SET STATISTICS IO OFF;
GO