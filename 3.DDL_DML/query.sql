-- ========================================================
-- 1. DDL Commands (Data Definition Language)
-- ========================================================

-- ========================================================
-- 1.1 CREATE TABLE Command
-- Description: Create the DEPARTMENT table with the specified schema.
-- DEPTNO is the primary key, which must be unique for each department.
-- PINCODE cannot be null and is required for each record.
-- ========================================================
CREATE TABLE DEPARTMENT (
    DEPTNO NUMBER(38) PRIMARY KEY,        -- Department number, must be unique and not null
    DNAME VARCHAR2(10),                   -- Department name, can be null
    LOC VARCHAR2(4),                      -- Location of the department, can be null
    PINCODE NUMBER(6) NOT NULL            -- Pincode for the department, cannot be null
);

-- Sample data insertion for DEPARTMENT table
-- Insert records into the DEPARTMENT table to demonstrate DML operations.
INSERT INTO DEPARTMENT (DEPTNO, DNAME, LOC, PINCODE) 
VALUES (1, 'HR', 'NYC', 10001);

INSERT INTO DEPARTMENT (DEPTNO, DNAME, LOC, PINCODE) 
VALUES (2, 'IT', 'SFO', 94105);

INSERT INTO DEPARTMENT (DEPTNO, DNAME, LOC, PINCODE) 
VALUES (3, 'Finance', 'LA', 90001);

INSERT INTO DEPARTMENT (DEPTNO, DNAME, LOC, PINCODE) 
VALUES (4, 'Marketing', 'MIA', 33101);

-- ========================================================
-- 1.2 ALTER TABLE Command
-- Description: Demonstrating how to add a new column to the DEPARTMENT table.
-- We will add a column for the department manager's name (MGRNAME).
-- ========================================================
ALTER TABLE DEPARTMENT ADD MGRNAME VARCHAR2(50);

-- ========================================================
-- 1.3 DROP TABLE Command
-- Description: This command removes the DEPARTMENT table from the database.
-- Use with caution, as this will delete all data and schema of the table.
-- ========================================================
-- DROP TABLE DEPARTMENT;

-- ========================================================
-- 1.4 TRUNCATE TABLE Command
-- Description: This command removes all rows from the DEPARTMENT table.
-- It does not remove the table schema, only the data inside it.
-- ========================================================
-- TRUNCATE TABLE DEPARTMENT;

-- ========================================================
-- 2. DML Commands (Data Manipulation Language)
-- ========================================================

-- ========================================================
-- 2.1 INSERT Command
-- Description: Insert new records into the DEPARTMENT table.
-- Example shows how to insert a new department with all columns.
-- ========================================================
INSERT INTO DEPARTMENT (DEPTNO, DNAME, LOC, PINCODE, MGRNAME) 
VALUES (5, 'R&D', 'BOS', 02139, 'John Doe');

-- ========================================================
-- 2.2 SELECT Command
-- Description: Select records from the DEPARTMENT table to retrieve all rows.
-- This will show all the departments in the table.
-- ========================================================
SELECT * FROM DEPARTMENT;

-- ========================================================
-- 2.3 UPDATE Command
-- Description: Update a record in the DEPARTMENT table.
-- This example updates the manager's name for the IT department.
-- ========================================================
UPDATE DEPARTMENT
SET MGRNAME = 'Jane Smith'
WHERE DEPTNO = 2;

-- ========================================================
-- 2.4 DELETE Command
-- Description: Delete a specific record from the DEPARTMENT table.
-- This example deletes the department with DEPTNO = 4.
-- ========================================================
DELETE FROM DEPARTMENT WHERE DEPTNO = 4;

-- ========================================================
-- Explanation of DDL and DML Commands:
-- DDL (Data Definition Language) commands are used to define and manage the structure of database objects.
-- DML (Data Manipulation Language) commands are used to manipulate and query the data in the database.
--
-- 1. CREATE TABLE: Defines the structure of the DEPARTMENT table with columns and data types.
-- 2. ALTER TABLE: Modifies an existing table by adding a new column.
-- 3. DROP TABLE: Removes the entire table structure and all data (not used here to avoid accidental deletion).
-- 4. TRUNCATE TABLE: Removes all data in the table without removing the table structure.
-- 5. INSERT: Adds new rows of data into the table.
-- 6. SELECT: Retrieves data from the table.
-- 7. UPDATE: Modifies existing rows of data in the table.
-- 8. DELETE: Removes specific rows of data from the table.
-- ========================================================
