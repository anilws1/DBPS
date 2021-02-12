-- --------------------------------------------------------------------------------
-- FILE               : C:\Demo\Table\dbo.sysdiagrams.sql
-- PRIMARY OBJECT     : dbo.sysdiagrams (Table)
-- CREATED DATE       : 02/12/2021 13:50:03.692
-- SOURCE             : Reverse-Engineered from SQL Server on Windows (SQLServer)
-- --------------------------------------------------------------------------------
CREATE TABLE dbo.sysdiagrams
(
    name         sysname        COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    principal_id int            NOT NULL,
    diagram_id   int            IDENTITY,
    version      int            NULL,
    definition   varbinary(max) NULL,
    CONSTRAINT PK__sysdiagr__C2B05B61388FA6E4
    PRIMARY KEY CLUSTERED (diagram_id),
    CONSTRAINT UK_principal_name
    UNIQUE NONCLUSTERED (principal_id,name)
)
go
IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.sysdiagrams >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.sysdiagrams >>>'
go
