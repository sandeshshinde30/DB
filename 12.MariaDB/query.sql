-- ===========================================
-- 1. Create a database and use it
-- ===========================================

-- Create a new database named 'customer_information'
CREATE DATABASE IF NOT EXISTS customer_information;

-- Use the database 'customer_information'
USE customer_information;

-- ===========================================
-- 2. Create a table 'customers' with various fields
-- ===========================================

CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Unique ID for each customer, automatically incremented
    first_name VARCHAR(50),                      -- Customer's first name (max 50 characters)
    last_name VARCHAR(50),                       -- Customer's last name (max 50 characters)
    email VARCHAR(100) UNIQUE NOT NULL,          -- Customer's email (max 100 characters), must be unique
    age INT CHECK (age >= 0),                    -- Customer's age (must be a non-negative value)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp of when the record was created
);

-- ===========================================
-- 3. Insert sample data into 'customers' table
-- ===========================================

INSERT INTO customers (first_name, last_name, email, age)
VALUES 
('John', 'Doe', 'john.doe@example.com', 28),
('Jane', 'Smith', 'jane.smith@example.com', 35),
('Alice', 'Johnson', 'alice.johnson@example.com', 30);

-- ===========================================
-- 4. Query to display all records from 'customers' table
-- ===========================================

SELECT * FROM customers;

-- ===========================================
-- 5. Update customer data (update age of customer with id 1)
-- ===========================================

UPDATE customers 
SET age = 29 
WHERE id = 1;

-- ===========================================
-- 6. Delete a record (delete customer with id 1)
-- ===========================================

DELETE FROM customers 
WHERE id = 1;

-- ===========================================
-- 7. Create an 'employees' table with constraints
-- ===========================================

CREATE TABLE IF NOT EXISTS employees (
    empno INT AUTO_INCREMENT PRIMARY KEY,          -- Auto-incrementing employee number (Primary Key)
    ename VARCHAR(20) NOT NULL,                    -- Employee's name, can't be NULL
    job VARCHAR(10),                               -- Employee's job
    deptno INT NOT NULL,                           -- Department number, can't be NULL
    sal DECIMAL(7, 2) CHECK (sal > 0)              -- Employee's salary (must be greater than 0)
);

-- ===========================================
-- 8. Add a unique constraint to the 'email' column
-- ===========================================

ALTER TABLE employees ADD CONSTRAINT unique_email UNIQUE (email);

-- ===========================================
-- 9. Add a foreign key constraint (assuming a 'departments' table exists)
-- ===========================================

-- ALTER TABLE employees ADD CONSTRAINT fk_deptno FOREIGN KEY (deptno)
-- REFERENCES departments(deptno);

-- ===========================================
-- 10. Sample Joins: INNER JOIN, LEFT JOIN, RIGHT JOIN
-- ===========================================

-- Example of INNER JOIN between 'employees' and 'departments' tables
SELECT employees.empno, employees.ename, departments.dname 
FROM employees
INNER JOIN departments ON employees.deptno = departments.deptno;

-- Example of LEFT JOIN between 'employees' and 'departments' tables
SELECT employees.empno, employees.ename, departments.dname 
FROM employees
LEFT JOIN departments ON employees.deptno = departments.deptno;

-- Example of RIGHT JOIN between 'employees' and 'departments' tables
SELECT employees.empno, employees.ename, departments.dname 
FROM employees
RIGHT JOIN departments ON employees.deptno = departments.deptno;

-- ===========================================
-- 11. Simulate FULL OUTER JOIN
-- ===========================================

SELECT employees.empno, employees.ename, departments.dname 
FROM employees
LEFT JOIN departments ON employees.deptno = departments.deptno
UNION
SELECT employees.empno, employees.ename, departments.dname 
FROM employees
RIGHT JOIN departments ON employees.deptno = departments.deptno;

-- ===========================================
-- 12. Indexing: Create Unique and Regular Indexes
-- ===========================================

-- Create a unique index on 'email' column in the 'employees' table
CREATE UNIQUE INDEX idx_email ON employees(email);

-- Create a regular index on the 'sal' column in the 'employees' table
CREATE INDEX idx_salary ON employees(sal);

-- ===========================================
-- 13. Query Clauses: WHERE, GROUP BY, HAVING, ORDER BY
-- ===========================================

-- Query all employees with salary greater than 3000
SELECT * FROM employees 
WHERE sal > 3000;

-- Group employees by department and count the number of employees in each department
SELECT deptno, COUNT(*) 
FROM employees 
GROUP BY deptno;

-- Group employees by department and only show those departments with more than 5 employees
SELECT deptno, COUNT(*) 
FROM employees 
GROUP BY deptno 
HAVING COUNT(*) > 5;

-- Sort employees by salary in descending order
SELECT * FROM employees 
ORDER BY sal DESC;

-- ===========================================
-- 14. Backup and Restore Database
-- ===========================================

-- Backup the database 'customer_information'
-- (This command should be run in the shell/terminal, not SQL prompt)
mysqldump -u root -p customer_information > customer_information_backup.sql;

-- Restore the database 'customer_information' from a backup
-- (This command should be run in the shell/terminal, not SQL prompt)
mysql -u root -p customer_information < customer_information_backup.sql;

-- ===========================================
-- 15. Drop a table (optional step to remove a table completely)
-- ===========================================

-- Drop the 'customers' table (delete the entire table)
DROP TABLE customers;

-- ===========================================
-- 16. Exit MariaDB
-- ===========================================

-- Exit the MariaDB shell
EXIT;
