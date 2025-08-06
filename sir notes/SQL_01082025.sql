SIMPLE CASE:
============
SELECT id , name, mark,
CASE mark WHEN 900 THEN 'Excellent'
          WHEN 89 THEN 'Very Good'
          WHEN 80 THEN 'Good'
ELSE 'NOT KNOWN'
END as RANK
FROM student;

SEARCH CASE:
============
SELECT employee_id, first_name,salary,
CASE WHEN salary BETWEEN 20000 AND 25000 then 'High Sal' 
    WHEN salary BETWEEN 10000 AND 20000 then 'Medium Sal'
ELSE 'Low Salary'
END AS SAL_CATAGORY from employees;

select * from student;

SYNONYM:
========
CREATE SYNONYM syn_student FOR hr.student;
GRANT ALL ON syn_student TO oe;

desc student
alter table student add (course varchar2(20));

MULTI-TABLE INSERT:
===================
INSERT ALL
	INTO emp_job  VALUES (employee_id,first_name,job_id)
	INTO emp_dept VALUES (employee_id,first_name,department_id)
	INTO emp_hire  VALUES ( employee_id,last_name,hire_date)
	INTO emp_salary  VALUES ( employee_id,first_name,job_id,salary)
SELECT * FROM employees;

DATA DICTIONARY VIEWS:
======================
USER_* --- user/schema specific objects
ALL_*  --- user/schema specific + object for which permission granted by other USER
DBA_*  -- its for DBA --can view/access ALL in entire DB
V_$*   -- dynamic views to store performance related info


DBA -> create table -> hr --- is able to create table
hr -> create table -> oe 

grant create table to hr;
grant create table to hr WITH ADMIN OPTION;

hr -> select on hr.employees -> oe --- is able to select the table employees.
oe -> select  -> sh 

grant select on hr.employees to oe WITH GRANT OPTION;
oe grant select on hr.employees to sh;

user1 -> user2 -> user3 -> user4
   WITH GRANT OPTION

ANY & ALL:
==========
select * from employees 
WHERE salary > ALL (select salary from employees where department_id = 20);
