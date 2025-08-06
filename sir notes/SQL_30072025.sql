[NOT] IN OPERATOR:

IN (list_of_values);
------------------------------------------------------
IS [NOT] NULL;

SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL;
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;

[NOT] BETWEEN x AND y 
---------------------
select records between a range.

SELECT employee_id, first_name,salary from EMPLOYEES
WHERE salary BETWEEN 10000 AND 25000;

SELECT employee_id, first_name,salary from EMPLOYEES
WHERE salary NOT BETWEEN 10000 AND 25000;

EQUI-JOIN:
----------
SELECT 	e.employee_id, e.first_name, e.salary, e.department_id, 
		d.department_name, d.location_id
FROM 	employees e, departments d
WHERE 	e.department_id = d.department_id;

select o.id,o.name,t.mark from one o, two t where o.id = t.id;

LEFT OUTER JOIN:
-----------------
select o.id,o.name,o.mark, t.id,t.name 
FROM one o LEFT OUTER JOIN two t 
ON o.id = t.id;

RIGHT OUTER JOIN:
-----------------
select o.id,o.name,o.mark, t.id,t.name 
FROM one o RIGHT OUTER JOIN two t 
ON o.id = t.id;

FULL OUTER JOIN:
-----------------
select o.id,o.name,o.mark, t.id,t.name 
FROM one o FULL OUTER JOIN two t 
--ON o.id = t.id;
USING(id);

SELECT o.*
FROM one o, two t;

SELF JOIN:
----------
SELECT a.employee_id, a.first_name, a.manager_id, b.first_name Manager_name
FROM employees a, employees b 
WHERE a.manager_id = b.employee_id
order by a.employee_id;

SELECT e1.last_name||' works for '||e2.last_name 
   "Employees and Their Managers"
   FROM employees e1, employees e2 
   WHERE e1.manager_id = e2.employee_id
    AND e1.last_name LIKE 'R%'
   ORDER BY e1.last_name;

SELECT department_id AS d_e_dept_id, e.last_name
   FROM departments d FULL OUTER JOIN employees e
   USING (department_id)
   ORDER BY department_id, e.last_name;

SET OPERATORS:
--------------
SELECT id,name,mark FROM one
UNION
SELECT id,name,mark FROM two;

SELECT id,name,mark FROM one
UNION ALL
SELECT id,name,mark FROM two;

SELECT id,name,mark FROM one
INTERSECT
SELECT id,name,mark FROM two;

SELECT id,name,mark FROM one
MINUS
SELECT id,name,mark FROM two;

=============================================
CONSTRAINTS:
============
1. NOT NULL ---it WILL NOT accept NULL values, but can accept duplicate values.
				A table can have n of NOT NULL constraint.
				
2. UNIQUE	---it WILL accept NULL values, but WILL NOT ACCEPT duplicate values.
				A table can have n of UNIQUE constraint.

3. PRIMARY KEY -- it is the combination of NOT NULL & UNIQUE.
				it will not accept NULL and DUPLICATE values.
				A table can have ONLY ONE Primary key (PK)
4. CHECK <condition> -- checks if the data obeys the condition.

5. FOREIGN KEY -- references the MASTER table and its columns to allow values in 
					DETAILS table and its columns
				  A table can have n of FOREIGN KEY constraint.
				1. Master table must have been created already
				2. the referenced COLUMN should be PK in the master table.
				3. referencing and referenced column names need not be same, but
					the data type and width should be same.
					
CREATE TABLE student (sid number , name varchar2(20), mark number(3) NOT NULL);

CREATE TABLE student (sid number , name varchar2(20), mark number(3) NOT NULL,
  email varchar2(20) UNIQUE);
  
CREATE TABLE student (sid number(4) PRIMARY KEY, name varchar2(20), mark number(3) NOT NULL,
  email varchar2(20) UNIQUE);
  
 CREATE TABLE student (sid number(4) PRIMARY KEY, name varchar2(20),
  mark number(3) CHECK (mark <= 100),
  email varchar2(20) UNIQUE);
  
CREATE TABLE master (deptid NUMBER(4) PRIMARY KEY, dname varchar2(20));

CREATE TABLE details (empid number(4) PRIMARY KEY, name VARCHAR2(20), 
						department_id NUMBER(4) REFERENCES master(deptid) 
						ON DELETE CASCADE) ;
CREATE TABLE details (empid number(4) PRIMARY KEY, name VARCHAR2(20), 
						department_id NUMBER(4) REFERENCES master(deptid) 
						ON DELETE SET NULL) ;

1. ON DELETE CASCADE	--when delete the master record, automatically the child record also will be deleted
2. ON DELETE SET NULL	--when delete the master record, it will set NULL TO child records

1. IN-LINE CONSTRAINTS -- the constrains assigned along with the column definition.
2. OUT-OF-LINE CONSTRAINTS -- the constrains assigned at table level.

CREATE TABLE STUDENT (sid NUMBER(4), course_ID number(4), name varchar2(20),phone number(10), email varchar2(40),
						PRIMARY KEY (sid, course_id), UNIQUE(phone,email) );
COMPOSITE PRIMARY KEY -- when a PK is assigned to more than one column	

CREATE TABLE details (empid number(4) PRIMARY KEY, name VARCHAR2(20), 
						department_id NUMBER(4), 
						FOREIGN KEY(department_id) REFERENCES master (deptid)  ) ;	

CREATE TABLE STUDENT (sid NUMBER(4) CONSTRAINT pk_sid PRIMARY KEY, name varchar2(20),
						phone NUMBER(10) CONSTRAINT uq_ph UNIQUE);

ALTER TABLE student ADD CONSTRAINT pk_sid PRIMARY KEY(sid);

ALTER TABLE STUDENT DROP CONSTRAINT PK_SID;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME ='STUDENT';

SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME ='MASTER';

SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME ='DETAILS';
===========================================================================
SEQUENCE:
---------
CREATE SEQUENCE sq_sid
INCREMENT BY 1
MAXVALUE 10
NOCACHE
CYCLE;

sequence_name.NEXTVAL
sequence_name.CURRVAL

sq_sid.NEXTVAL
sq_sid.CURRVAL

INSERT INTO student VALUES (sq_sid.NEXTVAL,'ABC',90);
 SELECT SQ_SID.CURRVAL FROM DUAL;
 
DROP SEUQENCE <sequence_name>;
DROP SEQUENCE sq_sid;

SELECT * FROM USER_SEQUENCES; -- WHERE SEQUENCE_NAME = 'SQ_SID';

===========================================================================
VIEW:
-----
CREATE OR REPLACE  VIEW emp_deptid_50 (empid, name, job, deptid, sal)
AS SELECT employee_id, first_name, job_id, department_id,salary
FROM emp where department_id =30 ;

CREATE OR REPLACE  VIEW emp_deptid_50 (empid, name, job, deptid, sal)
AS SELECT employee_id, first_name, job_id, department_id,salary
FROM emp where department_id =30 WITH READ ONLY;

CREATE OR REPLACE  VIEW emp_deptid_50 (empid, name, job, deptid, sal)
AS SELECT employee_id, first_name, job_id, department_id,salary
FROM emp where department_id =30 WITH CHECK OPTION;

insert into emp_deptid_50 values (501,'DKFLKJ','MANAGER',501,99999);

SELECT * FROM USER_VIEWS WHERE VIEW_NAME = 'EMP_DEPTID_50';

Simple VIEW		-- based on a SINGLE table and without any group by clause
				    -- you can do DML operations
Complex View	-- based on two or more tables and having joins, group glause.
					-- you can not do DML operations
			
