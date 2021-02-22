--------------------------------------------------------------------------------
-- IDERA DB Change Manager Synchronization Script
-- FILE                : School Project (School) Feb 12, 2021, 1_58_33 PM.sql
-- DATE                : Feb 12, 2021, 1:58:34 PM
-- 
-- SOURCE DATA SOURCE  : localhost

--Made by Anil
--------------------------------------------------------------------------------
USE School
go
CREATE TABLE dbo.Department
(
    DepartmentID  int          NOT NULL,
    Name          nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Budget        money        NOT NULL,
    StartDate     datetime     NOT NULL,
    Administrator int          NULL,
    CONSTRAINT PK_Department
    PRIMARY KEY CLUSTERED (DepartmentID)
)
go
IF OBJECT_ID(N'dbo.Department') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Department >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Department >>>'
go
CREATE TABLE dbo.Course
(
    CourseID     int           NOT NULL,
    Title        nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Credits      int           NOT NULL,
    DepartmentID int           NOT NULL,
    CONSTRAINT [PK_School.Course]
    PRIMARY KEY CLUSTERED (CourseID)
)
go
IF OBJECT_ID(N'dbo.Course') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Course >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Course >>>'
go
CREATE TABLE dbo.Person
(
    PersonID       int          IDENTITY,
    LastName       nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    FirstName      nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    HireDate       datetime     NULL,
    EnrollmentDate datetime     NULL,
    Discriminator  nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_School.Student]
    PRIMARY KEY CLUSTERED (PersonID)
)
go
IF OBJECT_ID(N'dbo.Person') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Person >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Person >>>'
go
CREATE TABLE dbo.OfficeAssignment
(
    InstructorID int          NOT NULL,
    Location     nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [Timestamp]  timestamp    NOT NULL,
    CONSTRAINT PK_OfficeAssignment
    PRIMARY KEY CLUSTERED (InstructorID)
)
go
IF OBJECT_ID(N'dbo.OfficeAssignment') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.OfficeAssignment >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.OfficeAssignment >>>'
go
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
EXEC dbo.sp_addextendedproperty @name=N'microsoft_database_tools_support',@value=N'1',@level0type=N'USER',@level0name=N'dbo',@level1type=N'TABLE',@level1name=N'sysdiagrams'
go
CREATE TABLE dbo.OnsiteCourse
(
    CourseID int           NOT NULL,
    Location nvarchar(50)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Days     nvarchar(50)  COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [Time]   smalldatetime NOT NULL,
    CONSTRAINT PK_OnsiteCourse
    PRIMARY KEY CLUSTERED (CourseID)
)
go
IF OBJECT_ID(N'dbo.OnsiteCourse') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.OnsiteCourse >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.OnsiteCourse >>>'
go
CREATE TABLE dbo.OnlineCourse
(
    CourseID int           NOT NULL,
    URL      nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT PK_OnlineCourse
    PRIMARY KEY CLUSTERED (CourseID)
)
go
IF OBJECT_ID(N'dbo.OnlineCourse') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.OnlineCourse >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.OnlineCourse >>>'
go
CREATE TABLE dbo.StudentGrade
(
    EnrollmentID int          IDENTITY,
    CourseID     int          NOT NULL,
    StudentID    int          NOT NULL,
    Grade        decimal(3,2) NULL,
    CONSTRAINT PK_StudentGrade
    PRIMARY KEY CLUSTERED (EnrollmentID)
)
go
IF OBJECT_ID(N'dbo.StudentGrade') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.StudentGrade >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.StudentGrade >>>'
go
CREATE TABLE dbo.CourseInstructor
(
    CourseID int NOT NULL,
    PersonID int NOT NULL,
    CONSTRAINT PK_CourseInstructor
    PRIMARY KEY CLUSTERED (CourseID,PersonID)
)
go
IF OBJECT_ID(N'dbo.CourseInstructor') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.CourseInstructor >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.CourseInstructor >>>'
go
ALTER TABLE dbo.OnsiteCourse
    ADD CONSTRAINT FK_OnsiteCourse_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
go
ALTER TABLE dbo.OnlineCourse
    ADD CONSTRAINT FK_OnlineCourse_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
go
ALTER TABLE dbo.StudentGrade
    ADD CONSTRAINT FK_StudentGrade_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
go
ALTER TABLE dbo.CourseInstructor
    ADD CONSTRAINT FK_CourseInstructor_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
go
ALTER TABLE dbo.Course
    ADD CONSTRAINT FK_Course_Department
    FOREIGN KEY (DepartmentID)
    REFERENCES dbo.Department (DepartmentID)
go
ALTER TABLE dbo.CourseInstructor
    ADD CONSTRAINT FK_CourseInstructor_Person
    FOREIGN KEY (PersonID)
    REFERENCES dbo.Person (PersonID)
go
ALTER TABLE dbo.OfficeAssignment
    ADD CONSTRAINT FK_OfficeAssignment_Person
    FOREIGN KEY (InstructorID)
    REFERENCES dbo.Person (PersonID)
go
ALTER TABLE dbo.StudentGrade
    ADD CONSTRAINT FK_StudentGrade_Student
    FOREIGN KEY (StudentID)
    REFERENCES dbo.Person (PersonID)
go
