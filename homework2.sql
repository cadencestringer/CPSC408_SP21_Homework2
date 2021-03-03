--1
CREATE TABLE Player
    (pID int NOT NULL,
    name varchar(100) NOT NULL,
    teamName varchar(100),
    PRIMARY KEY (pID)
    );

--2
ALTER TABLE Player
ADD age int;

--3
INSERT INTO Player VALUES
(1,'Player 1', 'Team A', 23),
(2,'Player 2', 'Team A', NULL),
(3,'Player 3', 'Team B', 28),
(4,'Player 4', 'Team B', NULL);

--4
DELETE FROM Player WHERE pID = 2;

--5
UPDATE Player
SET age = 25
WHERE age IS NULL;

--6
SELECT COUNT(*), AVG(age)
FROM Player;

--7
DROP TABLE Player;

--8
SELECT AVG(Total) Average
FROM Invoice
WHERE BillingCountry = 'Brazil';

--9
SELECT BillingCity, AVG(Total) Average
FROM Invoice
GROUP BY BillingCity
HAVING BillingCountry = 'Brazil';

--10
SELECT COUNT(*) Total, Album.Title
FROM Album
JOIN Track on Album.AlbumId = Track.AlbumId
GROUP BY Album.Title
HAVING Total > 20
;

--11
SELECT COUNT(*),
CASE WHEN InvoiceDate BETWEEN '2010-01-01' and '2011-01-01' THEN '2010'
END AS Year
FROM Invoice
WHERE Year = '2010'
;

--12
SELECT Count(DISTINCT BillingCity), BillingCountry
FROM Invoice
GROUP BY BillingCountry;

--13
SELECT Album.Title as AlbumTitle, Track.Name as TrackName, MediaType.Name as MediaType
FROM Album
JOIN Track on Album.AlbumId = Track.AlbumId
JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId
;

--14
SELECT COUNT(*)
FROM Invoice
WHERE CustomerId =
      (
          SELECT CustomerId
          FROM Customer
          WHERE SupportRepId =
                (
                    SELECT EmployeeId
                    FROM Employee
                    WHERE EmployeeId = 3
                    )
          );

--BONUS
SELECT AVG(Total)
FROM Invoice;
SELECT round(SQRT(SUM(SQUARE((Total-5.651941747572825)))/COUNT(Total)), 2) as STDEV, BillingCountry
FROM Invoice
GROUP BY BillingCountry;

