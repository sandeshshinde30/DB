-- Title: Study and Implementation of Various Types of Constraints in SQL
-- This script creates an EMP table with specific constraints and includes SQL queries for testing these constraints.

-- 1. Drop the table if it already exists (for reusability of the script).
DROP TABLE EMP;

-- 2. Creating the EMP table with the following structure and constraints:
--    EMPNO: Employee Number (Primary Key, Must be > 100)
--    ENAME: Employee Name (NOT NULL)
--    JOB: Job Title (NOT NULL)
--    DEPTNO: Department Number (Unique)
--    SAL: Salary

CREATE TABLE EMP (
    EMPNO NUMBER(6) CONSTRAINT PK_EMPNO PRIMARY KEY,          -- Primary Key Constraint
    ENAME VARCHAR2(20) NOT NULL,                              -- NOT NULL Constraint
    JOB VARCHAR2(10) NOT NULL,                                -- NOT NULL Constraint
    DEPTNO NUMBER(3) CONSTRAINT UQ_DEPTNO UNIQUE,             -- Unique Constraint
    SAL NUMBER(7, 2),                                         -- Salary with precision and scale
    CONSTRAINT CK_EMPNO CHECK (EMPNO > 100)                   -- Check Constraint (EMPNO > 100)
);

-- 3. Inserting sample data to test the constraints.
-- This data insertion should succeed as it follows all defined constraints.
INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL)
VALUES (101, 'Alice', 'Manager', 10, 50000);

INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL)
VALUES (102, 'Bob', 'Engineer', 20, 40000);

INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL)
VALUES (103, 'Charlie', 'Analyst', 30, 35000);

-- 4. Testing the constraints with different scenarios.

-- 4.1. Testing NOT NULL Constraint
-- This query will fail because ENAME is NOT NULL.
-- Uncomment the following line to test:
-- INSERT INTO EMP (EMPNO, JOB, DEPTNO, SAL) VALUES (104, 'Clerk', 40, 30000);

-- 4.2. Testing CHECK Constraint (EMPNO > 100)
-- This query will fail because EMPNO is not greater than 100.
-- Uncomment the following line to test:
-- INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (99, 'David', 'Intern', 50, 20000);

-- 4.3. Testing UNIQUE Constraint on DEPTNO
-- This query will fail because DEPTNO 10 already exists.
-- Uncomment the following line to test:
-- INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (105, 'Eve', 'Designer', 10, 45000);

-- 4.4. Testing PRIMARY KEY Constraint on EMPNO
-- This query will fail because EMPNO 101 already exists.
-- Uncomment the following line to test:
-- INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL) VALUES (101, 'Frank', 'Technician', 60, 28000);

-- 5. Querying the EMP table to verify data insertion.
SELECT * FROM EMP;

-- 6. Updating a record to test NOT NULL Constraint.
-- This query will fail because it tries to set ENAME to NULL.
-- Uncomment the following line to test:
-- UPDATE EMP SET ENAME = NULL WHERE EMPNO = 101;

-- 7. Updating a record to test CHECK Constraint.
-- This query will fail because it tries to set EMPNO to a value <= 100.
-- Uncomment the following line to test:
-- UPDATE EMP SET EMPNO = 100 WHERE ENAME = 'Bob';

-- 8. Deleting a record (No constraint violation here).
DELETE FROM EMP WHERE EMPNO = 102;

-- 9. Final Query to display the current records in the EMP table.
SELECT * FROM EMP;

-- End of SQL script.
