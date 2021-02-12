-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\ForeignKey\dbo.FK_OnlineCourse_Course.sql
-- PRIMARY OBJECT     : dbo.FK_OnlineCourse_Course (ForeignKey)
-- CREATED DATE       : 02/12/2021 13:50:04.051
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
ALTER TABLE dbo.OnlineCourse
    ADD CONSTRAINT FK_OnlineCourse_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
go
