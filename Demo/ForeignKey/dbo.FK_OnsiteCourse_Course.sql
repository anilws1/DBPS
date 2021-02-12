-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\ForeignKey\dbo.FK_OnsiteCourse_Course.sql
-- PRIMARY OBJECT     : dbo.FK_OnsiteCourse_Course (ForeignKey)
-- CREATED DATE       : 02/12/2021 13:50:04.058
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
ALTER TABLE dbo.OnsiteCourse
    ADD CONSTRAINT FK_OnsiteCourse_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
go
