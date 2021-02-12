-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\Table\dbo.OfficeAssignment.sql
-- PRIMARY OBJECT     : dbo.OfficeAssignment (Table)
-- CREATED DATE       : 02/12/2021 13:50:03.643
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
CREATE TABLE dbo.OfficeAssignment
(
    InstructorID int          NOT NULL,
    Location     nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [Timestamp]  timestamp    NOT NULL,
    CONSTRAINT PK_OfficeAssignment
    PRIMARY KEY CLUSTERED (InstructorID)
)
go
IF OBJECT_ID(N'dbo.OfficeAssignment') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.OfficeAssignment >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.OfficeAssignment >>>'
go
