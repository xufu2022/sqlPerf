/*******************************************************************************
********************** Setting up databases   **********************************
********************************************************************************/
USE [master];
GO

-- database Structuredindex 

restore database Structuredindex from disk='D:\EmployeeCaseStudySampleDB2012.bak'
with replace,
move 'EmployeeCaseStudydata' to 'D:\EmployeeCaseStudy.mdf',
move 'EmployeeCaseStudylog' to 'D:\EmployeeCaseStudy.ldf'

-- database adventureworks

restore database adventureworks2014 from disk='D:\adventureworks2014.bak'
with replace,
move 'adventureworks2014_data' to 'D:\adventureworks20144.mdf',
move 'adventureworks2014_log' to 'D:\adventureworks20144.ldf'
