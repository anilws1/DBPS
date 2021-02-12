-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\ForeignKey\dbo.FK_StudentGrade_Course.sql
-- PRIMARY OBJECT     : dbo.FK_StudentGrade_Course (ForeignKey)
-- CREATED DATE       : 02/12/2021 13:50:04.070
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
ALTER TABLE dbo.StudentGrade
    ADD CONSTRAINT FK_StudentGrade_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
go
