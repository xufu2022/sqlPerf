--#1 create demo table and non-clustered index

CREATE TABLE dbo.psdemo_stats
(col1 INT
, col2 INT IDENTITY
);

SELECT TOP 2000
IDENTITY(INT, 1, 1) AS num
INTO #numbers
FROM master.dbo.syscolumns AS c1
	, master.dbo.syscolumns AS c2;

INSERT INTO dbo.psdemo_stats
(
    col1
)

SELECT 2
FROM #numbers;

DROP TABLE #numbers; 

CREATE NONCLUSTERED INDEX ix_psdemo_stats ON dbo.psdemo_stats (col1);

ALTER DATABASE DataMozart SET AUTO_UPDATE_STATISTICS OFF;


SELECT col1
	, col2
FROM dbo.psdemo_stats
WHERE col1 = 2


--#2 Statistics on Non-indexed columns

--create 1st table
CREATE TABLE dbo.ps_demo_stats2
(t1_col1 INT IDENTITY
, t1_col2 INT
);

INSERT INTO dbo.ps_demo_stats2
(
    t1_col2
)
VALUES
(1
    );

SELECT TOP 10000 IDENTITY(INT, 1, 1) AS num
INTO #numbers
FROM master.dbo.syscolumns AS c1
	, master.dbo.syscolumns AS c2;

INSERT INTO dbo.ps_demo_stats2
(
    t1_col2
)

SELECT 2
FROM #numbers;

CREATE CLUSTERED INDEX ix_col1 ON dbo.ps_demo_stats2 (t1_col1);

--create 2nd table
CREATE TABLE dbo.ps_demo_stats3
(t2_col1 INT IDENTITY
, t2_col2 INT
);

INSERT INTO dbo.ps_demo_stats3
(
    t2_col2
)
VALUES
(2
    );

INSERT INTO dbo.ps_demo_stats3
(
    t2_col2
)

SELECT 1
FROM #numbers;

DROP TABLE #numbers;

CREATE CLUSTERED INDEX ix_col1_t2 ON dbo.ps_demo_stats3 (t2_col1);

--ENABLE AUTO-STATISTICS on the database
ALTER DATABASE DataMozart SET AUTO_CREATE_STATISTICS ON;

--CHECK TABLE STATISTICS
--SELECT o.name
--	, *
--	--, o.auto_created
--	--, o.user_created
--FROM sys.objects AS o
--WHERE o.object_id = OBJECT_ID ('ps_demo_stats2')


--query
SELECT t1.t1_col2
	,t2.t2_col2
FROM dbo.ps_demo_stats2 AS t1
	INNER JOIN dbo.ps_demo_stats3 AS t2
	ON t1.t1_col2 = t2.t2_col2
WHERE t1.t1_col2 = 2;


