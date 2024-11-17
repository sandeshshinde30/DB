-- Title: Implementation of Different Types of Joins in SQL
-- This script demonstrates various types of joins using the Sailors, Boats, and Reserves tables.

-- Drop tables if they already exist (for reusability of the script).
DROP TABLE IF EXISTS Reserves;
DROP TABLE IF EXISTS Sailors;
DROP TABLE IF EXISTS Boats;

-- 1. Creating the Sailors table.
CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    rating INT,
    age DECIMAL(4, 2)
);

-- 2. Creating the Boats table.
CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(50),
    color VARCHAR(20)
);

-- 3. Creating the Reserves table.
CREATE TABLE Reserves (
    sid INT,
    bid INT,
    day DATE,
    PRIMARY KEY (sid, bid, day),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

-- 4. Inserting sample data into Sailors table.
INSERT INTO Sailors VALUES (1, 'Alice', 5, 25.5);
INSERT INTO Sailors VALUES (2, 'Bob', 7, 30.0);
INSERT INTO Sailors VALUES (3, 'Charlie', 8, 22.0);
INSERT INTO Sailors VALUES (4, 'David', 6, 35.0);

-- 5. Inserting sample data into Boats table.
INSERT INTO Boats VALUES (101, 'Speedster', 'Red');
INSERT INTO Boats VALUES (102, 'WaveRider', 'Blue');
INSERT INTO Boats VALUES (103, 'SeaExplorer', 'Green');

-- 6. Inserting sample data into Reserves table.
INSERT INTO Reserves VALUES (1, 101, '2024-11-01');
INSERT INTO Reserves VALUES (2, 102, '2024-11-02');
INSERT INTO Reserves VALUES (3, 103, '2024-11-03');
INSERT INTO Reserves VALUES (2, 101, '2024-11-04');

-- 7. Query 1: Find all information of sailors who have reserved boat number 101 (Inner Join).
SELECT S.*
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 101;

-- 8. Query 2: Find the name of the boat reserved by Bob (Inner Join).
SELECT B.bname
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
INNER JOIN Boats B ON R.bid = B.bid
WHERE S.sname = 'Bob';

-- 9. Query 3: Find the names of sailors who have reserved a red boat, listed in the order of age (Inner Join).
SELECT S.sname
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
INNER JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'Red'
ORDER BY S.age;

-- 10. Query 4: Find the names of sailors who have reserved at least one boat (Left Outer Join).
SELECT DISTINCT S.sname
FROM Sailors S
LEFT JOIN Reserves R ON S.sid = R.sid
WHERE R.bid IS NOT NULL;

-- 11. Query 5: Find the ids and names of sailors who have reserved two different boats on the same day (Self Join).
SELECT DISTINCT R1.sid, S.sname
FROM Reserves R1
INNER JOIN Reserves R2 ON R1.sid = R2.sid AND R1.day = R2.day AND R1.bid <> R2.bid
INNER JOIN Sailors S ON R1.sid = S.sid;

-- 12. Query 6: Find the ids of sailors who have reserved a red boat or a green boat (Inner Join).
SELECT DISTINCT S.sid
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
INNER JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'Red' OR B.color = 'Green';

-- 13. Query 7: Find the name and age of the youngest sailor (Subquery).
SELECT sname, age
FROM Sailors
WHERE age = (SELECT MIN(age) FROM Sailors);

-- 14. Query 8: Count the number of different sailor names (Aggregate Function).
SELECT COUNT(DISTINCT sname) AS unique_sailor_names
FROM Sailors;

-- 15. Query 9: Find the average age of sailors for each rating level (Group By).
SELECT rating, AVG(age) AS average_age
FROM Sailors
GROUP BY rating;

-- 16. Query 10: Find the average age of sailors for each rating level that has at least two sailors (HAVING Clause).
SELECT rating, AVG(age) AS average_age
FROM Sailors
GROUP BY rating
HAVING COUNT(sid) >= 2;

-- 17. Demonstrating different types of joins:
-- Inner Join: Returns records that have matching values in both tables.
SELECT S.sid, S.sname, B.bname, B.color
FROM Sailors S
INNER JOIN Reserves R ON S.sid = R.sid
INNER JOIN Boats B ON R.bid = B.bid;

-- Left Outer Join: Returns all records from the left table, and the matched records from the right table.
SELECT S.sid, S.sname, R.bid
FROM Sailors S
LEFT JOIN Reserves R ON S.sid = R.sid;

-- Right Outer Join: Returns all records from the right table, and the matched records from the left table.
SELECT S.sid, S.sname, R.bid
FROM Sailors S
RIGHT JOIN Reserves R ON S.sid = R.sid;

-- Full Outer Join: Returns all records when there is a match in either left or right table.
SELECT S.sid, S.sname, R.bid
FROM Sailors S
FULL OUTER JOIN Reserves R ON S.sid = R.sid;

-- Natural Join: Joins tables based on columns with the same name.
SELECT *
FROM Sailors
NATURAL JOIN Reserves;

-- End of SQL script.
