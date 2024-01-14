-- Create Database Pluralsight
CREATE DATABASE Pluralsight
	ON PRIMARY (
    NAME = [Pluralsight_data]
    ,FILENAME = 'D:\Data\Pluralsight.mdf'
    )
  	LOG ON (
    NAME = [Pluralsight_log]
    ,Filename = 'D:\Data\Pluralsight_log.ldf'
    )
GO
-- Change Compatibility Level to 110 of SQL Server 2012
ALTER DATABASE Pluralsight 
SET COMPATIBILITY_LEVEL = 110
GO
