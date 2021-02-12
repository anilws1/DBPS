-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\Table\dbo.OnlineCourse.sql
-- PRIMARY OBJECT     : dbo.OnlineCourse (Table)
-- CREATED DATE       : 02/12/2021 13:50:03.653
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
CREATE TABLE dbo.OnlineCourse
(
    CourseID int           NOT NULL,
    URL      nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_OnlineCourse
    PRIMARY KEY CLUSTERED (CourseID)
)
go
IF OBJECT_ID(N'dbo.OnlineCourse') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.OnlineCourse >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.OnlineCourse >>>'
go
