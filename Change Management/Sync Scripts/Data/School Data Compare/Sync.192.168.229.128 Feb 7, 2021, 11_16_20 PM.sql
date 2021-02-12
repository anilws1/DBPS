--------------------------------------------------------------------------------
-- IDERA DB Change Manager Synchronization Script
-- FILE                : Sync.192.168.229.128 Feb 7, 2021, 11_16_20 PM.sql
-- DATE                : Feb 7, 2021, 11:16:20 PM
-- 
-- SOURCE DATA SOURCE  : localhost
-- TARGET DATA SOURCE  : 192.168.229.128
--------------------------------------------------------------------------------
SET XACT_ABORT ON

BEGIN TRANSACTION


USE School 
go
ALTER TABLE dbo.Course
    DROP CONSTRAINT FK_Course_Department
go
ALTER TABLE dbo.CourseInstructor
    DROP CONSTRAINT FK_CourseInstructor_Course
go
ALTER TABLE dbo.CourseInstructor
    DROP CONSTRAINT FK_CourseInstructor_Person
go
ALTER TABLE dbo.OfficeAssignment
    DROP CONSTRAINT FK_OfficeAssignment_Person
go
ALTER TABLE dbo.OnlineCourse
    DROP CONSTRAINT FK_OnlineCourse_Course
go
ALTER TABLE dbo.OnsiteCourse
    DROP CONSTRAINT FK_OnsiteCourse_Course
go
ALTER TABLE dbo.StudentGrade
    DROP CONSTRAINT FK_StudentGrade_Course
go
ALTER TABLE dbo.StudentGrade
    DROP CONSTRAINT FK_StudentGrade_Student
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 1045, 'Calculus', 4, 7 ) 
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 1050, 'Chemistry', 4, 1 ) 
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 1061, 'Physics', 4, 1 ) 
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 2021, 'Composition', 3, 2 ) 
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 2030, 'Poetry', 2, 2 ) 
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 2042, 'Literature', 4, 2 ) 
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 3141, 'Trigonometry', 4, 7 ) 
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 4022, 'Microeconomics', 3, 4 ) 
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 4041, 'Macroeconomics', 3, 4 ) 
go
INSERT INTO dbo.Course ( CourseID, Title, Credits, DepartmentID ) VALUES( 4061, 'Quantitative', 2, 4 ) 
go
INSERT INTO dbo.CourseInstructor ( CourseID, PersonID ) VALUES( 1045, 5 ) 
go
INSERT INTO dbo.CourseInstructor ( CourseID, PersonID ) VALUES( 1050, 1 ) 
go
INSERT INTO dbo.CourseInstructor ( CourseID, PersonID ) VALUES( 1061, 31 ) 
go
INSERT INTO dbo.CourseInstructor ( CourseID, PersonID ) VALUES( 2021, 27 ) 
go
INSERT INTO dbo.CourseInstructor ( CourseID, PersonID ) VALUES( 2030, 4 ) 
go
INSERT INTO dbo.CourseInstructor ( CourseID, PersonID ) VALUES( 2042, 25 ) 
go
INSERT INTO dbo.CourseInstructor ( CourseID, PersonID ) VALUES( 4022, 18 ) 
go
INSERT INTO dbo.CourseInstructor ( CourseID, PersonID ) VALUES( 4041, 32 ) 
go
INSERT INTO dbo.CourseInstructor ( CourseID, PersonID ) VALUES( 4061, 34 ) 
go
INSERT INTO dbo.Department ( DepartmentID, Name, Budget, StartDate, Administrator ) VALUES( 1, 'Engineering', 350000.0000, '2007-09-01 00:00:00.0', 2 ) 
go
INSERT INTO dbo.Department ( DepartmentID, Name, Budget, StartDate, Administrator ) VALUES( 2, 'English', 120000.0000, '2007-09-01 00:00:00.0', 6 ) 
go
INSERT INTO dbo.Department ( DepartmentID, Name, Budget, StartDate, Administrator ) VALUES( 4, 'Economics', 200000.0000, '2007-09-01 00:00:00.0', 4 ) 
go
INSERT INTO dbo.Department ( DepartmentID, Name, Budget, StartDate, Administrator ) VALUES( 7, 'Mathematics', 250000.0000, '2007-09-01 00:00:00.0', 3 ) 
go
--The following columns were excluded due to unsupported datatypes: [Timestamp]
INSERT INTO dbo.OfficeAssignment ( InstructorID, Location ) VALUES( 1, '17 Smith' ) 
go
--The following columns were excluded due to unsupported datatypes: [Timestamp]
INSERT INTO dbo.OfficeAssignment ( InstructorID, Location ) VALUES( 4, '29 Adams' ) 
go
--The following columns were excluded due to unsupported datatypes: [Timestamp]
INSERT INTO dbo.OfficeAssignment ( InstructorID, Location ) VALUES( 5, '37 Williams' ) 
go
--The following columns were excluded due to unsupported datatypes: [Timestamp]
INSERT INTO dbo.OfficeAssignment ( InstructorID, Location ) VALUES( 18, '143 Smith' ) 
go
--The following columns were excluded due to unsupported datatypes: [Timestamp]
INSERT INTO dbo.OfficeAssignment ( InstructorID, Location ) VALUES( 25, '57 Adams' ) 
go
--The following columns were excluded due to unsupported datatypes: [Timestamp]
INSERT INTO dbo.OfficeAssignment ( InstructorID, Location ) VALUES( 27, '271 Williams' ) 
go
--The following columns were excluded due to unsupported datatypes: [Timestamp]
INSERT INTO dbo.OfficeAssignment ( InstructorID, Location ) VALUES( 31, '131 Smith' ) 
go
--The following columns were excluded due to unsupported datatypes: [Timestamp]
INSERT INTO dbo.OfficeAssignment ( InstructorID, Location ) VALUES( 32, '203 Williams' ) 
go
--The following columns were excluded due to unsupported datatypes: [Timestamp]
INSERT INTO dbo.OfficeAssignment ( InstructorID, Location ) VALUES( 34, '213 Smith' ) 
go
INSERT INTO dbo.OnlineCourse ( CourseID, URL ) VALUES( 2021, 'http://www.fineartschool.net/Composition' ) 
go
INSERT INTO dbo.OnlineCourse ( CourseID, URL ) VALUES( 2030, 'http://www.fineartschool.net/Poetry' ) 
go
INSERT INTO dbo.OnlineCourse ( CourseID, URL ) VALUES( 3141, 'http://www.fineartschool.net/Trigonometry' ) 
go
INSERT INTO dbo.OnlineCourse ( CourseID, URL ) VALUES( 4041, 'http://www.fineartschool.net/Macroeconomics' ) 
go
INSERT INTO dbo.OnsiteCourse ( CourseID, Location, Days, [Time] ) VALUES( 1045, '121 Smith', 'MWHF', '1900-01-01 15:30:00.0' ) 
go
INSERT INTO dbo.OnsiteCourse ( CourseID, Location, Days, [Time] ) VALUES( 1050, '123 Smith', 'MTWH', '1900-01-01 11:30:00.0' ) 
go
INSERT INTO dbo.OnsiteCourse ( CourseID, Location, Days, [Time] ) VALUES( 1061, '234 Smith', 'TWHF', '1900-01-01 13:15:00.0' ) 
go
INSERT INTO dbo.OnsiteCourse ( CourseID, Location, Days, [Time] ) VALUES( 2042, '225 Adams', 'MTWH', '1900-01-01 11:00:00.0' ) 
go
INSERT INTO dbo.OnsiteCourse ( CourseID, Location, Days, [Time] ) VALUES( 4022, '23 Williams', 'MWF', '1900-01-01 09:00:00.0' ) 
go
INSERT INTO dbo.OnsiteCourse ( CourseID, Location, Days, [Time] ) VALUES( 4061, '22 Williams', 'TH', '1900-01-01 11:15:00.0' ) 
go
SET IDENTITY_INSERT dbo.Person ON
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 1, 'Abercrombie', 'Kim', '1995-03-11 00:00:00.0', NULL, 'Instructor' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 2, 'Barzdukas', 'Gytis', NULL, '2005-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 3, 'Justice', 'Peggy', NULL, '2001-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 4, 'Fakhouri', 'Fadi', '2002-08-06 00:00:00.0', NULL, 'Instructor' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 5, 'Harui', 'Roger', '1998-07-01 00:00:00.0', NULL, 'Instructor' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 6, 'Li', 'Yan', NULL, '2002-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 7, 'Norman', 'Laura', NULL, '2003-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 8, 'Olivotto', 'Nino', NULL, '2005-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 9, 'Tang', 'Wayne', NULL, '2005-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 10, 'Alonso', 'Meredith', NULL, '2002-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 11, 'Lopez', 'Sophia', NULL, '2004-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 12, 'Browning', 'Meredith', NULL, '2000-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 13, 'Anand', 'Arturo', NULL, '2003-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 14, 'Walker', 'Alexandra', NULL, '2000-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 15, 'Powell', 'Carson', NULL, '2004-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 16, 'Jai', 'Damien', NULL, '2001-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 17, 'Carlson', 'Robyn', NULL, '2005-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 18, 'Zheng', 'Roger', '2004-02-12 00:00:00.0', NULL, 'Instructor' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 19, 'Bryant', 'Carson', NULL, '2001-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 20, 'Suarez', 'Robyn', NULL, '2004-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 21, 'Holt', 'Roger', NULL, '2004-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 22, 'Alexander', 'Carson', NULL, '2005-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 23, 'Morgan', 'Isaiah', NULL, '2001-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 24, 'Martin', 'Randall', NULL, '2005-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 25, 'Kapoor', 'Candace', '2001-01-15 00:00:00.0', NULL, 'Instructor' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 26, 'Rogers', 'Cody', NULL, '2002-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 27, 'Serrano', 'Stacy', '1999-06-01 00:00:00.0', NULL, 'Instructor' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 28, 'White', 'Anthony', NULL, '2001-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 29, 'Griffin', 'Rachel', NULL, '2004-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 30, 'Shan', 'Alicia', NULL, '2003-09-01 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 31, 'Stewart', 'Jasmine', '1997-10-12 00:00:00.0', NULL, 'Instructor' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 32, 'Xu', 'Kristen', '2001-07-23 00:00:00.0', NULL, 'Instructor' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 33, 'Gao', 'Erica', NULL, '2003-01-30 00:00:00.0', 'Student' ) 
go
INSERT INTO dbo.Person ( PersonID, LastName, FirstName, HireDate, EnrollmentDate, Discriminator ) VALUES( 34, 'Van Houten', 'Roger', '2000-12-07 00:00:00.0', NULL, 'Instructor' ) 
go
SET IDENTITY_INSERT dbo.Person OFF
go
SET IDENTITY_INSERT dbo.StudentGrade ON
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 1, 2021, 2, 4.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 2, 2030, 2, 3.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 3, 2021, 3, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 4, 2030, 3, 4.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 5, 2021, 6, 2.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 6, 2042, 6, 3.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 7, 2021, 7, 3.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 8, 2042, 7, 4.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 9, 2021, 8, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 10, 2042, 8, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 11, 4041, 9, 3.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 12, 4041, 10, NULL ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 13, 4041, 11, 2.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 14, 4041, 12, NULL ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 15, 4061, 12, NULL ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 16, 4022, 14, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 17, 4022, 13, 4.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 18, 4061, 13, 4.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 19, 4041, 14, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 20, 4022, 15, 2.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 21, 4022, 16, 2.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 22, 4022, 17, NULL ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 23, 4022, 19, 3.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 24, 4061, 20, 4.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 25, 4061, 21, 2.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 26, 4022, 22, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 27, 4041, 22, 3.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 28, 4061, 22, 2.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 29, 4022, 23, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 30, 1045, 23, 1.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 31, 1061, 24, 4.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 32, 1061, 25, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 33, 1050, 26, 3.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 34, 1061, 26, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 35, 1061, 27, 3.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 36, 1045, 28, 2.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 37, 1050, 28, 3.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 38, 1061, 29, 4.00 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 39, 1050, 30, 3.50 ) 
go
INSERT INTO dbo.StudentGrade ( EnrollmentID, CourseID, StudentID, Grade ) VALUES( 40, 1061, 30, 4.00 ) 
go
SET IDENTITY_INSERT dbo.StudentGrade OFF
go
ALTER TABLE dbo.Course
    ADD CONSTRAINT FK_Course_Department
    FOREIGN KEY (DepartmentID)
    REFERENCES dbo.Department (DepartmentID)
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
ALTER TABLE dbo.OfficeAssignment
    ADD CONSTRAINT FK_OfficeAssignment_Person
    FOREIGN KEY (InstructorID)
    REFERENCES dbo.Person (PersonID)
go
ALTER TABLE dbo.OnlineCourse
    ADD CONSTRAINT FK_OnlineCourse_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
go
ALTER TABLE dbo.OnsiteCourse
    ADD CONSTRAINT FK_OnsiteCourse_Course
    FOREIGN KEY (CourseID)
    REFERENCES dbo.Course (CourseID)
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
IF @@TRANCOUNT > 0
	COMMIT TRANSACTION
ELSE
	print'Transaction was rolled back due to an error'
