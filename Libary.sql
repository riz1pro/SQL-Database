CREATE DATABASE LibraryDatabase;
GO

-- Use the created database
USE LibraryDatabase;
GO

-- Create Schema
CREATE SCHEMA LibrarySchema;
GO

-- Create Tables
CREATE TABLE LibrarySchema.LIBRARY_BRANCH (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName NVARCHAR(100),
    BranchAddress NVARCHAR(255)
    
);

CREATE TABLE LibrarySchema.BOOK_COPIES (
    CopyID INT PRIMARY KEY IDENTITY(1,1),
    Number_of_Copies INT,
    BookID INT,
    BranchID INT,
    FOREIGN KEY (BookID) REFERENCES LibrarySchema.BOOKS(BookID),
    FOREIGN KEY (BranchID) REFERENCES LibrarySchema.LIBRARY_BRANCH(BranchID)
);


CREATE TABLE LibrarySchema.BOOKS (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255),
    PublisherName NVARCHAR(100),
   
);


CREATE TABLE LibrarySchema.BOOK_AUTHORS (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    AuthorName VARCHAR(100),
    BookID INT, -- Foreign key column referencing BOOKS table
    FOREIGN KEY (BookID) REFERENCES LibrarySchema.BOOKS(BookID)
);


CREATE TABLE LibrarySchema.BORROWER (
    CardNo INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Address NVARCHAR(255),
    Phone NVARCHAR(20)
);

CREATE TABLE LibrarySchema.BOOK_LOANS (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT,
    BranchID INT,
    CardNo INT,
    DateOut DATE,
    DateDue DATE,
    FOREIGN KEY (BookID) REFERENCES LibrarySchema.BOOKS(BookID),
    FOREIGN KEY (BranchID) REFERENCES LibrarySchema.LIBRARY_BRANCH(BranchID),
    FOREIGN KEY (CardNo) REFERENCES LibrarySchema.BORROWER(CardNo)
);

CREATE TABLE LibrarySchema.PUBLISHER (
    PublisherID INT PRIMARY KEY IDENTITY(1,1),
    PublisherName NVARCHAR(100),
    Address NVARCHAR(255),
    Phone NVARCHAR(20)
);









SET IDENTITY_INSERT LibrarySchema.LIBRARY_BRANCH ON;

INSERT INTO LibrarySchema.LIBRARY_BRANCH (  BranchName, BranchAddress)
VALUES
    ('SInfin Branch', 'Dublin'),
    ('Derby Branch', 'England'),
    ('Stenson Branch', 'Leeds'),
    ('Coalville Branch', 'Birmingham'),
    ('Lutterworth Branch', 'Manchester'),
    ('Sharpstown Branch', 'London');


   


    INSERT INTO LibrarySchema.BOOK_COPIES (BookID, BranchID, Number_of_Copies)
VALUES
    (1, 1, 95),  
    (2, 2, 25),  
    (3, 3, 55),  
    (4, 4, 41),  
    (5, 5, 54),  
    (6, 6, 62),  
    (7, 7, 13),  
    (8, 8, 24),  
    (9, 9, 32),  
    (10, 10, 42);  




INSERT INTO LibrarySchema.BOOKS (Title, PublisherName)
VALUES
    ('To Kill a Mockingbird', 'HarperCollins'),
    ('1984', 'Penguin Random House'),
    ('The Great Gatsby', 'Simon & Schuster'),
    ('Pride and Prejudice', 'Oxford University Press'),
    ('The Catcher in the Rye', 'Hachette Livre'),
    ('One Hundred Years of Solitude', 'Pan Macmillan'),
    ('Brave New World', 'Faber Independent Alliance'),
    ('The Hobbit', 'Pearson Education'),
    ('The Lord of the Rings', 'John Wiley & Sons'),
    ('Moby-Dick', 'Bloomsbury, A&C Black'),
    ('Wuthering Heights', 'Hachette Livre'),
    ('Jane Eyre', 'Penguin Random House'),
    ('The Odyssey', 'Oxford University Press'),
    ('Frankenstein', 'Simon & Schuster'),
    ('Dracula', 'Pearson Education'),
    ('The Jungle Book', 'Pan Macmillan'),
    ('Alice in Wonderland', 'Faber Independent Alliance'),
    ('Crime and Punishment', 'John Wiley & Sons'),
    ('The Picture of Dorian Gray', 'Bloomsbury, A&C Black'),
    ('The War of the Worlds', 'HarperCollins');


    INSERT INTO LibrarySchema.BOOK_AUTHORS (AuthorName)
VALUES
    ('Nora Ephron'),
    ('Alain Mabanckou'),
    ('Stieg Larsson'),
    ('JK Rowling'),
    ('Hanya Yanagihara'),
    ('Bob Dylan'),
    ('Malcolm Gladwell'),
    ('Nicola Barker'),
    ('Helen Dunmore'),
    ('M John Harrison');


INSERT INTO LibrarySchema.BORROWER (Name, Address, Phone)
VALUES
    ('Tim', '14 Colts Foot', '123-456-7890'),
    ('Asif', '17 Cloverdale', '123-456-7891'),
    ('Kaz', '220 Elm Street', '123-456-7892'),
    ('Kiran', '45 Rger Street', '123-456-7893'),
    ('Mel', '52 Fleet Street', '123-456-7894'),
    ('Steff', '23 Sydney Road', '123-456-7895'),
    ('Paul', '1 Leeds Drive', '123-456-7896'),
    ('Steve', '99 Jannah Way', '123-456-7897');






INSERT INTO LibrarySchema.BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
    (1, 1, 1, '2023-01-01', '2023-01-15'),  
    (2, 2, 2, '2023-02-01', '2023-02-15'),  
    (3, 3, 3, '2023-03-01', '2023-03-15'), 
    (4, 4, 4, '2023-04-01', '2023-04-15'),  
    (5, 5, 5, '2023-05-01', '2023-05-15'),  
    (6, 6, 6, '2023-06-01', '2023-06-15'),  
    (7, 7, 7, '2023-10-01', '2023-10-15'),  
    (8, 8, 8, '2023-12-03', '2023-02-17'),  
    (9, 9, 9, '2023-08-18', '2023-05-18'),  
    (10, 10, 10, '2023-07-15', '2023-08-19'); 





INSERT INTO LibrarySchema.PUBLISHER (PublisherName, Address, Phone)
VALUES
    ('Penguin Random House', 'Penguin Building', '223-456-7890'),
    ('Hachette Livre', 'Haven Building', '223-456-7891'),
    ('HarperCollins', 'Collings Street', '323-456-7892'),
    ('Pan Macmillan', 'Pan Road', '523-456-7893'),
    ('Pearson Education', 'Education Building', '523-456-7894'),
    ('Oxford University Press', 'Press Road', '023-456-7895'),
    ('Bloomsbury, A&C Black', 'Black Building', '523-456-7896'),
    ('Simon & Schuster', 'Sim City', '523-456-7897'),
    ('John Wiley & Sons', 'Sons Building', '123-456-7898'),
    ('Faber Independent Alliance', 'Faber Street', '823-456-7899');




    









-- Assuming BookID references BOOKS table
ALTER TABLE LibrarySchema.BOOK_COPIES
ADD CONSTRAINT fk_book_copies_bookID
FOREIGN KEY (BookID)
REFERENCES LibrarySchema.BOOKS(BookID)
ON DELETE CASCADE;  -- or ON DELETE SET NULL, depending on your requirements





-- Assuming BranchID references LIBRARY_BRANCH table
ALTER TABLE LibrarySchema.BOOK_COPIES
ADD CONSTRAINT fk_book_copies_branchID
FOREIGN KEY (BranchID)
REFERENCES LibrarySchema.LIBRARY_BRANCH(BranchID)
ON DELETE CASCADE;  -- or ON DELETE SET NULL, depending on your requirements




-- Adding FOREIGN KEY constraints for BookID and BranchID
ALTER TABLE LibrarySchema.BOOK_LOANS
ADD CONSTRAINT FK_BookID
FOREIGN KEY (BookID)
REFERENCES LibrarySchema.BOOKS(BookID);

ALTER TABLE LibrarySchema.BOOK_LOANS
ADD CONSTRAINT FK_BranchID
FOREIGN KEY (BranchID)
REFERENCES LibrarySchema.LIBRARY_BRANCH(BranchID);












  


SELECT BranchID, BranchName, BranchAddress
FROM LibrarySchema. LIBRARY_BRANCH; 


