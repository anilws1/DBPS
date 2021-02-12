-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\Table\dbo.StudentGrade.sql
-- PRIMARY OBJECT     : dbo.StudentGrade (Table)
-- CREATED DATE       : 02/12/2021 13:50:03.677
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
CREATE TABLE dbo.StudentGrade
(
    EnrollmentID int          IDENTITY,
    CourseID     int          NOT NULL,
    StudentID    int          NOT NULL,
    Grade        decimal(3,2) NULL,
    CONSTRAINT PK_StudentGrade
    PRIMARY KEY CLUSTERED (EnrollmentID)
)
go
IF OBJECT_ID(N'dbo.StudentGrade') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.StudentGrade >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.StudentGrade >>>'
go
