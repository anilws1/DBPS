-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\ForeignKey\dbo.FK_OfficeAssignment_Person.sql
-- PRIMARY OBJECT     : dbo.FK_OfficeAssignment_Person (ForeignKey)
-- CREATED DATE       : 02/12/2021 13:50:04.039
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
ALTER TABLE dbo.OfficeAssignment
    ADD CONSTRAINT FK_OfficeAssignment_Person
    FOREIGN KEY (InstructorID)
    REFERENCES dbo.Person (PersonID)
go
