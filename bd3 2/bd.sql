Use master
Go
Drop Database if exists StudentsTree
Go
Create Database StudentsTree
Go
Use StudentsTree
GO

CREATE TABLE Students (
    ID INT PRIMARY KEY,
    First_Name NVARCHAR(50),
    Last_Name NVARCHAR(50),
    Age INT
) as Node 
GO

CREATE TABLE Cities (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Country NVARCHAR(50)
) as Node
GO

CREATE TABLE Books (
    ID INT PRIMARY KEY,
    Title NVARCHAR(100),
    Author NVARCHAR(100),
    Genre NVARCHAR(50)
) as Node
GO

CREATE TABLE Friends (
    CONSTRAINT EC_Friends 
    Connection (Students To Students) On Delete Cascade
) as Edge;
GO

CREATE TABLE Resides (
   	CONSTRAINT EC_Resides
    Connection (Students To Cities) On Delete Cascade
) as Edge;
GO

CREATE TABLE Recommends_Book (
  	CONSTRAINT EC_Recommends_Book
    Connection (Students To Books) On Delete Cascade
) as Edge;
GO

-- Заполнение таблицы узлов "Студенты"
INSERT INTO Students (ID, First_Name, Last_Name, Age)
VALUES 
(1, 'John', 'Doe', 20),
(2, 'Alice', 'Smith', 21),
(3, 'Michael', 'Johnson', 19),
(4, 'Emily', 'Brown', 22),
(5, 'James', 'Wilson', 20),
(6, 'Sophia', 'Miller', 21),
(7, 'Daniel', 'Davis', 19),
(8, 'Olivia', 'Martinez', 22),
(9, 'William', 'Garcia', 20),
(10, 'Ava', 'Rodriguez', 21),
(11, 'Alexander', 'Jones', 19),
(12, 'Mia', 'Hernandez', 22),
(13, 'Ethan', 'Lopez', 20),
(14, 'Isabella', 'Perez', 21),
(15, 'Jacob', 'Moore', 19);
GO

-- Заполнение таблицы узлов "Города"
INSERT INTO Cities (ID, Name, Country)
VALUES 
(1, 'New York', 'USA'),
(2, 'London', 'UK'),
(3, 'Paris', 'France'),
(4, 'Tokyo', 'Japan'),
(5, 'Berlin', 'Germany'),
(6, 'Rome', 'Italy'),
(7, 'Moscow', 'Russia'),
(8, 'Sydney', 'Australia'),
(9, 'Toronto', 'Canada'),
(10, 'Rio de Janeiro', 'Brazil'),
(11, 'Dubai', 'UAE'),
(12, 'Seoul', 'South Korea'),
(13, 'Cairo', 'Egypt'),
(14, 'Bangkok', 'Thailand'),
(15, 'Mexico City', 'Mexico');
GO

-- Заполнение таблицы узлов "Книги"
INSERT INTO Books (ID, Title, Author, Genre)
VALUES 
(1, 'War and Peace', 'Leo Tolstoy', 'Novel'),
(2, '1984', 'George Orwell', 'Science Fiction'),
(3, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction'),
(4, 'The Catcher in the Rye', 'J.D. Salinger', 'Novel'),
(5, 'Pride and Prejudice', 'Jane Austen', 'Classic'),
(6, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Novel'),
(7, 'Crime and Punishment', 'Fyodor Dostoevsky', 'Novel'),
(8, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy'),
(9, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Fantasy'),
(10, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy'),
(11, 'The Da Vinci Code', 'Dan Brown', 'Mystery'),
(12, 'The Hunger Games', 'Suzanne Collins', 'Young Adult'),
(13, 'The Alchemist', 'Paulo Coelho', 'Fiction'),
(14, 'Gone with the Wind', 'Margaret Mitchell', 'Historical Fiction'),
(15, 'The Kite Runner', 'Khaled Hosseini', 'Fiction');
GO

-- Заполнение таблицы рёбер "Дружит"
INSERT INTO Friends ($from_id, $to_id)
VALUES 
((Select $node_id From Students Where id = 1), (Select $node_id From Students Where id = 2)),
((Select $node_id From Students Where id = 1), (Select $node_id From Students Where id = 3)),
((Select $node_id From Students Where id = 2), (Select $node_id From Students Where id = 3)),
((Select $node_id From Students Where id = 4), (Select $node_id From Students Where id = 5)),
((Select $node_id From Students Where id = 6), (Select $node_id From Students Where id = 7)),
((Select $node_id From Students Where id = 8), (Select $node_id From Students Where id = 9)),
((Select $node_id From Students Where id = 10), (Select $node_id From Students Where id = 11)),
((Select $node_id From Students Where id = 12), (Select $node_id From Students Where id = 13)),
((Select $node_id From Students Where id = 14), (Select $node_id From Students Where id = 15)),
((Select $node_id From Students Where id = 5), (Select $node_id From Students Where id = 8)),
((Select $node_id From Students Where id = 12), (Select $node_id From Students Where id = 15)),
((Select $node_id From Students Where id = 15), (Select $node_id From Students Where id = 6))
go

-- Заполнение таблицы рёбер "Проживает"
INSERT INTO Resides ($from_id, $to_id)
VALUES 
((Select $node_id From Students Where id = 1), (Select $node_id From Cities Where id = 1)),
((Select $node_id From Students Where id = 2), (Select $node_id From Cities Where id = 1)),
((Select $node_id From Students Where id = 3), (Select $node_id From Cities Where id = 2)),
((Select $node_id From Students Where id = 4), (Select $node_id From Cities Where id = 3)),
((Select $node_id From Students Where id = 5), (Select $node_id From Cities Where id = 4)),
((Select $node_id From Students Where id = 6), (Select $node_id From Cities Where id = 1)),
((Select $node_id From Students Where id = 7), (Select $node_id From Cities Where id = 2)),
((Select $node_id From Students Where id = 8), (Select $node_id From Cities Where id = 3)),
((Select $node_id From Students Where id = 9), (Select $node_id From Cities Where id = 4)),
((Select $node_id From Students Where id = 10), (Select $node_id From Cities Where id = 5))
go

-- Заполнение таблицы рёбер "Рекомендует книгу"
INSERT INTO Recommends_Book ($from_id, $to_id)
VALUES 
((Select $node_id From Students Where id = 1), (Select $node_id From Books Where id = 2)),
((Select $node_id From Students Where id = 2), (Select $node_id From Books Where id = 3)),
((Select $node_id From Students Where id = 3), (Select $node_id From Books Where id = 1)),
((Select $node_id From Students Where id = 4), (Select $node_id From Books Where id = 4)),
((Select $node_id From Students Where id = 5), (Select $node_id From Books Where id = 5)),
((Select $node_id From Students Where id = 6), (Select $node_id From Books Where id = 5)),
((Select $node_id From Students Where id = 7), (Select $node_id From Books Where id = 4)),
((Select $node_id From Students Where id = 8), (Select $node_id From Books Where id = 3)),
((Select $node_id From Students Where id = 9), (Select $node_id From Books Where id = 2)),
((Select $node_id From Students Where id = 10), (Select $node_id From Books Where id = 1))
GO

-- Найти всех друзей определенного студента:
SELECT Student1.First_Name AS [Student],
       Student2.First_Name AS [Friend]
FROM Students AS Student1, Friends, Students AS Student2
WHERE Match(Student1-(Friends)->Student2)
	  And Student1.First_Name = N'John'
GO

-- Найти всех студентов, живущих в определенном городе:
Select Student1.First_Name
From Students as Student1
	 , Resides
	 , Cities as c
Where Match(Student1-(Resides)->c)
	  And c.Name = N'New York'  
Go

-- Найти всех студентов, рекомендующих определенную книгу:
Select Student1.First_Name
From Students as Student1
	 , Recommends_Book as RB
	 , Books as b
Where Match(Student1-(RB)->b)
	  And b.Title = N'1984' 
Go
 
-- Найти всех студентов, которые живут в New York и рекомендуют 1984:
SELECT Student1.First_Name
FROM Students AS Student1,
	Cities as City, Recommends_Book,
	Resides, Books as Book
WHERE City.Name = N'New York' 
      AND Book.Title = N'1984' 
	  and MATCH(Student1-(Resides)->City)
	  and MATCH(Student1-(Recommends_Book)->Book)
GO
 
-- Найти всех студентов, которые читают книги жанра Novel:
SELECT Student1.First_Name, Student1.Last_Name
FROM Students AS Student1,
	 Recommends_Book AS RB,
	 Books as B
WHERE B.Genre = N'Novel'
	  and MATCH(Student1-(RB)->B);
GO

-- Поиск кратчайшего пути дружбы между двумя студентами (используя "+"):

SELECT Student1.First_Name
, STRING_AGG(Student2.First_Name, '->') WITHIN GROUP (GRAPH PATH) AS
Friends
FROM Students AS Student1
, Friends FOR PATH AS fo
, Students FOR PATH AS Student2
WHERE MATCH(SHORTEST_PATH(Student1(-(fo)->Student2)+))
AND Student1.First_Name = N'Emily';

--Поиск кратчайшего пути между студентами, где количество ребер не превышает 2 (используя "{1,n}"): 

SELECT Student1.First_Name
, STRING_AGG(Student2.First_Name, '->') WITHIN GROUP (GRAPH PATH) AS
Friends
FROM Students AS Student1
, Friends FOR PATH AS fo
, Students FOR PATH AS Student2
WHERE MATCH(SHORTEST_PATH(Student1(-(fo)->Student2){1,2}))
AND Student1.First_Name = N'Emily';


