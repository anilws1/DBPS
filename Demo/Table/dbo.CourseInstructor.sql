-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\Table\dbo.CourseInstructor.sql
-- PRIMARY OBJECT     : dbo.CourseInstructor (Table)
-- CREATED DATE       : 02/12/2021 13:50:03.625
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
CREATE TABLE dbo.CourseInstructor
(
    CourseID int NOT NULL,
    PersonID int NOT NULL,
    CONSTRAINT PK_CourseInstructor
    PRIMARY KEY CLUSTERED (CourseID,PersonID)
)
go
IF OBJECT_ID(N'dbo.CourseInstructor') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.CourseInstructor >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.CourseInstructor >>>'
go
