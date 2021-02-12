--------------------------------------------------------------------------------
-- IDERA DB Change Manager Synchronization Script
-- FILE                : Sync.192.168.229.128 Feb 7, 2021, 11_11_11 PM
-- DATE                : Feb 7, 2021, 11:11:11 PM
-- 
-- SOURCE DATA SOURCE  : localhost
-- TARGET DATA SOURCE  : 192.168.229.128
--------------------------------------------------------------------------------

USE School
go



CREATE TABLE dbo.Department
(
    DepartmentID  int          NOT NULL,
    Name          nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Budget        money        NOT NULL,
    StartDate     datetime     NOT NULL,
    Administrator int          NULL
)

go

IF OBJECT_ID(N'dbo.Department') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Department >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Department >>>'

go

CREATE TABLE dbo.Person
(
    PersonID       int          IDENTITY,
    LastName       nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    FirstName      nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    HireDate       datetime     NULL,
    EnrollmentDate datetime     NULL,
    Discriminator  nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)

go

IF OBJECT_ID(N'dbo.Person') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Person >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Person >>>'

go

ALTER TABLE dbo.sysdiagrams
    ADD CONSTRAINT PK__sysdiagr__C2B05B61388FA6E4
    PRIMARY KEY CLUSTERED (diagram_id)

go

ALTER TABLE dbo.sysdiagrams
    ADD CONSTRAINT UK_principal_name
    UNIQUE NONCLUSTERED (principal_id,name)

go

CREATE TABLE dbo.Course
(
    CourseID     int           NOT NULL,
    Title        nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Credits      int           NOT NULL,
    DepartmentID int           NOT NULL
)

go

IF OBJECT_ID(N'dbo.Course') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Course >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Course >>>'

go

ALTER TABLE dbo.Department
    ADD CONSTRAINT PK_Department
    PRIMARY KEY CLUSTERED (DepartmentID)

go

SET ANSI_NULLS ON

go

SET QUOTED_IDENTIFIER ON

go


CREATE PROCEDURE dbo.GetDepartmentName
@ID int,
@Name nvarchar(50) OUTPUT
AS
SELECT @Name = Name FROM Department
WHERE DepartmentID = @ID


go

IF OBJECT_ID(N'dbo.GetDepartmentName') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.GetDepartmentName >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.GetDepartmentName >>>'

go

CREATE TABLE dbo.OfficeAssignment
(
    InstructorID int          NOT NULL,
    Location     nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [Timestamp]  timestamp    NOT NULL
)

go

IF OBJECT_ID(N'dbo.OfficeAssignment') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.OfficeAssignment >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.OfficeAssignment >>>'

go

ALTER TABLE dbo.Person
    ADD CONSTRAINT [PK_School.Student]
    PRIMARY KEY CLUSTERED (PersonID)

go

SET ANSI_NULLS ON

go

SET QUOTED_IDENTIFIER ON

go


CREATE PROCEDURE dbo.DeletePerson
@PersonID int
AS
DELETE FROM Person WHERE PersonID = @PersonID;


go

IF OBJECT_ID(N'dbo.DeletePerson') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.DeletePerson >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.DeletePerson >>>'

go

SET ANSI_NULLS ON

go

SET QUOTED_IDENTIFIER ON

go


CREATE PROCEDURE dbo.InsertPerson
@LastName nvarchar(50),
@FirstName nvarchar(50),
@HireDate datetime,
@EnrollmentDate datetime,
@Discriminator nvarchar(50)
AS
INSERT INTO dbo.Person (LastName,
FirstName,
HireDate,
EnrollmentDate,
Discriminator)
VALUES (@LastName,
@FirstName,
@HireDate,
@EnrollmentDate,
@Discriminator);
SELECT SCOPE_IDENTITY() as NewPersonID;


go

IF OBJECT_ID(N'dbo.InsertPerson') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.InsertPerson >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.InsertPerson >>>'

go

SET ANSI_NULLS ON

go

SET QUOTED_IDENTIFIER ON

go


CREATE PROCEDURE dbo.UpdatePerson
@PersonID int,
@LastName nvarchar(50),
@FirstName nvarchar(50),
@HireDate datetime,
@EnrollmentDate datetime,
@Discriminator nvarchar(50)
AS
UPDATE Person SET LastName=@LastName,
FirstName=@FirstName,
HireDate=@HireDate,
EnrollmentDate=@EnrollmentDate,
Discriminator=@Discriminator
WHERE PersonID=@PersonID;


go

IF OBJECT_ID(N'dbo.UpdatePerson') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.UpdatePerson >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.UpdatePerson >>>'

go

CREATE TABLE dbo.CourseInstructor
(
    CourseID int NOT NULL,
    PersonID int NOT NULL
)

go

IF OBJECT_ID(N'dbo.CourseInstructor') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.CourseInstructor >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.CourseInstructor >>>'

go

CREATE TABLE dbo.OnlineCourse
(
    CourseID int           NOT NULL,
    URL      nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)

go

IF OBJECT_ID(N'dbo.OnlineCourse') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.OnlineCourse >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.OnlineCourse >>>'

go

CREATE TABLE dbo.OnsiteCourse
(
    CourseID int           NOT NULL,
    Location nvarchar(50)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Days     nvarchar(50)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [Time]   smalldatetime NOT NULL
)

go

IF OBJECT_ID(N'dbo.OnsiteCourse') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.OnsiteCourse >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.OnsiteCourse >>>'

go

CREATE TABLE dbo.StudentGrade
(
    EnrollmentID int          IDENTITY,
    CourseID     int          NOT NULL,
    StudentID    int          NOT NULL,
    Grade        decimal(3,2) NULL
)

go

IF OBJECT_ID(N'dbo.StudentGrade') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.StudentGrade >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.StudentGrade >>>'

go

ALTER TABLE dbo.Course
    ADD CONSTRAINT [PK_School.Course]
    PRIMARY KEY CLUSTERED (CourseID)

go

ALTER TABLE dbo.Course
    ADD CONSTRAINT FK_Course_Department
    FOREIGN KEY (DepartmentID)
    REFERENCES dbo.Department (DepartmentID)

go

ALTER TABLE dbo.OfficeAssignment
    ADD CONSTRAINT PK_OfficeAssignment
    PRIMARY KEY CLUSTERED (InstructorID)

go

ALTER TABLE dbo.OfficeAssignment
    ADD CONSTRAINT FK_OfficeAssignment_Person
    FOREIGN KEY (InstructorID)
    REFERENCES dbo.Person (PersonID)

go

SET ANSI_NULLS ON

go

SET QUOTED_IDENTIFIER ON

go


CREATE PROCEDURE dbo.DeleteOfficeAssignment
@InstructorID int
AS
DELETE FROM OfficeAssignment
WHERE InstructorID=@InstructorID;


go

IF OBJECT_ID(N'dbo.DeleteOfficeAssignment') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.DeleteOfficeAssignment >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.DeleteOfficeAssignment >>>'

go

SET ANSI_NULLS ON

go

SET QUOTED_IDENTIFIER ON

go


CREATE PROCEDURE dbo.InsertOfficeAssignment
@InstructorID int,
@Location nvarchar(50)
AS
INSERT INTO dbo.OfficeAssignment (InstructorID, Location)
VALUES (@InstructorID, @Location);
IF @@ROWCOUNT > 0
BEGIN
SELECT [Timestamp] FROM OfficeAssignment
WHERE InstructorID=@InstructorID;
END


go

IF OBJECT_ID(N'dbo.InsertOfficeAssignment') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.InsertOfficeAssignment >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.InsertOfficeAssignment >>>'

go

SET ANSI_NULLS ON

go

SET QUOTED_IDENTIFIER ON

go


CREATE PROCEDURE dbo.UpdateOfficeAssignment
@InstructorID int,
@Location nvarchar(50),
@OrigTimestamp timestamp
AS
UPDATE OfficeAssignment SET Location=@Location
WHERE InstructorID=@InstructorID AND [Timestamp]=@OrigTimestamp;
IF @@ROWCOUNT > 0
BEGIN
SELECT [Timestamp] FROM OfficeAssignment
WHERE InstructorID=@InstructorID;
END


go

IF OBJECT_ID(N'dbo.UpdateOfficeAssignment') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.UpdateOfficeAssignment >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.UpdateOfficeAssignment >>>'

go

ALTER TABLE dbo.CourseInstructor
    ADD CONSTRAINT PK_CourseInstructor
    PRIMARY KEY CLUSTERED (CourseID,PersonID)

go

ALTER TABLE dbo.CourseInstructor
    ADD CONSTRAINT FK_CourseInstructor_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)

go

ALTER TABLE dbo.CourseInstructor
    ADD CONSTRAINT FK_CourseInstructor_Person
    FOREIGN KEY (PersonID)
    REFERENCES dbo.Person (PersonID)

go

ALTER TABLE dbo.OnlineCourse
    ADD CONSTRAINT PK_OnlineCourse
    PRIMARY KEY CLUSTERED (CourseID)

go

ALTER TABLE dbo.OnlineCourse
    ADD CONSTRAINT FK_OnlineCourse_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)

go

ALTER TABLE dbo.OnsiteCourse
    ADD CONSTRAINT PK_OnsiteCourse
    PRIMARY KEY CLUSTERED (CourseID)

go

ALTER TABLE dbo.OnsiteCourse
    ADD CONSTRAINT FK_OnsiteCourse_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)

go

ALTER TABLE dbo.StudentGrade
    ADD CONSTRAINT PK_StudentGrade
    PRIMARY KEY CLUSTERED (EnrollmentID)

go

ALTER TABLE dbo.StudentGrade
    ADD CONSTRAINT FK_StudentGrade_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)

go

ALTER TABLE dbo.StudentGrade
    ADD CONSTRAINT FK_StudentGrade_Student
    FOREIGN KEY (StudentID)
    REFERENCES dbo.Person (PersonID)

go

SET ANSI_NULLS ON

go

SET QUOTED_IDENTIFIER ON

go


CREATE PROCEDURE dbo.GetStudentGrades
@StudentID int
AS
SELECT EnrollmentID, Grade, CourseID, StudentID FROM dbo.StudentGrade
WHERE StudentID = @StudentID


go

IF OBJECT_ID(N'dbo.GetStudentGrades') IS NOT NULL
    PRINT N'<<< CREATED PROCEDURE dbo.GetStudentGrades >>>'
ELSE
    PRINT N'<<< FAILED CREATING PROCEDURE dbo.GetStudentGrades >>>'

go

