CREATE DATABASE LibraryDB;
USE LibraryDB;
CREATE TABLE Members (
	ID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	[Name] NVARCHAR(40),
	Card_Number CHAR(10)
);
CREATE TABLE Books (
	ID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	Title NVARCHAR(60),
	Author NVARCHAR(60),
	Checked_Out_By INT FOREIGN KEY REFERENCES Members(ID)
);
INSERT INTO Members VALUES
	('Annabelle Aster', '772-93-110'),
	('Boris Berceli', '000-00-000'),
	('Carter Corbin', '282-09-382')
;
INSERT INTO Books VALUES
	('In Search of Lost Time', 'Marcel Proust', 1),
	('Ulysses', 'James Joyce', 1),
	('Don Quixote', 'Miguel de Cervantes', 3),
	('Moby Dick', 'Herman Melville', NULL)
;
UPDATE Members SET Card_Number='357-15-964' WHERE ID=2;
DELETE FROM Members WHERE ID=2;
SELECT * FROM Books ORDER BY Title;
UPDATE Books SET Checked_Out_By=1 WHERE ID=4;
UPDATE Books SET Checked_Out_By=NULL WHERE ID=2;
SELECT [Name], Title FROM Books LEFT JOIN Members ON Checked_Out_By = Members.ID;
SELECT Title FROM Books JOIN Members ON Checked_Out_By = Members.ID WHERE [Name]='Annabelle Aster';
SELECT [Name], Card_Number FROM Books JOIN Members ON Checked_Out_By = Members.ID WHERE Title='Moby Dick';