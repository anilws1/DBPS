-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\ForeignKey\dbo.FK_Course_Department.sql
-- PRIMARY OBJECT     : dbo.FK_Course_Department (ForeignKey)
-- CREATED DATE       : 02/12/2021 13:50:04.013
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
ALTER TABLE dbo.Course
    ADD CONSTRAINT FK_Course_Department
    FOREIGN KEY (DepartmentID)
    REFERENCES dbo.Department (DepartmentID)
go
