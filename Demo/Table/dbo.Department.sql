-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\Table\dbo.Department.sql
-- PRIMARY OBJECT     : dbo.Department (Table)
-- CREATED DATE       : 02/12/2021 13:50:03.633
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
CREATE TABLE dbo.Department
(
    DepartmentID  int          NOT NULL,
    Name          nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Budget        money        NOT NULL,
    StartDate     datetime     NOT NULL,
    Administrator int          NULL,
    CONSTRAINT PK_Department
    PRIMARY KEY CLUSTERED (DepartmentID)
)
go
IF OBJECT_ID(N'dbo.Department') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Department >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Department >>>'
go
