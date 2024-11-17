-- 1. Student Database Relation Tables

-- STUDENT Table: Stores student details
CREATE TABLE STUDENT (
    USN VARCHAR(10) PRIMARY KEY,    -- Unique student ID
    SName VARCHAR(100),             -- Student name
    Address VARCHAR(255),           -- Student address
    Phone VARCHAR(15),              -- Student phone number
    Gender CHAR(1)                  -- Student gender
);

-- SEMSEC Table: Stores details about the semester and section
CREATE TABLE SEMSEC (
    SSID INT PRIMARY KEY,           -- Unique semester-section ID
    Sem INT,                        -- Semester number
    Sec CHAR(1)                     -- Section (A, B, etc.)
);

-- CLASS Table: Maps students to the semester and section they are enrolled in
CREATE TABLE CLASS (
    USN VARCHAR(10),                -- Student ID
    SSID INT,                       -- Semester-section ID
    PRIMARY KEY (USN, SSID),        -- Composite primary key
    FOREIGN KEY (USN) REFERENCES STUDENT(USN),   -- Foreign key referencing STUDENT table
    FOREIGN KEY (SSID) REFERENCES SEMSEC(SSID)    -- Foreign key referencing SEMSEC table
);

-- SUBJECT Table: Stores details of subjects offered in the course
CREATE TABLE SUBJECT (
    Subcode VARCHAR(10) PRIMARY KEY, -- Subject code
    Title VARCHAR(100),              -- Subject title
    Sem INT,                         -- Semester in which the subject is offered
    Credits INT                      -- Credits assigned to the subject
);

-- IAMARKS Table: Stores internal assessment marks for each student in each subject and semester
CREATE TABLE IAMARKS (
    USN VARCHAR(10),                 -- Student ID
    Subcode VARCHAR(10),             -- Subject code
    SSID INT,                        -- Semester-section ID
    Test1 INT,                       -- Marks of Test1
    Test2 INT,                       -- Marks of Test2
    Test3 INT,                       -- Marks of Test3
    FinalIA INT,                     -- Final internal assessment marks
    PRIMARY KEY (USN, Subcode, SSID),-- Composite primary key
    FOREIGN KEY (USN) REFERENCES STUDENT(USN),      -- Foreign key referencing STUDENT table
    FOREIGN KEY (Subcode) REFERENCES SUBJECT(Subcode),  -- Foreign key referencing SUBJECT table
    FOREIGN KEY (SSID) REFERENCES SEMSEC(SSID)         -- Foreign key referencing SEMSEC table
);

-- 2. Company Database Relation Tables

-- EMPLOYEE Table: Stores employee details
CREATE TABLE EMPLOYEE (
    SSN INT PRIMARY KEY,            -- Employee Social Security Number (ID)
    Name VARCHAR(100),              -- Employee name
    Address VARCHAR(255),           -- Employee address
    Sex CHAR(1),                    -- Employee sex (M/F)
    Salary DECIMAL(10, 2),          -- Employee salary
    SuperSSN INT,                   -- ID of the employee's supervisor
    DNo INT,                        -- Department number
    FOREIGN KEY (SuperSSN) REFERENCES EMPLOYEE(SSN),   -- Foreign key referencing EMPLOYEE table (supervisor)
    FOREIGN KEY (DNo) REFERENCES DEPARTMENT(DNo)       -- Foreign key referencing DEPARTMENT table
);

-- DEPARTMENT Table: Stores department details
CREATE TABLE DEPARTMENT (
    DNo INT PRIMARY KEY,            -- Department number
    DName VARCHAR(100),             -- Department name
    MgrSSN INT,                     -- Manager's SSN (Social Security Number)
    MgrStartDate DATE,              -- Manager's start date
    FOREIGN KEY (MgrSSN) REFERENCES EMPLOYEE(SSN) -- Foreign key referencing EMPLOYEE table (manager)
);

-- DLOCATION Table: Stores location of departments
CREATE TABLE DLOCATION (
    DNo INT,                        -- Department number
    DLoc VARCHAR(100),              -- Department location
    PRIMARY KEY (DNo, DLoc),        -- Composite primary key
    FOREIGN KEY (DNo) REFERENCES DEPARTMENT(DNo) -- Foreign key referencing DEPARTMENT table
);

-- PROJECT Table: Stores project details
CREATE TABLE PROJECT (
    PNo INT PRIMARY KEY,            -- Project number
    PName VARCHAR(100),             -- Project name
    PLocation VARCHAR(100),         -- Project location
    DNo INT,                        -- Department number
    FOREIGN KEY (DNo) REFERENCES DEPARTMENT(DNo)   -- Foreign key referencing DEPARTMENT table
);

-- WORKS_ON Table: Stores details of which employee works on which project and the number of hours
CREATE TABLE WORKS_ON (
    SSN INT,                        -- Employee SSN (ID)
    PNo INT,                        -- Project number
    Hours DECIMAL(5, 2),            -- Number of hours worked
    PRIMARY KEY (SSN, PNo),         -- Composite primary key
    FOREIGN KEY (SSN) REFERENCES EMPLOYEE(SSN),  -- Foreign key referencing EMPLOYEE table
    FOREIGN KEY (PNo) REFERENCES PROJECT(PNo)    -- Foreign key referencing PROJECT table
);
