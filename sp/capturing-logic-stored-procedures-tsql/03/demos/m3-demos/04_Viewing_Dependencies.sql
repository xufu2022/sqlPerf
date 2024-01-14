USE [WiredBrainCoffee];
GO


-- Stored procedure that Microsoft will eventually remove.
EXECUTE sp_depends @objname = 'Sales.GenerateSalesReport';
GO



-- Objects which your stored procedure depends on.
SELECT 
    [referenced_schema_name] AS 'SchemaName', 
    [referenced_entity_name] AS 'TableName',
	[referenced_minor_name] AS 'ColumnName'
FROM [sys].[dm_sql_referenced_entities]('Sales.GenerateSalesReport', 'OBJECT');
GO


-- Find out which stored procedures reference a table.
SELECT  
	[referencing_schema_name],
	[referencing_entity_name],
	[referencing_id],
	[referencing_class_desc]
FROM [sys].[dm_sql_referencing_entities]('Sales.SalesPerson', 'OBJECT');  
GO  





-- Microsoft article on the dynamic management function sys.dm_sql_referenced_entities.
https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-sql-referenced-entities-transact-sql?view=sql-server-ver15


-- Microsoft article on the dynamic management function sys.dm_sql_referencing_entities.
https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-sql-referencing-entities-transact-sql?view=sql-server-ver15