-- Create and drop databases
CREATE DATABASE temp1;
DROP DATABASE temp1;

CREATE DATABASE avinash;
CREATE DATABASE collage;
DROP DATABASE collage;

-- Case-sensitive name
CREATE DATABASE Collage;

-- Create a table in default or current database
CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT NOT NULL
);

-- Insert records into student table
INSERT INTO student VALUES (1, "Avinash Raj", 29);
INSERT INTO student VALUES (2, "Komal Raj", 30);

-- View all records from student table
SELECT * FROM student;

-- Create database only if it does not already exist
CREATE DATABASE IF NOT EXISTS collage;

-- Drop database only if it exists
DROP DATABASE IF EXISTS collage;

-- Drop another database (company) safely
DROP DATABASE company;
DROP DATABASE IF EXISTS company;

-- View all databases in the system
SHOW DATABASES;
