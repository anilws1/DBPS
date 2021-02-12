-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\Table\dbo.Person.sql
-- PRIMARY OBJECT     : dbo.Person (Table)
-- CREATED DATE       : 02/12/2021 13:50:03.670
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
CREATE TABLE dbo.Person
(
    PersonID       int          IDENTITY,
    LastName       nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    FirstName      nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    HireDate       datetime     NULL,
    EnrollmentDate datetime     NULL,
    Discriminator  nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_School.Student]
    PRIMARY KEY CLUSTERED (PersonID)
)
go
IF OBJECT_ID(N'dbo.Person') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Person >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Person >>>'
go
