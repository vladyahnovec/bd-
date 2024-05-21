SELECT @@SERVERNAME
-- Сервер: Acer\SQLEXPRESS
-- База данных: StudentsTree

-- Edge Friends
SELECT S1.ID as IdFirst
, S1.First_Name AS Student
, CONCAT(N'f',S1.ID) AS [First image name]
, S2.ID AS IdSecond
, S2.First_Name AS Second
, CONCAT(N'f',S2.ID) AS [Second image name]
FROM dbo.Students AS S1
, dbo.Friends AS F
, dbo.Students AS S2
WHERE MATCH (S1-(F)->S2)

-- Edge Resides
SELECT S.ID as IdStudent
, S.First_Name AS Student
, CONCAT(N'f',S.ID) AS [First image name]
, C.ID AS IdCty
, C.Name AS City
, CONCAT(N'c',C.ID) AS [Second image name]
FROM dbo.Students AS S
, dbo.Resides AS R
, dbo.Cities AS C
WHERE MATCH (S-(R)->C)

-- Edge Recommends_Book
SELECT S.ID as IdStudent
, S.First_Name AS Student
, CONCAT(N'f',S.ID) AS [First image name]
, B.ID AS IdBook
, B.Title AS Book
, CONCAT(N'b',B.ID) AS [Second image name]
FROM dbo.Students AS S
, dbo.Recommends_Book AS RB
, dbo.Books AS B
WHERE MATCH (S-(RB)->B)