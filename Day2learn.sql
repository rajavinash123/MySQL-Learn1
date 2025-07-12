
CREATE DATABASE IF NOT EXISTS collage;

USE collage;

DROP TABLE IF EXISTS student;

-- 📄 Create the student table
CREATE TABLE student (
  rollno INT PRIMARY KEY,
  name VARCHAR(50),
  marks INT NOT NULL,
  grade VARCHAR(2),
  city VARCHAR(20)
);


INSERT INTO student (rollno, name, marks, grade, city)
VALUES
  (102, "raj", 20, "C", "jhajha"),
  (103, "Raja", 30, "P", "mahapur"),
  (104, "rk", 50, "A+", "punjab"),
  (105, "mk", 90, "P", "delhi"),
  (106, "Neha", 75, "B", "patna"),
  (107, "Sahil", 85, "A", "ranchi"),
  (108, "Simran", 65, "B+", "kolkata"),
  (109, "Aman", 40, "D", "bhopal"),
  (110, "Pooja", 95, "A+", "mumbai"),
  (111, "Kunal", 55, "C+", "lucknow");

SELECT name, marks FROM student;


SELECT * FROM student;


SELECT * FROM student WHERE marks > 30;


SELECT * FROM student WHERE city = "punjab";


SELECT city, COUNT(name) AS total_students, MAX(marks) AS top_score
FROM student
GROUP BY city
HAVING MAX(marks) > 90;

SELECT city, MAX(marks) AS max_marks
FROM student
WHERE grade = "A+"
GROUP BY city
HAVING MAX(marks) > 90;

SELECT  city
FROM student
WHERE grade="A+"
GROUP BY city
HAVING MAX(marks)>90
 ORDER BY city DESC;
 
SET SQL_SAFE_UPDATE =0;
UPDATE student
SET grade = "O"
WHERE grade = "A"; 
SELECT * FROM studentl


