CREATE DATABASE School;

USE School;


CREATE TABLE Classes (
    Class_ID INT PRIMARY KEY,
    Class_Name VARCHAR(255)
);


CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(255),
    Class_ID INT NULL,
    Instructor_ID INT NULL,
    FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructors(Instructor_ID)
);

CREATE TABLE Instructors (
    Instructor_ID INT PRIMARY KEY,
    Instructor_Name VARCHAR(255)
);

INSERT INTO Classes (Class_ID, Class_Name)
VALUES
    (1, 'Software Developer Boot Camp'),
    (2, 'C# Boot Camp');

-- Insert data into the "Students" table
INSERT INTO Students (Student_ID, Student_Name)
VALUES
    (1, 'Amir'),
    (2, 'Carly'),
    (3, 'Paul'),
    (4, 'Carlos'),
    (5, 'Aisha'),
    (6, 'Kim');

INSERT INTO Instructors (Instructor_ID, Instructor_Name)
VALUES
    (1, 'Elesha'),
    (2, 'Jake');



UPDATE Students
SET Class_ID = 1
WHERE Student_ID <= 3;

UPDATE Students
SET Class_ID = 2
WHERE Student_ID > 3;

UPDATE Students
SET Instructor_ID = 1
WHERE Student_ID <= 3;

UPDATE Students
SET Instructor_ID = 2
WHERE Student_ID > 3;



SELECT Instructor_Name
FROM Instructors;


SELECT Student_Name
FROM Students
ORDER BY Student_Name;


SELECT
    c.Class_Name,
    s.Student_Name,
    i.Instructor_Name
FROM Classes c
JOIN Students s ON c.Class_ID = s.Class_ID
JOIN Instructors i ON s.Instructor_ID = i.Instructor_ID;

