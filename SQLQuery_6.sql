-- Create the database
CREATE DATABASE MovieDatabase;
GO

-- Use the created database
USE MovieDatabase;
GO

-- Create the Actors table
CREATE TABLE Actors (
    ActorID INT PRIMARY KEY,
    ActorName VARCHAR(50),
    MovieName VARCHAR(50)
);

-- Create the Directors table
CREATE TABLE Directors (
    DirectorID INT PRIMARY KEY,
    DirectorName VARCHAR(50),
    MovieName VARCHAR(50)
);



-- Insert data into Actors table
INSERT INTO Actors (ActorID, ActorName, MovieName) VALUES
(1, 'Clark Gable', 'Gone_with_the_Wind'),
(2, 'Roberto DeNiro', 'The Godfather'),
(3, 'Meryl Streep', 'The Devil Wears Prada'),
(4, 'Tom Hanks', 'Forrest Gump'),
(5, 'Julia Roberts', 'Pretty Woman');

-- Insert data into Directors table
INSERT INTO Directors (DirectorID, DirectorName, MovieName) VALUES
(1, 'Victor Fleming', 'Gone_with_the_Wind'),
(2, 'Francis Ford Coppola', 'The Godfather'),
(3, 'David Frankel', 'The Devil Wears Prada'),
(4, 'Robert Zemeckis', 'Forrest Gump'),
(5, 'Garry Marshall', 'Pretty Woman');


SELECT Actors.ActorName, Directors.DirectorName, Actors.MovieName
FROM Actors
INNER JOIN Directors ON Actors.MovieName = Directors.MovieName;
