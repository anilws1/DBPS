-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\Table\dbo.Course.sql
-- PRIMARY OBJECT     : dbo.Course (Table)
-- CREATED DATE       : 02/12/2021 13:50:03.616
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- Author             : Anil Mahadev
-- --------------------------------------------------------------------------------
CREATE TABLE dbo.Course
(
    CourseID     int           NOT NULL,
    Title        nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Credits      int           NOT NULL,
    DepartmentID int           NOT NULL,
    CONSTRAINT [PK_School.Course]
    PRIMARY KEY CLUSTERED (CourseID)
)
go
IF OBJECT_ID(N'dbo.Course') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Course >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Course >>>'
go
