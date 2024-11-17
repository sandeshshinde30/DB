-- Title: Study & Implementation of Various Types of Clauses and Indexing
-- This SQL script demonstrates the usage of GROUP BY, HAVING, ORDER BY, WHERE clauses, and indexing.

-- 1. Create a relation (EMPLOYEE table)
DROP TABLE IF EXISTS EMPLOYEE;

CREATE TABLE EMPLOYEE (
    EMPNO NUMBER(6) PRIMARY KEY,
    ENAME VARCHAR2(20) NOT NULL,
    JOB VARCHAR2(10),
    MGR NUMBER(6),
    HIREDATE DATE,
    SAL NUMBER(7, 2),
    COMM NUMBER(7, 2),
    DEPTNO NUMBER(3)
);

-- Inserting sample data into EMPLOYEE table
INSERT INTO EMPLOYEE VALUES (1001, 'John', 'Manager', NULL, '2022-01-15', 20000, 500, 10);
INSERT INTO EMPLOYEE VALUES (1002, 'Alice', 'Clerk', 1001, '2022-02-10', 15000, NULL, 10);
INSERT INTO EMPLOYEE VALUES (1003, 'Bob', 'Salesman', 1001, '2022-03-12', 18000, 1000, 20);
INSERT INTO EMPLOYEE VALUES (1004, 'Charlie', 'Analyst', 1001, '2022-04-20', 22000, NULL, 20);
INSERT INTO EMPLOYEE VALUES (1005, 'David', 'Clerk', 1003, '2022-05-05', 12000, NULL, 30);
INSERT INTO EMPLOYEE VALUES (1006, 'Eve', 'Manager', NULL, '2022-06-18', 25000, NULL, 30);

-- 2. Display total salary spent for each job category using GROUP BY clause
SELECT JOB, SUM(SAL) AS TOTAL_SALARY
FROM EMPLOYEE
GROUP BY JOB;

-- Explanation:
-- The GROUP BY clause groups the rows based on the 'JOB' column and calculates the total salary using SUM().

-- 3. Display lowest paid employee details under each manager using GROUP BY and HAVING clause
SELECT MGR, MIN(SAL) AS LOWEST_SALARY
FROM EMPLOYEE
WHERE MGR IS NOT NULL
GROUP BY MGR;

-- Explanation:
-- The GROUP BY clause is used to group the records by 'MGR'. The MIN() function finds the lowest salary under each manager.

-- 4. Display the number of employees working in each department and their department name using GROUP BY clause
SELECT DEPTNO, COUNT(*) AS EMP_COUNT
FROM EMPLOYEE
GROUP BY DEPTNO;

-- Explanation:
-- The COUNT() function returns the number of employees in each department. GROUP BY is used to aggregate by 'DEPTNO'.

-- 5. Display the details of employees sorting the salary in increasing order using ORDER BY clause
SELECT * FROM EMPLOYEE
ORDER BY SAL ASC;

-- Explanation:
-- The ORDER BY clause sorts the records based on the 'SAL' column in ascending order (increasing order).

-- 6. Show the record of employees earning a salary greater than 16000 in each department using WHERE clause
SELECT * FROM EMPLOYEE
WHERE SAL > 16000;

-- Explanation:
-- The WHERE clause filters the records where the 'SAL' column value is greater than 16000.

-- 7. Implementing Unique Index and Clustered Index (MySQL does not support clustered indexes directly; instead, the primary key acts as a clustered index)

-- Creating a Unique Index on the 'ENAME' column
CREATE UNIQUE INDEX idx_unique_ename ON EMPLOYEE (ENAME);

-- Explanation:
-- The UNIQUE INDEX ensures that the 'ENAME' column values are unique.

-- Creating a regular index on the 'DEPTNO' column
CREATE INDEX idx_deptno ON EMPLOYEE (DEPTNO);

-- Explanation:
-- The INDEX on 'DEPTNO' helps to speed up search queries involving the 'DEPTNO' column.

-- 8. Displaying the indexed columns
SHOW INDEXES FROM EMPLOYEE;

-- Explanation:
-- The SHOW INDEXES command displays information about the indexes created on the 'EMPLOYEE' table.

-- 9. Query to drop indexes (cleanup)
DROP INDEX idx_unique_ename;
DROP INDEX idx_deptno;

-- Explanation:
-- The DROP INDEX command removes the indexes created on the table.

-- Commit the changes
COMMIT;

-- End of SQL file
