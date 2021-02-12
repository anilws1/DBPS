--------------------------------------------------------------------------------
-- IDERA DB Change Manager Synchronization Script
-- FILE                : Orders Archive (Orders) Feb 7, 2021, 10_52_10 PM.sql
-- DATE                : Feb 7, 2021, 10:52:11 PM
--
-- SOURCE DATA SOURCE  : 192.168.229.128
--------------------------------------------------------------------------------
USE Orders
go

CREATE TABLE dbo.Categories
    (
        CategoryID INT IDENTITY,
        CategoryName NVARCHAR (15)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        Description NTEXT
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (CategoryID)
    )
go

IF OBJECT_ID (N'dbo.Categories') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Categories >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Categories >>>'
go

CREATE NONCLUSTERED INDEX
    CategoryName ON
    dbo.Categories (CategoryName) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Categories') AND
               name = N'CategoryName')
    PRINT N'<<< CREATED INDEX dbo.Categories.CategoryName >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Categories.CategoryName >>>'
go

GRANT
    DELETE
    ON dbo.Categories TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.Categories TO
    PUBLIC
go

GRANT
    REFERENCES
    ON dbo.Categories TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.Categories TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.Categories TO
    PUBLIC
go

EXEC dbo.sp_addextendedproperty
        @name = N'MS_Description',
        @value = N'The product marketing category',
        @level0type = N'USER',
        @level0name = N'dbo',
        @level1type = N'TABLE',
        @level1name = N'Categories',
        @level2type = N'COLUMN',
        @level2name = N'CategoryName'
go

CREATE TABLE dbo.CustomerDemographics
    (
        CustomerTypeID NCHAR (10)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        CustomerDesc NTEXT
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        CONSTRAINT PK_CustomerDemographics PRIMARY KEY NONCLUSTERED (CustomerTypeID)
    )
go

IF OBJECT_ID (N'dbo.CustomerDemographics') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.CustomerDemographics >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.CustomerDemographics >>>'
go

GRANT
    DELETE
    ON dbo.CustomerDemographics TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.CustomerDemographics TO
    PUBLIC
go

GRANT
    REFERENCES
    ON dbo.CustomerDemographics TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.CustomerDemographics TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.CustomerDemographics TO
    PUBLIC
go

CREATE TABLE dbo.Customers
    (
        CustomerID NCHAR (5)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        CompanyName VARCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        ContactName VARCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        ContactTitle VARCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Address VARCHAR (60)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        City VARCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Region VARCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        PostalCode VARCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Country VARCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Phone VARCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Fax VARCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED (CustomerID)
    )
go

IF OBJECT_ID (N'dbo.Customers') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Customers >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Customers >>>'
go

CREATE NONCLUSTERED INDEX
    City ON
    dbo.Customers (City) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Customers') AND
               name = N'City')
    PRINT N'<<< CREATED INDEX dbo.Customers.City >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Customers.City >>>'
go

CREATE NONCLUSTERED INDEX
    CompanyName ON
    dbo.Customers (CompanyName) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Customers') AND
               name = N'CompanyName')
    PRINT N'<<< CREATED INDEX dbo.Customers.CompanyName >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Customers.CompanyName >>>'
go

CREATE NONCLUSTERED INDEX
    PostalCode ON
    dbo.Customers (PostalCode) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Customers') AND
               name = N'PostalCode')
    PRINT N'<<< CREATED INDEX dbo.Customers.PostalCode >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Customers.PostalCode >>>'
go

CREATE NONCLUSTERED INDEX
    Region ON
    dbo.Customers (Region) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Customers') AND
               name = N'Region')
    PRINT N'<<< CREATED INDEX dbo.Customers.Region >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Customers.Region >>>'
go

CREATE TABLE dbo.CustomerCustomerDemo
    (
        CustomerID NCHAR (5)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        CustomerTypeID NCHAR (10)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        CONSTRAINT PK_CustomerCustomerDemo PRIMARY KEY NONCLUSTERED (CustomerID, CustomerTypeID)
    )
go

IF OBJECT_ID (N'dbo.CustomerCustomerDemo') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.CustomerCustomerDemo >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.CustomerCustomerDemo >>>'
go

GRANT
    DELETE
    ON dbo.Customers TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.Customers TO
    PUBLIC
go

GRANT
    REFERENCES
    ON dbo.Customers TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.Customers TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.Customers TO
    PUBLIC
go

EXEC dbo.sp_addextendedproperty
        @name = N'MS_Description',
        @value = N'This is the customers registered name',
        @level0type = N'USER',
        @level0name = N'dbo',
        @level1type = N'TABLE',
        @level1name = N'Customers',
        @level2type = N'COLUMN',
        @level2name = N'CompanyName'
go

EXEC dbo.sp_addextendedproperty
        @name = N'MS_Description',
        @value = N'This is the customers head office address city',
        @level0type = N'USER',
        @level0name = N'dbo',
        @level1type = N'TABLE',
        @level1name = N'Customers',
        @level2type = N'COLUMN',
        @level2name = N'City'
go

EXEC dbo.sp_addextendedproperty
        @name = N'MS_Description',
        @value = N'This is the customers head office address country',
        @level0type = N'USER',
        @level0name = N'dbo',
        @level1type = N'TABLE',
        @level1name = N'Customers',
        @level2type = N'COLUMN',
        @level2name = N'Country'
go

CREATE TABLE dbo.Region
    (
        RegionID INT NOT NULL,
        RegionDescription NCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        CONSTRAINT PK_Region PRIMARY KEY NONCLUSTERED (RegionID)
    )
go

IF OBJECT_ID (N'dbo.Region') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Region >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Region >>>'
go

GRANT
    DELETE
    ON dbo.Region TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.Region TO
    PUBLIC
go

GRANT
    REFERENCES
    ON dbo.Region TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.Region TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.Region TO
    PUBLIC
go

CREATE TABLE dbo.Territories
    (
        TerritoryID NVARCHAR (20)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        TerritoryDescription NCHAR (50)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        RegionID INT NOT NULL,
        CONSTRAINT PK_Territories PRIMARY KEY NONCLUSTERED (TerritoryID)
    )
go

IF OBJECT_ID (N'dbo.Territories') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Territories >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Territories >>>'
go

ALTER TABLE dbo.Territories ADD CONSTRAINT FK_Territories_Region FOREIGN KEY (RegionID) REFERENCES dbo.Region (RegionID)
go

CREATE TABLE dbo.Shippers
    (
        ShipperID INT IDENTITY,
        CompanyName NVARCHAR (40)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        Phone NVARCHAR (24)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        CONSTRAINT PK_Shippers PRIMARY KEY CLUSTERED (ShipperID)
    )
go

IF OBJECT_ID (N'dbo.Shippers') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Shippers >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Shippers >>>'
go

CREATE TABLE dbo.Suppliers
    (
        SupplierID INT IDENTITY,
        CompanyName NVARCHAR (40)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        ContactName NVARCHAR (30)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        ContactTitle NVARCHAR (30)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Address NVARCHAR (60)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        City NVARCHAR (15)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Region NVARCHAR (15)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        PostalCode NVARCHAR (10)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Country NVARCHAR (15)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Phone NVARCHAR (24)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        Fax NVARCHAR (24)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        HomePage NTEXT
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        CONSTRAINT PK_Suppliers PRIMARY KEY CLUSTERED (SupplierID)
    )
go

IF OBJECT_ID (N'dbo.Suppliers') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Suppliers >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Suppliers >>>'
go

CREATE NONCLUSTERED INDEX
    CompanyName ON
    dbo.Suppliers (CompanyName) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Suppliers') AND
               name = N'CompanyName')
    PRINT N'<<< CREATED INDEX dbo.Suppliers.CompanyName >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Suppliers.CompanyName >>>'
go

CREATE NONCLUSTERED INDEX
    PostalCode ON
    dbo.Suppliers (PostalCode) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Suppliers') AND
               name = N'PostalCode')
    PRINT N'<<< CREATED INDEX dbo.Suppliers.PostalCode >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Suppliers.PostalCode >>>'
go

CREATE TABLE dbo.Products
    (
        ProductID INT IDENTITY,
        ProductName NVARCHAR (40)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        SupplierID INT NULL,
        CategoryID INT NULL,
        QuantityPerUnit NVARCHAR (20)
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NULL,
        UnitPrice MONEY
        CONSTRAINT DF_Products_UnitPrice DEFAULT 0
        NULL,
        UnitsInStock SMALLINT
        CONSTRAINT DF_Products_UnitsInStock DEFAULT 0
        NULL,
        UnitsOnOrder SMALLINT
        CONSTRAINT DF_Products_UnitsOnOrder DEFAULT 0
        NULL,
        ReorderLevel SMALLINT
        CONSTRAINT DF_Products_ReorderLevel DEFAULT 0
        NULL,
        Discontinued BIT
        CONSTRAINT DF_Products_Discontinued DEFAULT 0
        NOT NULL,
        CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (ProductID),
        CONSTRAINT CK_Products_UnitPrice CHECK ([UnitPrice] >= 0),
        CONSTRAINT CK_ReorderLevel CHECK ([ReorderLevel] >= 0),
        CONSTRAINT CK_UnitsInStock CHECK ([UnitsInStock] >= 0),
        CONSTRAINT CK_UnitsOnOrder CHECK ([UnitsOnOrder] >= 0)
    )
go

IF OBJECT_ID (N'dbo.Products') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Products >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Products >>>'
go

CREATE VIEW dbo.[Customer and Suppliers by City] AS
    SELECT
        City,
        CompanyName,
        ContactName,
        'Customers' AS Relationship
    FROM Customers
    UNION
        SELECT
            City,
            CompanyName,
            ContactName,
            'Suppliers'
        FROM Suppliers--ORDER BY City, CompanyName

go

IF OBJECT_ID (N'dbo.[Customer and Suppliers by City]') IS NOT NULL
    PRINT N'<<< CREATED VIEW dbo.[Customer and Suppliers by City] >>>'
ELSE
    PRINT N'<<< FAILED CREATING VIEW dbo.[Customer and Suppliers by City] >>>'
go

GRANT
    DELETE
    ON dbo.Suppliers TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.Suppliers TO
    PUBLIC
go

GRANT
    REFERENCES
    ON dbo.Suppliers TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.Suppliers TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.Suppliers TO
    PUBLIC
go

CREATE TABLE dbo.sysdiagrams
    (
        name SYSNAME
        COLLATE SQL_Latin1_General_CP1_CI_AS
        NOT NULL,
        principal_id INT NOT NULL,
        diagram_id INT IDENTITY,
        version INT NULL,
        definition VARBINARY (MAX) NULL,
        CONSTRAINT PK__sysdiagrams__5EBF139D PRIMARY KEY CLUSTERED (diagram_id),
        CONSTRAINT UK_principal_name UNIQUE NONCLUSTERED (principal_id, name)
    )
go

IF OBJECT_ID (N'dbo.sysdiagrams') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.sysdiagrams >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.sysdiagrams >>>'
go

EXEC dbo.sp_addextendedproperty
        @name = N'microsoft_database_tools_support',
        @value = N'1',
        @level0type = N'USER',
        @level0name = N'dbo',
        @level1type = N'TABLE',
        @level1name = N'sysdiagrams'
go

CREATE PROCEDURE dbo.sp_upgraddiagrams
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
go

IF OBJECT_ID (N'dbo.sp_upgraddiagrams') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.sp_upgraddiagrams >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.sp_upgraddiagrams >>>'
go

CREATE PROCEDURE dbo.sp_helpdiagrams
    (
        @diagramname SYSNAME = NULL,
        @owner_id INT = NULL
    )
WITH EXECUTE AS N'dbo'
    AS
        BEGIN
            DECLARE @user SYSNAME
            DECLARE @dboLogin BIT
            EXECUTE AS CALLER;
            SET
                @user =
                USER_NAME ();
            SET
                @dboLogin =
                CONVERT (BIT,
                         IS_MEMBER ('db_owner'));
            REVERT;
            SELECT
                [Database] = DB_NAME (),
                [Name] = name,
                [ID] = diagram_id,
                [Owner] = USER_NAME (principal_id),
                [OwnerID] = principal_id
            FROM sysdiagrams
            WHERE
                (@dboLogin = 1 OR
                 USER_NAME (principal_id) = @user) AND
                (@diagramname IS NULL OR
                 name = @diagramname) AND
                (@owner_id IS NULL OR
                 principal_id = @owner_id)
            ORDER BY
                4,
                5,
                1
        END
go

IF OBJECT_ID (N'dbo.sp_helpdiagrams') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.sp_helpdiagrams >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.sp_helpdiagrams >>>'
go

CREATE PROCEDURE dbo.sp_helpdiagramdefinition
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
go

IF OBJECT_ID (N'dbo.sp_helpdiagramdefinition') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.sp_helpdiagramdefinition >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.sp_helpdiagramdefinition >>>'
go

CREATE PROCEDURE dbo.sp_creatediagram
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
go

IF OBJECT_ID (N'dbo.sp_creatediagram') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.sp_creatediagram >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.sp_creatediagram >>>'
go

CREATE PROCEDURE dbo.sp_renamediagram
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
go

IF OBJECT_ID (N'dbo.sp_renamediagram') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.sp_renamediagram >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.sp_renamediagram >>>'
go

CREATE PROCEDURE dbo.sp_alterdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
go

IF OBJECT_ID (N'dbo.sp_alterdiagram') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.sp_alterdiagram >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.sp_alterdiagram >>>'
go

CREATE PROCEDURE dbo.sp_dropdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
go

IF OBJECT_ID (N'dbo.sp_dropdiagram') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.sp_dropdiagram >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.sp_dropdiagram >>>'
go

GRANT
    DELETE
    ON dbo.Territories TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.Territories TO
    PUBLIC
go

GRANT
    REFERENCES
    ON dbo.Territories TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.Territories TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.Territories TO
    PUBLIC
go

GRANT
    EXECUTE
    ON dbo.sp_alterdiagram TO
    PUBLIC
go

DENY
    EXECUTE
    ON dbo.sp_alterdiagram TO
    guest
go

GRANT
    EXECUTE
    ON dbo.sp_creatediagram TO
    PUBLIC
go

DENY
    EXECUTE
    ON dbo.sp_creatediagram TO
    guest
go

GRANT
    EXECUTE
    ON dbo.sp_dropdiagram TO
    PUBLIC
go

DENY
    EXECUTE
    ON dbo.sp_dropdiagram TO
    guest
go

GRANT
    EXECUTE
    ON dbo.sp_helpdiagramdefinition TO
    PUBLIC
go

DENY
    EXECUTE
    ON dbo.sp_helpdiagramdefinition TO
    guest
go

GRANT
    EXECUTE
    ON dbo.sp_helpdiagrams TO
    PUBLIC
go

DENY
    EXECUTE
    ON dbo.sp_helpdiagrams TO
    guest
go

GRANT
    EXECUTE
    ON dbo.sp_renamediagram TO
    PUBLIC
go

DENY
    EXECUTE
    ON dbo.sp_renamediagram TO
    guest
go

GRANT
    DELETE
    ON dbo.[Customer and Suppliers by City] TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.[Customer and Suppliers by City] TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.[Customer and Suppliers by City] TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.[Customer and Suppliers by City] TO
    PUBLIC
go

CREATE NONCLUSTERED INDEX
    CategoriesProducts ON
    dbo.Products (CategoryID) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Products') AND
               name = N'CategoriesProducts')
    PRINT N'<<< CREATED INDEX dbo.Products.CategoriesProducts >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Products.CategoriesProducts >>>'
go

CREATE NONCLUSTERED INDEX
    CategoryID ON
    dbo.Products (CategoryID) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Products') AND
               name = N'CategoryID')
    PRINT N'<<< CREATED INDEX dbo.Products.CategoryID >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Products.CategoryID >>>'
go

CREATE NONCLUSTERED INDEX
    ProductName ON
    dbo.Products (ProductName) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Products') AND
               name = N'ProductName')
    PRINT N'<<< CREATED INDEX dbo.Products.ProductName >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Products.ProductName >>>'
go

CREATE NONCLUSTERED INDEX
    SupplierID ON
    dbo.Products (SupplierID) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Products') AND
               name = N'SupplierID')
    PRINT N'<<< CREATED INDEX dbo.Products.SupplierID >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Products.SupplierID >>>'
go

CREATE NONCLUSTERED INDEX
    SuppliersProducts ON
    dbo.Products (SupplierID) WITH (PAD_INDEX = OFF)
go

IF EXISTS (SELECT *
           FROM sys.indexes
           WHERE
               object_id = OBJECT_ID (N'dbo.Products') AND
               name = N'SuppliersProducts')
    PRINT N'<<< CREATED INDEX dbo.Products.SuppliersProducts >>>'
ELSE
    PRINT N'<<< FAILED CREATING INDEX dbo.Products.SuppliersProducts >>>'
go

ALTER TABLE dbo.Products WITH NOCHECK ADD CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) REFERENCES dbo.Categories (
            CategoryID)
go

CREATE VIEW dbo.[Alphabetical list of products] AS
    SELECT
        Products.*,
        Categories.CategoryName
    FROM
        Categories
        INNER JOIN
        Products
        ON Categories.CategoryID = Products.CategoryID
    WHERE (((Products.Discontinued) = 0))
go

IF OBJECT_ID (N'dbo.[Alphabetical list of products]') IS NOT NULL
    PRINT N'<<< CREATED VIEW dbo.[Alphabetical list of products] >>>'
ELSE
    PRINT N'<<< FAILED CREATING VIEW dbo.[Alphabetical list of products] >>>'
go

CREATE VIEW dbo.[Products by Category] AS
    SELECT
        Categories.CategoryName,
        Products.ProductName,
        Products.QuantityPerUnit,
        Products.UnitsInStock,
        Products.Discontinued
    FROM
        Categories
        INNER JOIN
        Products
        ON Categories.CategoryID = Products.CategoryID
    WHERE Products.Discontinued <> 1--ORDER BY Categories.CategoryName, Products.ProductName

go

IF OBJECT_ID (N'dbo.[Products by Category]') IS NOT NULL
    PRINT N'<<< CREATED VIEW dbo.[Products by Category] >>>'
ELSE
    PRINT N'<<< FAILED CREATING VIEW dbo.[Products by Category] >>>'
go

GRANT
    DELETE
    ON dbo.CustomerCustomerDemo TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.CustomerCustomerDemo TO
    PUBLIC
go

GRANT
    REFERENCES
    ON dbo.CustomerCustomerDemo TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.CustomerCustomerDemo TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.CustomerCustomerDemo TO
    PUBLIC
go

ALTER TABLE dbo.CustomerCustomerDemo ADD CONSTRAINT FK_CustomerCustomerDemo FOREIGN KEY (CustomerTypeID) REFERENCES dbo.
            CustomerDemographics (CustomerTypeID)
go

ALTER TABLE dbo.CustomerCustomerDemo ADD CONSTRAINT FK_CustomerCustomerDemo_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers 
            (CustomerID)
go

GRANT
    DELETE
    ON dbo.Products TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.Products TO
    PUBLIC
go

GRANT
    REFERENCES
    ON dbo.Products TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.Products TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.Products TO
    PUBLIC
go

EXEC dbo.sp_addextendedproperty
        @name = N'MS_Description',
        @value = N'This is the primary market product name',
        @level0type = N'USER',
        @level0name = N'dbo',
        @level1type = N'TABLE',
        @level1name = N'Products',
        @level2type = N'COLUMN',
        @level2name = N'ProductName'
go

CREATE PROCEDURE dbo.[Ten Most Expensive Products] AS
        SET ROWCOUNT 10
        SELECT
            Products.ProductName AS TenMostExpensiveProducts,
            Products.UnitPrice
        FROM Products
        ORDER BY Products.UnitPrice DESC
go

IF OBJECT_ID (N'dbo.[Ten Most Expensive Products]') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.[Ten Most Expensive Products] >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.[Ten Most Expensive Products] >>>'
go

CREATE PROCEDURE dbo.CustOrdersDetail
    @OrderID INT
    AS
        SELECT
            ProductName,
            UnitPrice = ROUND (Od.UnitPrice,
                               2),
            Quantity,
            Discount = CONVERT (INT,
                                Discount * 100),
            ExtendedPrice = ROUND (CONVERT (MONEY,
                                            Quantity * (1 - Discount) * Od.UnitPrice),
                                   2)
        FROM
            Products P,
            [Order Details] Od
        WHERE
            Od.ProductID = P.ProductID AND
            Od.OrderID = @OrderID
go

IF OBJECT_ID (N'dbo.CustOrdersDetail') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.CustOrdersDetail >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.CustOrdersDetail >>>'
go

CREATE VIEW dbo.[Order Details Extended] AS
    SELECT
        "Order Details".OrderID,
        "Order Details".ProductID,
        Products.ProductName,
        "Order Details".UnitPrice,
        "Order Details".Quantity,
        "Order Details".Discount,
        (CONVERT (MONEY,
                  ("Order Details".UnitPrice * Quantity * (1 - Discount) / 100)) * 100) AS ExtendedPrice
    FROM
        Products
        INNER JOIN
        "Order Details"
        ON Products.ProductID = "Order Details".ProductID--ORDER BY "Order Details".OrderID

go

IF OBJECT_ID (N'dbo.[Order Details Extended]') IS NOT NULL
    PRINT N'<<< CREATED VIEW dbo.[Order Details Extended] >>>'
ELSE
    PRINT N'<<< FAILED CREATING VIEW dbo.[Order Details Extended] >>>'
go

CREATE VIEW dbo.[Products Above Average Price] AS
    SELECT
        Products.ProductName,
        Products.UnitPrice
    FROM Products
    WHERE Products.UnitPrice > (SELECT AVG (UnitPrice)
                                FROM Products)--ORDER BY Products.UnitPrice DESC

go

IF OBJECT_ID (N'dbo.[Products Above Average Price]') IS NOT NULL
    PRINT N'<<< CREATED VIEW dbo.[Products Above Average Price] >>>'
ELSE
    PRINT N'<<< FAILED CREATING VIEW dbo.[Products Above Average Price] >>>'
go

CREATE VIEW dbo.[Current Product List] AS
    SELECT
        Product_List.ProductID,
        Product_List.ProductName
    FROM Products AS Product_List
    WHERE (((Product_List.Discontinued) = 0))--ORDER BY Product_List.ProductName

go

IF OBJECT_ID (N'dbo.[Current Product List]') IS NOT NULL
    PRINT N'<<< CREATED VIEW dbo.[Current Product List] >>>'
ELSE
    PRINT N'<<< FAILED CREATING VIEW dbo.[Current Product List] >>>'
go

CREATE VIEW dbo.Big_Products AS
    SELECT
        productid ProductId,
        productname Product_Name,
        supplierid,
        categoryid,
        quantityperunit
    FROM products
    UNION ALL
        SELECT
            productid + 100 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 200 ProductId,
            productname + ' 2' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 300 ProductId,
            productname + ' 3' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 400 ProductId,
            productname + ' 4' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 500 ProductId,
            productname + ' 5' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 600 ProductId,
            productname + ' 6' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 700 ProductId,
            productname + ' 7' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 800 ProductId,
            productname + ' 8' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 900 ProductId,
            productname + ' 9' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1000 ProductId,
            productname + ' 10' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1100 ProductId,
            productname + ' 11' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1200 ProductId,
            productname + ' 12' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1300 ProductId,
            productname + ' 13' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1400 ProductId,
            productname + ' 14' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1500 ProductId,
            productname + ' 15' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1600 ProductId,
            productname + ' 16' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1700 ProductId,
            productname + ' 17' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1800 ProductId,
            productname + ' 18' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 1900 ProductId,
            productname + ' 19' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2000 ProductId,
            productname + ' 20' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2100 ProductId,
            productname + ' 21' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2200 ProductId,
            productname + ' 22' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2300 ProductId,
            productname + ' 23' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2400 ProductId,
            productname + ' 24' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2500 ProductId,
            productname + ' 25' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2600 ProductId,
            productname + ' 26' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2700 ProductId,
            productname + ' 27' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2800 ProductId,
            productname + ' 28' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 2900 ProductId,
            productname + ' 29' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3000 ProductId,
            productname + ' 30' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3100 ProductId,
            productname + ' 31' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3200 ProductId,
            productname + ' 32' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3300 ProductId,
            productname + ' 33' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3400 ProductId,
            productname + ' 34' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3500 ProductId,
            productname + ' 35' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3600 ProductId,
            productname + ' 36' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3700 ProductId,
            productname + ' 37' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3800 ProductId,
            productname + ' 38' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 3900 ProductId,
            productname + ' 39' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4000 ProductId,
            productname + ' 40' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4100 ProductId,
            productname + ' 41' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4200 ProductId,
            productname + ' 42' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4300 ProductId,
            productname + ' 43' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4400 ProductId,
            productname + ' 44' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4500 ProductId,
            productname + ' 45' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4600 ProductId,
            productname + ' 46' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4700 ProductId,
            productname + ' 47' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4800 ProductId,
            productname + ' 48' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 4900 ProductId,
            productname + ' 49' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5000 ProductId,
            productname + ' 50' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5100 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5200 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5300 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5400 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5500 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5600 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5700 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5800 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 5900 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6000 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6100 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6200 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6300 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6400 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6500 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6600 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6700 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6800 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 6900 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7000 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7100 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7200 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7300 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7400 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7500 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7600 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7700 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7800 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 7900 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8000 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8100 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8200 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8300 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8400 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8500 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8600 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8700 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8800 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8900 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8000 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8100 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8200 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8300 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8400 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8500 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8600 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8700 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8800 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 8900 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9000 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9100 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9200 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9300 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9400 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9500 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9600 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9700 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9800 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
    UNION ALL
        SELECT
            productid + 9900 ProductId,
            productname + ' 1' Product_Name,
            supplierid,
            categoryid,
            quantityperunit
        FROM products
go

IF OBJECT_ID (N'dbo.Big_Products') IS NOT NULL
    PRINT N'<<< CREATED VIEW dbo.Big_Products >>>'
ELSE
    PRINT N'<<< FAILED CREATING VIEW dbo.Big_Products >>>'
go

ALTER TABLE dbo.Products WITH NOCHECK ADD CONSTRAINT FK_Products_Suppliers FOREIGN KEY (SupplierID) REFERENCES dbo.Suppliers (SupplierID
            )
go

GRANT
    EXECUTE
    ON dbo.CustOrdersDetail TO
    PUBLIC
go

GRANT
    EXECUTE
    ON dbo.[Ten Most Expensive Products] TO
    PUBLIC
go

GRANT
    DELETE
    ON dbo.[Alphabetical list of products] TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.[Alphabetical list of products] TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.[Alphabetical list of products] TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.[Alphabetical list of products] TO
    PUBLIC
go

GRANT
    DELETE
    ON dbo.[Current Product List] TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.[Current Product List] TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.[Current Product List] TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.[Current Product List] TO
    PUBLIC
go

GRANT
    DELETE
    ON dbo.[Order Details Extended] TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.[Order Details Extended] TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.[Order Details Extended] TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.[Order Details Extended] TO
    PUBLIC
go

GRANT
    DELETE
    ON dbo.[Products Above Average Price] TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.[Products Above Average Price] TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.[Products Above Average Price] TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.[Products Above Average Price] TO
    PUBLIC
go

GRANT
    DELETE
    ON dbo.[Products by Category] TO
    PUBLIC
go

GRANT
    INSERT
    ON dbo.[Products by Category] TO
    PUBLIC
go

GRANT
    SELECT
    ON dbo.[Products by Category] TO
    PUBLIC
go

GRANT
    UPDATE
    ON dbo.[Products by Category] TO
    PUBLIC
go

