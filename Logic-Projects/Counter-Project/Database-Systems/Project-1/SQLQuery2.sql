DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Teachers;
DROP TABLE IF EXISTS Classes;
GO

DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Teachers;
DROP TABLE IF EXISTS Classes;
GO

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY IDENTITY(1,1),
    ClassName VARCHAR(50)
);
GO

CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY IDENTITY(1,1),
    TeacherName VARCHAR(100),
    Subject VARCHAR(50)
);
GO

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    StudentName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ClassID INT,
    CONSTRAINT FK_Students_Classes
        FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);
GO

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY IDENTITY(1,1),
    SubjectName VARCHAR(50),
    TeacherID INT,
    CONSTRAINT FK_Subjects_Teachers
        FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
GO

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    SubjectID INT,
    EnrollmentDate DATE,
    CONSTRAINT FK_Enrollments_Students
        FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_Enrollments_Subjects
        FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
GO

CREATE TABLE Grades (
    GradeID INT PRIMARY KEY IDENTITY(1,1),
    EnrollmentID INT,
    Score INT,
    CONSTRAINT FK_Grades_Enrollments
        FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);
GO

INSERT INTO Classes (ClassName)
VALUES 
('Grade 1'),('Grade 2'),('Grade 3');
GO

INSERT INTO Teachers (TeacherName, Subject)
VALUES 
('Mr. Walid', 'Math'),
('Ms. Sara', 'Science'),
('Mr. Hassan', 'English'),
('Ms. Nada', 'Arabic');
GO

INSERT INTO Subjects (SubjectName, TeacherID)
VALUES 
('Mathematics', 1),
('Science', 2),
('English', 3),
('Arabic', 4);
GO

INSERT INTO Students (StudentName, DateOfBirth, Gender, ClassID)
VALUES 
('Ali Hassan', '2012-03-15', 'Male', 1),
('Mona Ali', '2011-07-20', 'Female', 2),
('Omar Khaled', '2012-11-05', 'Male', 1),
('Sara Mohamed', '2011-02-18', 'Female', 2),
('Youssef Adel', '2010-09-30', 'Male', 3);
GO

INSERT INTO Enrollments (StudentID, SubjectID, EnrollmentDate)
VALUES
(1, 1, '2024-09-01'),
(1, 2, '2024-09-01'),
(2, 2, '2024-09-01'),
(3, 3, '2024-09-01'),
(4, 4, '2024-09-01');
GO

INSERT INTO Grades (EnrollmentID, Score)
VALUES
(1, 90),
(2, 85),
(3, 88),
(4, 92),
(5, 80);
GO
select StudentName
from Students
 StudentName;
 select EnrollmentDate
 from Enrollments
  EnrollmentDate;

select 

