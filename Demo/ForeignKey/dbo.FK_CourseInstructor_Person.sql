-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\ForeignKey\dbo.FK_CourseInstructor_Person.sql
-- PRIMARY OBJECT     : dbo.FK_CourseInstructor_Person (ForeignKey)
-- CREATED DATE       : 02/12/2021 13:50:04.030
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
ALTER TABLE dbo.CourseInstructor
    ADD CONSTRAINT FK_CourseInstructor_Person
    FOREIGN KEY (PersonID)
    REFERENCES dbo.Person (PersonID)
go
