create database university1;
use university1;

create table faculty(
faculty_id int not null,
faculty_name varchar(20),
department varchar(20),
salary double,
primary key(faculty_id)
);
insert into faculty(faculty_id,faculty_name,department,salary)
values(201,'Dr.Jane Miller','CS',95000),
(202,'Dr.Mark Davis','ME',88000),
(203,'Dr.Emily White','CE',91000);

create table student(
student_id int not null,
student_name varchar(20),
age int,
major varchar(20),
faculty_id int,
primary key(student_id),
foreign key(faculty_id) references faculty(faculty_id)
);

insert into student(student_id,student_name,age,major,faculty_id)
values(101,'Alice Brown',20,'CS',201),
(102,'John Doe',22,'ME',202),
(103,'Mary Johnson',21,'CE',203),
(104,'Sarah Connor',23,'CS',201),
(105,'Michael Smith',22,'EE',202);

create table course(
course_id varchar(20) not null,
course_name varchar(20),
department varchar(20),
credit int,
primary key(course_id)
);

insert into course(course_id,course_name,department,credit)
values('C001','Data structure','CS',3),
('C002','Thermodynamics','ME',3),
('C003','Structural Analysis','CE',4),
('C004','Machine Learning','CS',3);

create table enrollment(
enrollment_id varchar(20) not null,
student_id int,
course_id varchar(20), 
grade varchar(20),
primary key(enrollment_id),
foreign key(student_id) references student(student_id),
foreign key(course_id) references course(course_id)
);

insert into enrollment(enrollment_id,student_id,course_id,grade)
values('E001',101,'C001','A'),('E002',102,'C003','B'),('E003',103,'C003','A'),
('E004',104,'C004','A-'),('E005',104,'C002','B+');

select s.student_name,s.major,f.faculty_name
from student s
join faculty f on s.faculty_id=f.faculty_id
where major='CS';

select f.faculty_name,f.department,f.salary
from faculty f
where f.salary>90000;

select s.student_name,c.course_name,c.department
from student s
join enrollment e on s.student_id=e.student_id
join course c on e.course_id= c.course_id
where c.department='CS';

SELECT 
    C.course_name, 
    COUNT(E.student_id) AS student_count
FROM 
    Enrollment E
JOIN 
    Course C ON E.course_id = C.course_id
GROUP BY 
    C.course_name;
    
    select s.student_name,c.course_name,e.grade
    from enrollment e
    join course c on e.course_id=c.course_id
    join student s on s.student_id=s.student_id
    where e.grade='A';
    
    
    with GradeMapping as(
    select
    e.student_id,
    c.department,
    case
       when e.grade='A' then 4.0
       when e.grade='A-' then 3.7
       when e.grade='B+' then 3.3
       when e.grade='B' then 3.0
       
       end as avg_grade
       from enrollment e
       join course c on e.course_id=c.course_id
    )
    select department,avg(avg_grade) as GRADE
    from GradeMapping
    group by department;
    
    select c.student_name,c.student_id
    from student c
    join enrollment e on c.student_id=e.student_id
    where c.student_id not in(e.student_id);
    
    select c.course_name,c.credit
    from course c 
    where c.credit>3;
    
select department,avg(salary) as TOTAL_SALARY
from faculty
group by department;

select faculty_name,max(salary)
from faculty
group by faculty_name
order by max(salary) asc
limit 2;

-- 2nd maximum values
SELECT value
FROM your_table
ORDER BY value DESC
LIMIT 1 OFFSET 1;

-- Another way
SELECT MAX(value) AS second_max
FROM your_table
WHERE value < (SELECT MAX(value) FROM your_table);

-- Having
SELECT column_name, COUNT(*)
FROM your_table
GROUP BY column_name
HAVING COUNT(*) > 5;

-- 
SELECT column_name, AVG(value_column)
FROM your_table
WHERE some_condition = 'value'
GROUP BY column_name
HAVING AVG(value_column) > 10;

-- even
SELECT *
FROM your_table
WHERE MOD(column_name, 2) = 0;


-- odd

select * 
from jfjv
where MOD(column_name,2)=1;

-- Any (operator <,>)
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);
  
  -- Distinct
  
  SELECT DISTINCT column_name
FROM your_table;

--

SELECT COUNT(DISTINCT column_name)
FROM your_table;

-- If else
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

-- union
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

-- union all
-- The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:
SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;



