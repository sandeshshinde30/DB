-- ========================================================
-- 1. Table Creation for EMPLOYEE
-- Description: Create the EMPLOYEE table with the given schema.
-- ========================================================

CREATE TABLE EMPLOYEE (
    SSN VARCHAR2(20) PRIMARY KEY, -- Social Security Number
    FNAME VARCHAR2(20),           -- First Name
    LNAME VARCHAR2(20),           -- Last Name
    ADDRESS VARCHAR2(20),         -- Address
    SEX CHAR(1),                  -- Gender (M/F)
    SALARY INTEGER                -- Salary of the employee
);

-- Sample data insertion for EMPLOYEE table
-- You can insert sample records to test relational algebra operations.
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('101', 'John', 'Doe', 'New York', 'M', 55000);

INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('102', 'Jane', 'Smith', 'Los Angeles', 'F', 60000);

INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('103', 'Emily', 'Johnson', 'Chicago', 'F', 45000);

INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('104', 'Michael', 'Brown', 'New York', 'M', 70000);

INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('105', 'James', 'Wilson', 'Chicago', 'M', 50000);

-- ========================================================
-- 2. Relational Algebra Operations on EMPLOYEE Table
-- ========================================================

-- ========================================================
-- 2.1 SELECT Operation (σ)
-- Description: Select employees with salary greater than 50000
-- SQL Equivalent: WHERE clause to filter the rows based on condition
-- ========================================================
SELECT * 
FROM EMPLOYEE
WHERE SALARY > 50000;

-- ========================================================
-- 2.2 PROJECT Operation (π)
-- Description: Project only the FNAME, LNAME, and SALARY columns
-- SQL Equivalent: SELECT statement with specific columns
-- ========================================================
SELECT FNAME, LNAME, SALARY
FROM EMPLOYEE;

-- ========================================================
-- 2.3 INTERSECT Operation (∩)
-- Description: Find employees who both earn more than 50000 and live in New York
-- SQL Equivalent: INTERSECT operator to find common rows between two queries
-- ========================================================
SELECT * 
FROM EMPLOYEE
WHERE SALARY > 50000
INTERSECT
SELECT * 
FROM EMPLOYEE
WHERE ADDRESS = 'New York';

-- ========================================================
-- 2.4 MINUS Operation (−)
-- Description: Find employees who earn more than 50000 but do not live in New York
-- SQL Equivalent: MINUS operator to subtract rows from one query that are in another
-- ========================================================
SELECT * 
FROM EMPLOYEE
WHERE SALARY > 50000
MINUS
SELECT * 
FROM EMPLOYEE
WHERE ADDRESS = 'New York';

-- ========================================================
-- 2.5 CARTESIAN PRODUCT Operation (×)
-- Description: Find all combinations of employees with other employees (Cartesian Product)
-- SQL Equivalent: CROSS JOIN to get the Cartesian product of the table
-- ========================================================
SELECT * 
FROM EMPLOYEE e1, EMPLOYEE e2;

-- ========================================================
-- Explanation of each operation:
-- 1. SELECT (σ): Filters rows based on a condition (using WHERE clause).
-- 2. PROJECT (π): Retrieves specific columns (using SELECT statement).
-- 3. INTERSECT (∩): Finds the common rows from two queries.
-- 4. MINUS (−): Returns the difference between two queries.
-- 5. CARTESIAN PRODUCT (×): Returns all combinations of rows from two relations (using CROSS JOIN).
-- ========================================================
