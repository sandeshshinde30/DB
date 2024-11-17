-- Title: Study and Implementation of Triggers and Views
-- This SQL script demonstrates the creation of triggers and views using the given schema.
-- Tables: Sailors (sid, sname, rating, age), Boats (bid, bname, color)

-- Drop tables if they already exist (for cleanup)
DROP TABLE IF EXISTS Sailors;
DROP TABLE IF EXISTS Boats;

-- 1. Creating the Sailors table
CREATE TABLE Sailors (
    sid NUMBER(5) PRIMARY KEY,
    sname VARCHAR2(50),
    rating NUMBER(3),
    age NUMBER(3)
);

-- Inserting sample data into Sailors table
INSERT INTO Sailors VALUES (101, 'Alice', 5, 25);
INSERT INTO Sailors VALUES (102, 'Bob', 7, 30);
INSERT INTO Sailors VALUES (103, 'Charlie', 3, 22);
INSERT INTO Sailors VALUES (104, 'David', 8, 35);

-- 2. Creating the Boats table
CREATE TABLE Boats (
    bid NUMBER(5) PRIMARY KEY,
    bname VARCHAR2(50),
    color VARCHAR2(20)
);

-- Inserting sample data into Boats table
INSERT INTO Boats VALUES (201, 'Sea Breeze', 'Red');
INSERT INTO Boats VALUES (202, 'Wave Rider', 'Blue');
INSERT INTO Boats VALUES (203, 'Ocean King', 'Green');
INSERT INTO Boats VALUES (204, 'Sunny Day', 'Yellow');

-- 3. Trigger: Automatically update the rating of a sailor based on age
-- If the age of a sailor is above 30, increase the rating by 1

CREATE OR REPLACE TRIGGER update_rating_trigger
AFTER INSERT OR UPDATE ON Sailors
FOR EACH ROW
BEGIN
    IF :NEW.age > 30 THEN
        UPDATE Sailors
        SET rating = rating + 1
        WHERE sid = :NEW.sid;   
    END IF;
END;
/

-- Explanation:
-- The trigger 'update_rating_trigger' is fired after an INSERT or UPDATE operation on the Sailors table.
-- It checks the age of the sailor, and if the age is above 30, it increases the rating by 1.

-- Testing the trigger by updating a sailor's age
UPDATE Sailors SET age = 32 WHERE sid = 103;

-- Check the updated rating for the sailor with sid = 103
SELECT * FROM Sailors;

-- 4. Creating a View for Boats
-- The view will show only boats that are red in color

CREATE OR REPLACE VIEW RedBoats AS
SELECT bid, bname, color
FROM Boats
WHERE color = 'Red';

-- Explanation:
-- The view 'RedBoats' is created to display only the boats that have a color value of 'Red'.

-- Display the data from the RedBoats view
SELECT * FROM RedBoats;

-- 5. Using the view to insert a new red boat
INSERT INTO Boats VALUES (205, 'Red Dragon', 'Red');

-- Query the RedBoats view again to see the updated data
SELECT * FROM RedBoats;

-- 6. Drop the Trigger and View (cleanup)
DROP TRIGGER update_rating_trigger;
DROP VIEW RedBoats;

-- Explanation:
-- The DROP commands are used to remove the trigger and view after testing.

-- Commit the changes
COMMIT;

-- End of SQL file
