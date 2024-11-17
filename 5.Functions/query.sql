-- ========================================================
-- SQL File: functions_example.sql
-- Title: Perform Various Types of Functions in SQL
-- ========================================================

-- ========================================================
-- 1. Creating a Sample Database and Table
-- ========================================================

-- Creating a database named 'sample_db'
CREATE DATABASE sample_db;

-- Using the database 'sample_db'
USE sample_db;

-- Creating the table 'EMPLOYEE' with sample data
CREATE TABLE EMPLOYEE (
    EmpID INT PRIMARY KEY,               -- Employee ID
    FirstName VARCHAR(50),               -- Employee's first name
    LastName VARCHAR(50),                -- Employee's last name
    Salary DECIMAL(10, 2),               -- Employee's salary
    JoinDate DATE,                       -- Employee's joining date
    Department VARCHAR(50)               -- Employee's department
);

-- Inserting sample data into the EMPLOYEE table
INSERT INTO EMPLOYEE (EmpID, FirstName, LastName, Salary, JoinDate, Department)
VALUES 
(1, 'John', 'Doe', 5000.00, '2021-05-10', 'HR'),
(2, 'Jane', 'Smith', 6500.00, '2020-03-15', 'Finance'),
(3, 'Michael', 'Brown', 7000.50, '2019-12-01', 'IT'),
(4, 'Emily', 'Davis', 8000.75, '2022-01-20', 'Marketing'),
(5, 'David', 'Wilson', 9000.00, '2018-07-25', 'IT');

-- ========================================================
-- 2. String Functions
-- ========================================================

-- Using the CONCAT function to combine first name and last name
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM EMPLOYEE;

-- Using the UPPER function to convert the first name to uppercase
SELECT UPPER(FirstName) AS UpperCaseName FROM EMPLOYEE;

-- Using the LOWER function to convert the last name to lowercase
SELECT LOWER(LastName) AS LowerCaseName FROM EMPLOYEE;

-- Using the LENGTH function to find the length of the first name
SELECT FirstName, LENGTH(FirstName) AS NameLength FROM EMPLOYEE;

-- Using the SUBSTRING function to extract the first 3 characters of the last name
SELECT LastName, SUBSTRING(LastName, 1, 3) AS ShortName FROM EMPLOYEE;

-- Using the REPLACE function to replace 'IT' with 'Information Technology'
SELECT Department, REPLACE(Department, 'IT', 'Information Technology') AS UpdatedDepartment
FROM EMPLOYEE;

-- ========================================================
-- 3. Aggregate Functions
-- ========================================================

-- Using the COUNT function to count the number of employees
SELECT COUNT(*) AS TotalEmployees FROM EMPLOYEE;

-- Using the SUM function to calculate the total salary
SELECT SUM(Salary) AS TotalSalary FROM EMPLOYEE;

-- Using the AVG function to find the average salary
SELECT AVG(Salary) AS AverageSalary FROM EMPLOYEE;

-- Using the MAX function to find the highest salary
SELECT MAX(Salary) AS HighestSalary FROM EMPLOYEE;

-- Using the MIN function to find the lowest salary
SELECT MIN(Salary) AS LowestSalary FROM EMPLOYEE;

-- ========================================================
-- 4. Math Functions
-- ========================================================

-- Using the ROUND function to round the salary to the nearest whole number
SELECT FirstName, Salary, ROUND(Salary) AS RoundedSalary FROM EMPLOYEE;

-- Using the CEIL function to round up the salary
SELECT FirstName, Salary, CEIL(Salary) AS CeilingSalary FROM EMPLOYEE;

-- Using the FLOOR function to round down the salary
SELECT FirstName, Salary, FLOOR(Salary) AS FloorSalary FROM EMPLOYEE;

-- Using the ABS function to get the absolute value of a salary difference
SELECT Salary, ABS(Salary - 6000) AS SalaryDifference FROM EMPLOYEE;

-- Using the POWER function to raise a number to a power
SELECT FirstName, POWER(Salary, 2) AS SalarySquared FROM EMPLOYEE;

-- ========================================================
-- 5. Date Functions
-- ========================================================

-- Using the CURRENT_DATE function to get the current date
SELECT CURRENT_DATE AS TodayDate;

-- Using the YEAR function to extract the year from the JoinDate
SELECT FirstName, JoinDate, YEAR(JoinDate) AS JoinYear FROM EMPLOYEE;

-- Using the MONTH function to extract the month from the JoinDate
SELECT FirstName, JoinDate, MONTH(JoinDate) AS JoinMonth FROM EMPLOYEE;

-- Using the DAY function to extract the day from the JoinDate
SELECT FirstName, JoinDate, DAY(JoinDate) AS JoinDay FROM EMPLOYEE;

-- Using the DATEDIFF function to find the number of days since the employee joined
SELECT FirstName, JoinDate, DATEDIFF(CURRENT_DATE, JoinDate) AS DaysSinceJoined FROM EMPLOYEE;

-- Using the DATE_ADD function to add 30 days to the JoinDate
SELECT FirstName, JoinDate, DATE_ADD(JoinDate, INTERVAL 30 DAY) AS NewJoinDate FROM EMPLOYEE;

-- Using the DATE_SUB function to subtract 1 year from the JoinDate
SELECT FirstName, JoinDate, DATE_SUB(JoinDate, INTERVAL 1 YEAR) AS PreviousYearDate FROM EMPLOYEE;

-- ========================================================
-- Explanation:
--
-- 1. String Functions:
--    - CONCAT: Combines two or more strings.
--    - UPPER/LOWER: Converts strings to uppercase or lowercase.
--    - LENGTH: Returns the length of a string.
--    - SUBSTRING: Extracts a part of a string.
--    - REPLACE: Replaces a part of a string with another substring.
--
-- 2. Aggregate Functions:
--    - COUNT: Counts the number of rows.
--    - SUM: Calculates the sum of a numeric column.
--    - AVG: Finds the average value of a numeric column.
--    - MAX/MIN: Finds the maximum or minimum value.
--
-- 3. Math Functions:
--    - ROUND: Rounds a number to the nearest integer.
--    - CEIL/FLOOR: Rounds a number up or down.
--    - ABS: Returns the absolute value.
--    - POWER: Raises a number to a specified power.
--
-- 4. Date Functions:
--    - CURRENT_DATE: Returns the current date.
--    - YEAR/MONTH/DAY: Extracts the year, month, or day from a date.
--    - DATEDIFF: Returns the difference in days between two dates.
--    - DATE_ADD/DATE_SUB: Adds or subtracts a specified time interval from a date.
--
-- ========================================================
