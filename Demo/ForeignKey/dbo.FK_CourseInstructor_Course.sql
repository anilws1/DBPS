-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\ForeignKey\dbo.FK_CourseInstructor_Course.sql
-- PRIMARY OBJECT     : dbo.FK_CourseInstructor_Course (ForeignKey)
-- CREATED DATE       : 02/12/2021 13:50:04.021
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
ALTER TABLE dbo.CourseInstructor
    ADD CONSTRAINT FK_CourseInstructor_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
go
