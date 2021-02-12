-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\ForeignKey\dbo.FK_StudentGrade_Student.sql
-- PRIMARY OBJECT     : dbo.FK_StudentGrade_Student (ForeignKey)
-- CREATED DATE       : 02/12/2021 13:50:04.077
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
ALTER TABLE dbo.StudentGrade
    ADD CONSTRAINT FK_StudentGrade_Student
    FOREIGN KEY (StudentID)
    REFERENCES dbo.Person (PersonID)
go
