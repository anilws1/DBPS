-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\Table\dbo.OnsiteCourse.sql
-- PRIMARY OBJECT     : dbo.OnsiteCourse (Table)
-- CREATED DATE       : 02/12/2021 13:50:03.660
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
CREATE TABLE dbo.OnsiteCourse
(
    CourseID int           NOT NULL,
    Location nvarchar(50)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Days     nvarchar(50)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [Time]   smalldatetime NOT NULL,
    CONSTRAINT PK_OnsiteCourse
    PRIMARY KEY CLUSTERED (CourseID)
)
go
IF OBJECT_ID(N'dbo.OnsiteCourse') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.OnsiteCourse >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.OnsiteCourse >>>'
go
