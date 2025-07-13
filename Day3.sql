-- 🏫 CREATE DATABASE
create database if not exists collage;
use collage;

-- 🗑️ DROP OLD TABLES IF EXIST
drop table if exists student;
drop table if exists dept;
drop table if exists teacher;
drop table if exists courses;

-- 📄 CREATE STUDENT TABLE
create table student (
  rollno int primary key,
  name varchar(50),
  marks int not null,
  grade varchar(2),
  city varchar(20)
);

-- 📘 CREATE DEPARTMENT TABLE
create table dept (
  id int primary key,
  name varchar(50)
);

-- 👨‍🏫 CREATE TEACHER TABLE WITH FK
create table teacher (
  id int primary key,
  name varchar(50),
  dept_id int,
  foreign key (dept_id) references dept(id)
  on delete cascade
  on update cascade
);

-- 🎓 CREATE COURSES TABLE
create table courses (
  id int primary key,
  course varchar(50)
);

-- ➕ INSERT DATA INTO STUDENT
insert into student (rollno, name, marks, grade, city)
values
  (102, 'raj', 20, 'C', 'jhajha'),
  (103, 'raja', 30, 'P', 'mahapur'),
  (104, 'rk', 50, 'A+', 'punjab'),
  (105, 'mk', 90, 'P', 'delhi'),
  (106, 'neha', 75, 'B', 'patna'),
  (107, 'sahil', 85, 'A', 'ranchi'),
  (108, 'simran', 65, 'B+', 'kolkata'),
  (109, 'aman', 40, 'D', 'bhopal'),
  (110, 'pooja', 95, 'A+', 'mumbai'),
  (111, 'kunal', 55, 'C+', 'lucknow');

-- ➕ INSERT DATA INTO DEPT
insert into dept (id, name)
values 
  (1, 'Computer Science'),
  (2, 'Math'),
  (3, 'Physics');

-- ➕ INSERT DATA INTO TEACHER
insert into teacher (id, name, dept_id)
values
  (101, 'Dr. Sharma', 1),
  (102, 'Dr. Verma', 2),
  (103, 'Dr. Khan', 3);

-- ➕ INSERT DATA INTO COURSES
insert into courses (id, course)
values
  (102, 'english'),
  (105, 'math'),
  (103, 'science'),
  (107, 'computer science');

-- 🛠️ ALTER TABLE TO ADD AGE
alter table student
add column age int;

-- 🔍 BASIC SELECTS
select * from student;
select name, marks from student;
select * from student where marks > 30;
select * from student where city = 'punjab';

-- 📊 GROUP BY & HAVING
select city, count(name) as total_students, max(marks) as top_score
from student
group by city
having max(marks) > 90;

-- 🏙️ GROUP BY A+ GRADES
select city, max(marks) as max_marks
from student
where grade = 'A+'
group by city
having max(marks) > 90;

-- 🔁 ORDERED GROUP BY
select city
from student
where grade = 'A+'
group by city
having max(marks) > 90
order by city desc;

-- 🧹 UPDATE STUDENT MARKS & GRADE
set sql_safe_updates = 0;

update student
set marks = 12
where rollno = 105;

update student
set grade = 'O'
where grade = 'A';

-- 🔗 JOINS
select student.name, courses.course
from student
inner join courses
on student.rollno = courses.id;

-- 🔄 LEFT JOIN
select student.name, courses.course
from student
left join courses
on student.rollno = courses.id;

-- 🔍 SUBQUERY - Above Avg Marks
select name, marks
from student
where marks > (
  select avg(marks) from student
);

-- 🔍 SUBQUERY - Max Marks
select name, marks
from student
where marks = (
  select max(marks) from student
);

-- 🔍 SUBQUERY - Student in Courses
select name
from student
where rollno in (
  select id from courses
);

-- 🧹 TRUNCATE TABLE (only if needed)
-- truncate table student;
