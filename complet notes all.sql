OBJECT RELATIONAL DATABASE MANAGEMENT SYSTEM (ORDBMS)

What is Data?
-------------
~ is piece of meaningfull information about sb/sth

Raja is a Manager working in Wipro with 50K salary.
				
What is Record?
---------------
group of related data arranged in Row

What is column?
---------------
which is having same kind of data vertically

What is table?
--------------
Rows and columns

What is Database?
----------------
Group of related tables.

=====================================================================================
1. SQL 			Structured Query Language
2. PL/SQL		Procedural Language / Structured Query Language
=====================================================================================
CREATING TABLE:
===============
1. Create a NEW table:
----------------------
	CREATE TABLE <table_name> 
	( <col_name> DATA_TYPE[(width)], ...);
	
	CREATE TABLE student 
	( sid NUMBER(4), sname VARCHAR2(30), mark NUMBER(3), rank NUMBER(2) );

To see the structure of the table:
----------------------------------
DESC [RIBE] <table_name>

DESCRIBE student
DESC student

To see all the tables:
--------------------------
SELECT * FROM tab; (table)

2. To create a table from already existing one:
-----------------------------------------------
CREATE TABLE <new_tab_name> AS
SELECT * FROM <old_tab_name>;

CREATE TABLE emp AS
SELECT * FROM employees;

3. To create a table WITH FEW COLUMNS from already existing one:
----------------------------------------------------------------
CREATE TABLE <new_tab_name> AS
SELECT col1,col2,... FROM <old_tab_name>;

CREATE TABLE emp_1 AS
SELECT employee_id, first_name, email, job_id FROM employees;

4. To create a table WITH NEW COLUMNS NAMES from already existing one:
---------------------------------------------------------------------
CREATE TABLE <new_tab_name>(new_col_name1, new_col_name2,...) AS
SELECT col1,col2,... FROM <old_tab_name>;

CREATE TABLE emp_2 (empid,name,email,job) AS
SELECT employee_id, first_name, email, job_id FROM employees;
===============================================================================
MODIFYING TABLE:
===============
1. add column
2. drop column
3. rename column
4. change data type of a column

1. To Add new column to a table:
-----------------------------
ALTER TABLE <tab_name> 
ADD (col_name data_type [(width)], ...);

ALTER TABLE student
ADD (dob DATE, course VARCHAR2(5));

2. To rename a column in a table:
--------------------------------
ALTER TABLE <table_name>
RENAME COLUMN <old_column_name> TO <new_col_name>;

ALTER TABLE student
RENAME COLUMN dob TO date_of_birth;

3. To drop column from a table:
--------------------------------
ALTER TABLE <table_name>
DROP COLUMN <column_name>;				-- To drop single column

ALTER TABLE <table_name>
DROP (col_name1, col_name2,...);		-- To drop multiple columns

ALTER TABLE student
DROP COLUMN rank;

ALTER TABLE student
DROP (course, sname);

4. To change the datatype of a column :
---------------------------------------
ALTER TABLE <table_name>
MODIFY (col_name new_data_type[(width)], ...);

ALTER TABLE student
MODIFY (mark varchar2(3));

Restrictions on Table and Column Names:
----------------------------------------
1. names can be upto 30 chars
2. should start with character followed by alphanumeric
3. a table can have max 1000 columns
4. no space is allowed
5. if you need space then enclose the names in double quots
6. table name should be unique in a schema
7. column name should be unique in the table.
------------------------------------------------------------------
TO Drop a Table:
----------------
DROP TABLE <table_name>;
DROP TABLE student;
------------------------------------------------------------------
What is Data Dictionary?
------------------------
it is system tables - data of data.

select * from user_tables;			--To view tables
select * from user_tab_columns;		--To view columns in tables
==================================================================
SELECT STATEMENT: - To retrive(view) the data from a table.
-----------------
1. To select all rows and columns:
----------------------------------
SELECT * FROM <table_name>;
SELECT * FROM emp;

2. To select specific columns:
----------------------------------
SELECT col_name1, col_name2, ... FROM <table_name>;
SELECT first_name, email,salary FROM emp;

3. To Assign Alias name:
----------------------------------
SELECT col_name1 [AS] <alias_name>, col_name2 [AS] <alias_name>,... FROM <table_name>;

SELECT first_name AS name, email,salary compensation FROM emp;
SELECT first_name  "name", email,salary "Sal Comp" FROM emp; 
==================================================================
INSERT STATEMENT: -- To add NEW record/row into a table
-----------------
1. To insert into a new table for ALL columns:
----------------------------------------------
INSERT INTO <table_name> VALUES (val_1,val_2,...);
INSERT INTO student VALUES (1,'RAJA',90,1);

2. To insert multiple rows at a time:
-------------------------------------
INSERT INTO student VALUES (&sid, &name,&mark,&rank);
/
3 To insert into specific columns:
-----------------------------------
INSERT INTO <table_name> (col_name1,col_name2,...) VALUES (val_1,val_2,...);
INSERT INTO student (sid, mark) VALUES (6,89);

4 To insert into another table for all columns:
-----------------------------------------------
INSERT INTO <dest_tab_name> SELECT * FROM <source_tab_name>;
INSERT INTO emp SELECT * FROM employees;

4 To insert into another table for specific columns:
-----------------------------------------------
INSERT INTO <dest_tab_name>(col_name1,col_name2,...) 
SELECT col_name1,col_name2,... FROM <source_tab_name>;

INSERT INTO emp (first_name, salary)
SELECT first_name, salary FROM employees;
===================================================================
UPDATE STATEMENT: -- To modify/change the values of ALREADY EXISTING records.
-----------------
UPDATE <table_name>
SET col_name = <value>, col_name = <value>,...
[WHERE <condition>];

UPDATE student
SET sname = 'VIJAY', rank = 2
WHERE sid = 6;

UPDATE student
SET  rank = 3
WHERE mark = 89;
===================================================================
DELETE STATEMENT: -- To remove few / all records from a table
----------------
DELETE FROM <table_name>
[WHERE <condition>];

DELETE FROM student;		-- Deletes all records

DELETE FROM student
WHERE mark = 89;
==================================================================
WHERE CLAUSE: -- To filter the records
-------------
WHERE <condition>

SELECT * FROM employees 
WHERE employee_id = 101;

SELECT * FROM employees 
WHERE salary > 14000;
==================================================================
TRUNCATE STATEMENT: -- To REMOVE ALL records/Rows from a table
-------------------
TRUNCATE TABLE <table_name>;
TRUNCATE TABLE student;

		DELETE									TRUNCATE
		------									--------
1. Specific rows can be deleted			Can not specific rows. Can delete only all Rows
2. slower than Truncate 				Faster than delete
3. can be rolledback					cant rollback
==================================================================
COMMIT: --To save the changes permenently into the HDD/DB
-------
commit;

ROLLBACK: -- To undo the changes upto the last commit
---------
rollback;

commit;
insert ......
commit;  ---stops here.
insert .....
update .....
delete .....
select .....
update .....
rollback;

ROLLBACK TO SAVEPOINT -- To partially rollback
----------------------
insert ....
commit;
insert ....
save point a;
insert ....
update ....
save point c;
delete ....
save point b;
update ....

rollback to savepoint b;


===================================================================================================================

MERGE INTO <target_table> alias
USING <source_table> alias ON (<condition>)
WHEN MATCHED THEN UPDATE SET col=val,...
WHEN NOT MATCHED THEN INSERT (col_list) VALUES (val_list);


MERGE INTO dest d 
USING source s  ON (s.id = d.id)
WHEN MATCHED THEN UPDATE SET d.name = s.name, d.mark = s.mark
WHEN NOT MATCHED THEN INSERT (d.id,d.name,d.mark) VALUES (s.id,s.name,s.mark);

=============================================================================================================================

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
			



============================================================================================================

Write SQL Query to Display FIRST_NAME with Alias EMPLOYEE_NAME.
Write SQL Query to Display FIRST_NAME in Upper Case from the Employees Table.
Write SQL Query to Display Unique DEPARTMENT Values from the Employees Table.
Write SQL Query to Display the First 3 Chars of FIRST_NAME from the Employees Table.
Write SQL Query to Find the Position of Alphabet ‘a’ in the FIRST_NAME Column.
Write SQL Query to Fetch FIRST_NAME from the Employees Table With No White Spaces on the Right.
Write SQL Query to List DEPARTMENT from the Employees Table With No White Spaces on the Left.
Write SQL Query to Display Unique DEPARTMENT Values and Their Lengths from the Employees Table.
Write SQL Query to Replace ‘a’ with ‘A’ in FIRST_NAME from the Employees Table.
Write SQL Query to Combine FIRST_NAME and LAST_NAME into COMPLETE_NAME.
Write SQL Query to Print Employees Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending.
Write SQL Query to Print Employees Details with First Names “Valli” and “Karen”.
Write SQL Query to Print Employees Details Excluding First Names “Valli” and “Karen”.
Write SQL Query to Print Employees Details with DEPARTMENT Name as “Admin”.
Write SQL Query to Print Employees Details Whose FIRST_NAME Contains ‘a’.
Write SQL Query to List Employees Info Whose FIRST_NAME Ends with ‘r’.
Write SQL Query to Fetch Employeess Whose FIRST_NAME Ends with ‘h’ and Has 6 Letters.
Write SQL Query to Show Employees Info Whose SALARY is Between 10000 & 20000.
Write SQL Query to Display Employeess Who Joined in 07-MAR-06
Write SQL Query to Print Employee Count in ‘Admin’ Department.
Write SQL Query to Fetch Employees Names with Salaries >= 5000 and <= 10000.
Write SQL Query to List Employees Count Per Department in Descending Order.
Write SQL Query to Clone a New Table from Another Table.
Write SQL Query to Display Intersecting Records of Two Tables.
Write SQL Query to Show Records from One Table That Are Not Present in Another Table.
Write SQL Query to Show the Current Date and Time.
Write SQL Query to Fetch Departments with Less than Five People in Them.
Write SQL Query to Show All Departments with the Number of People in There.
Write SQL Query to Fetch Departments and Their Total Salaries.
---------------------------------------------------------------------
Which code snippet will alter the table LOCATIONS and change the datatype of the column CITY to varchar2(30)?

A - ALTER TABLE locations MODIFY COLUMN (city varchar2(30));
B - MODIFY TABLE locations ADD (city varchar2(30));
C - ALTER TABLE locations MODIFY (city varchar2(30));
D - None of the above.
---------------------------------------------------------------------
Which of the following is true about Cartesian Products?

A - A Cartesian product is formed when a join condition is omitted.
B - A Cartesian product is formed when a join condition is valid.
C - Some rows in the first table are joined to all rows in the second table.
D - All rows in the first table are joined to some rows in the second table.
---------------------------------------------------------------------
Which code snippet will alter the table LOCATIONS and add a column named Address, with datatype VARCHAR2(100)?

A - ALTER TABLE locations ADD (address varchar2(100));
B - ALTER TABLE locations ADD COLUMN(address varchar2(100));
C - MODIFY TABLE locations ADD COLUMN (address varchar2(100));
D - None of the above.
---------------------------------------------------------------------
Q - Which of the following is true about database indexes?

A - You can create an index on one or more columns.
B - Indexes always slow down the speed of query process.
C - Indexes are always created automatically.
D - Indexes should ideally be created on small tables.
---------------------------------------------------------------------
Q - Which of the following is not true about a sequence?

A - They are used for generating sequential numbers.
B - Sequences are created by the CREATE SEQUENCE statement.
C - You cannot modify a sequence.
D - None of the above.
---------------------------------------------------------------------
 - Which of the following functions can be used on both numeric as well as non-numeric data?

A - COUNT
B - AVG
C - STDDEV
D - VARIANCE
---------------------------------------------------------------------
Q - Consider the following schema −

LOCATIONS(subject_code, department_name, location_id, city);

Which code snippet will alter the table LOCATIONS and delete the column named CITY?

A - MODIFY TABLE locations DROP (city varchar2(30));
B - ALTER TABLE locations DROP COLUMN city;
C - ALTER TABLE locations DROP (city);
D - None of the above.
---------------------------------------------------------------------
Q - Which of the following code will create an index named stu_marks_ind on the columns student_code and percentage_of_marks of the STUDENTS table?

A - Itâ€™s not possible to create an index on two columns.
B - create index stu_marks_ind from students(student_code, percentage_of_marks);
C - create index stu_marks_ind on students(student_code, percentage_of_marks);
D - create index stu_marks_ind (student_code, percentage_of_marks) on students;
---------------------------------------------------------------------
Q - Which of the following code will successfully delete the table LOCATIONS from the database?

A - DROP TABLE locations;
B - DELETE TABLE locations;
C - TRUNCATE TABLE locations;
D - None of the above.
---------------------------------------------------------------------
Q - Which of the following is not a group function?

A - SUM
B - NVL
C - COUNT
D - MIN
---------------------------------------------------------------------
Q - What is returned by ROUND(789.8389, 2)?

A - 789.84
B - 789.83
C - 78
D - 789.00
---------------------------------------------------------------------
What is the purpose of the SQL keyword “DISTINCT” in a SELECT statement?
a) To retrieve unique values from a column
b) To filter NULL values
c) To delete duplicate records
d) To sort the result set
---------------------------------------------------------------------
 Which statement(s) are mandatory in a simple SQL SELECT statement?
a) Select, From
b) Select, OrderBy
c) Select, Where
d) Select, GroupBy
---------------------------------------------------------------------
Which of the following is a default join type?
a) Right join
b) Left join
c) Inner join
d) Outer join
---------------------------------------------------------------------
Which SQL keyword is used to sort the data returned by a SELECT statement?
a) Group
b) Order
c) Group By
d) Order By
---------------------------------------------------------------------
The SQL LIKE operator is used in which of the following clause?
a) Having
b) Select
c) Where
d) Group by
=====================================================================================================================





SQL> desc student
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER
 NAME                                               VARCHAR2(20)
 PHONE                                              NUMBER

SQL> select * from student;

        ID NAME                      PHONE                                      
---------- -------------------- ----------                                      
         1 ABC                          90                                      
         2 ABC                          90                                      
         3 ABC                          90                                      
         4 ABC                          90                                      
         5 ABC                          90                                      
         6 ABC                          90                                      
         7 ABC                          90                                      
         8 ABC                          90                                      
         9 ABC                          90                                      
        10 ABC                          90                                      
         1 ABC                          90                                      

        ID NAME                      PHONE                                      
---------- -------------------- ----------                                      
         2 ABC                          90                                      
         3 ABC                          90                                      
         4 ABC                          90                                      
         5 ABC                          90                                      

15 rows selected.

SQL> truncate table student;

Table truncated.

SQL> set pagesize 1000 linesize 100

SQL> alter table student add(mark number(4));

Table altered.

SQL> desc student
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 ID                                                             NUMBER
 NAME                                                           VARCHAR2(20)
 PHONE                                                          NUMBER
 MARK                                                           NUMBER(4)

SQL> insert into student values (&id,'&name',&phone,&mark);
Enter value for id: 1
Enter value for name: raja
Enter value for phone: 8765
Enter value for mark: 90
old   1: insert into student values (&id,'&name',&phone,&mark)
new   1: insert into student values (1,'raja',8765,90)

1 row created.

SQL> /
Enter value for id: 2
Enter value for name: rani
Enter value for phone: 5647
Enter value for mark: 89
old   1: insert into student values (&id,'&name',&phone,&mark)
new   1: insert into student values (2,'rani',5647,89)

1 row created.

SQL> /
Enter value for id: 3
Enter value for name: king
Enter value for phone: 5363
Enter value for mark: 80
old   1: insert into student values (&id,'&name',&phone,&mark)
new   1: insert into student values (3,'king',5363,80)

1 row created.

SQL> /
Enter value for id: 4
Enter value for name: queen
Enter value for phone: 60
Enter value for mark: 70
old   1: insert into student values (&id,'&name',&phone,&mark)
new   1: insert into student values (4,'queen',60,70)

1 row created.

SQL> commit;

Commit complete.

SQL> select * from student
  2  ;

        ID NAME                      PHONE       MARK                                               
---------- -------------------- ---------- ----------                                               
         1 raja                       8765         90                                               
         2 rani                       5647         89                                               
         3 king                       5363         80                                               
         4 queen                        60         70                                               

SQL> update student set phone=8740 where id = 4;

1 row updated.

SQL> commit;

Commit complete.

SQL> clear scr

SQL> SELECT * FROM STUDENT;

        ID NAME                      PHONE       MARK                                               
---------- -------------------- ---------- ----------                                               
         1 raja                       8765         90                                               
         2 rani                       5647         89                                               
         3 king                       5363         80                                               
         4 queen                      8740         70                                               

SQL> INSERT INTO STUDENT VALUES (5,'ABC',7387,90);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> CONN hr/hr@orclpdb
Connected.
SQL> desc emp_job
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                                    NUMBER(6)
 FIRST_NAME                                                     VARCHAR2(20)
 JOB_ID                                                NOT NULL VARCHAR2(10)

SQL> desc emp_dept
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                                    NUMBER(6)
 FIRST_NAME                                                     VARCHAR2(20)
 DEPARTMENT_ID                                                  NUMBER(4)

SQL> desc emp_hire
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                                    NUMBER(6)
 LAST_NAME                                             NOT NULL VARCHAR2(25)
 HIRE_DATE                                             NOT NULL DATE

SQL> desc emp_salary
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                                    NUMBER(6)
 FIRST_NAME                                                     VARCHAR2(20)
 JOB_ID                                                NOT NULL VARCHAR2(10)
 SALARY                                                         NUMBER(8,2)

SQL> conn sys/oracle@orclpdb as sysdba
Connected.
SQL> create public synonym pub_sy_student FOR hr.student;

Synonym created.

SQL> grant all on pub_sy_student to public;

Grant succeeded.

SQL> drop public synonym pub_sy_student;

Synonym dropped.

SQL> desc employees
ERROR:
ORA-04043: object employees does not exist 


SQL> conn hr/hr@orclpdb
Connected.
SQL> desc employees
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                           NOT NULL NUMBER(6)
 FIRST_NAME                                                     VARCHAR2(20)
 LAST_NAME                                             NOT NULL VARCHAR2(25)
 EMAIL                                                 NOT NULL VARCHAR2(25)
 PHONE_NUMBER                                                   VARCHAR2(20)
 HIRE_DATE                                             NOT NULL DATE
 JOB_ID                                                NOT NULL VARCHAR2(10)
 SALARY                                                         NUMBER(8,2)
 COMMISSION_PCT                                                 NUMBER(2,2)
 MANAGER_ID                                                     NUMBER(6)
 DEPARTMENT_ID                                                  NUMBER(4)

SQL> conn sys/oracle@orclpdb as sysdba
Connected.
SQL> grant create table to oe;

Grant succeeded.

SQL> conn hr/hr@orclpdb
Connected.
SQL> desc user_tables;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 TABLE_NAME                                            NOT NULL VARCHAR2(128)
 TABLESPACE_NAME                                                VARCHAR2(30)
 CLUSTER_NAME                                                   VARCHAR2(128)
 IOT_NAME                                                       VARCHAR2(128)
 STATUS                                                         VARCHAR2(8)
 PCT_FREE                                                       NUMBER
 PCT_USED                                                       NUMBER
 INI_TRANS                                                      NUMBER
 MAX_TRANS                                                      NUMBER
 INITIAL_EXTENT                                                 NUMBER
 NEXT_EXTENT                                                    NUMBER
 MIN_EXTENTS                                                    NUMBER
 MAX_EXTENTS                                                    NUMBER
 PCT_INCREASE                                                   NUMBER
 FREELISTS                                                      NUMBER
 FREELIST_GROUPS                                                NUMBER
 LOGGING                                                        VARCHAR2(3)
 BACKED_UP                                                      VARCHAR2(1)
 NUM_ROWS                                                       NUMBER
 BLOCKS                                                         NUMBER
 EMPTY_BLOCKS                                                   NUMBER
 AVG_SPACE                                                      NUMBER
 CHAIN_CNT                                                      NUMBER
 AVG_ROW_LEN                                                    NUMBER
 AVG_SPACE_FREELIST_BLOCKS                                      NUMBER
 NUM_FREELIST_BLOCKS                                            NUMBER
 DEGREE                                                         VARCHAR2(10)
 INSTANCES                                                      VARCHAR2(10)
 CACHE                                                          VARCHAR2(5)
 TABLE_LOCK                                                     VARCHAR2(8)
 SAMPLE_SIZE                                                    NUMBER
 LAST_ANALYZED                                                  DATE
 PARTITIONED                                                    VARCHAR2(3)
 IOT_TYPE                                                       VARCHAR2(12)
 TEMPORARY                                                      VARCHAR2(1)
 SECONDARY                                                      VARCHAR2(1)
 NESTED                                                         VARCHAR2(3)
 BUFFER_POOL                                                    VARCHAR2(7)
 FLASH_CACHE                                                    VARCHAR2(7)
 CELL_FLASH_CACHE                                               VARCHAR2(7)
 ROW_MOVEMENT                                                   VARCHAR2(8)
 GLOBAL_STATS                                                   VARCHAR2(3)
 USER_STATS                                                     VARCHAR2(3)
 DURATION                                                       VARCHAR2(15)
 SKIP_CORRUPT                                                   VARCHAR2(8)
 MONITORING                                                     VARCHAR2(3)
 CLUSTER_OWNER                                                  VARCHAR2(128)
 DEPENDENCIES                                                   VARCHAR2(8)
 COMPRESSION                                                    VARCHAR2(8)
 COMPRESS_FOR                                                   VARCHAR2(30)
 DROPPED                                                        VARCHAR2(3)
 READ_ONLY                                                      VARCHAR2(3)
 SEGMENT_CREATED                                                VARCHAR2(3)
 RESULT_CACHE                                                   VARCHAR2(7)
 CLUSTERING                                                     VARCHAR2(3)
 ACTIVITY_TRACKING                                              VARCHAR2(23)
 DML_TIMESTAMP                                                  VARCHAR2(25)
 HAS_IDENTITY                                                   VARCHAR2(3)
 CONTAINER_DATA                                                 VARCHAR2(3)
 INMEMORY                                                       VARCHAR2(8)
 INMEMORY_PRIORITY                                              VARCHAR2(8)
 INMEMORY_DISTRIBUTE                                            VARCHAR2(15)
 INMEMORY_COMPRESSION                                           VARCHAR2(17)
 INMEMORY_DUPLICATE                                             VARCHAR2(13)
 DEFAULT_COLLATION                                              VARCHAR2(100)
 DUPLICATED                                                     VARCHAR2(1)
 SHARDED                                                        VARCHAR2(1)
 EXTERNAL                                                       VARCHAR2(3)
 CELLMEMORY                                                     VARCHAR2(24)
 CONTAINERS_DEFAULT                                             VARCHAR2(3)
 CONTAINER_MAP                                                  VARCHAR2(3)
 EXTENDED_DATA_LINK                                             VARCHAR2(3)
 EXTENDED_DATA_LINK_MAP                                         VARCHAR2(3)
 INMEMORY_SERVICE                                               VARCHAR2(12)
 INMEMORY_SERVICE_NAME                                          VARCHAR2(1000)
 CONTAINER_MAP_OBJECT                                           VARCHAR2(3)

SQL> desc all_tables
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 OWNER                                                 NOT NULL VARCHAR2(128)
 TABLE_NAME                                            NOT NULL VARCHAR2(128)
 TABLESPACE_NAME                                                VARCHAR2(30)
 CLUSTER_NAME                                                   VARCHAR2(128)
 IOT_NAME                                                       VARCHAR2(128)
 STATUS                                                         VARCHAR2(8)
 PCT_FREE                                                       NUMBER
 PCT_USED                                                       NUMBER
 INI_TRANS                                                      NUMBER
 MAX_TRANS                                                      NUMBER
 INITIAL_EXTENT                                                 NUMBER
 NEXT_EXTENT                                                    NUMBER
 MIN_EXTENTS                                                    NUMBER
 MAX_EXTENTS                                                    NUMBER
 PCT_INCREASE                                                   NUMBER
 FREELISTS                                                      NUMBER
 FREELIST_GROUPS                                                NUMBER
 LOGGING                                                        VARCHAR2(3)
 BACKED_UP                                                      VARCHAR2(1)
 NUM_ROWS                                                       NUMBER
 BLOCKS                                                         NUMBER
 EMPTY_BLOCKS                                                   NUMBER
 AVG_SPACE                                                      NUMBER
 CHAIN_CNT                                                      NUMBER
 AVG_ROW_LEN                                                    NUMBER
 AVG_SPACE_FREELIST_BLOCKS                                      NUMBER
 NUM_FREELIST_BLOCKS                                            NUMBER
 DEGREE                                                         VARCHAR2(10)
 INSTANCES                                                      VARCHAR2(10)
 CACHE                                                          VARCHAR2(5)
 TABLE_LOCK                                                     VARCHAR2(8)
 SAMPLE_SIZE                                                    NUMBER
 LAST_ANALYZED                                                  DATE
 PARTITIONED                                                    VARCHAR2(3)
 IOT_TYPE                                                       VARCHAR2(12)
 TEMPORARY                                                      VARCHAR2(1)
 SECONDARY                                                      VARCHAR2(1)
 NESTED                                                         VARCHAR2(3)
 BUFFER_POOL                                                    VARCHAR2(7)
 FLASH_CACHE                                                    VARCHAR2(7)
 CELL_FLASH_CACHE                                               VARCHAR2(7)
 ROW_MOVEMENT                                                   VARCHAR2(8)
 GLOBAL_STATS                                                   VARCHAR2(3)
 USER_STATS                                                     VARCHAR2(3)
 DURATION                                                       VARCHAR2(15)
 SKIP_CORRUPT                                                   VARCHAR2(8)
 MONITORING                                                     VARCHAR2(3)
 CLUSTER_OWNER                                                  VARCHAR2(128)
 DEPENDENCIES                                                   VARCHAR2(8)
 COMPRESSION                                                    VARCHAR2(8)
 COMPRESS_FOR                                                   VARCHAR2(30)
 DROPPED                                                        VARCHAR2(3)
 READ_ONLY                                                      VARCHAR2(3)
 SEGMENT_CREATED                                                VARCHAR2(3)
 RESULT_CACHE                                                   VARCHAR2(7)
 CLUSTERING                                                     VARCHAR2(3)
 ACTIVITY_TRACKING                                              VARCHAR2(23)
 DML_TIMESTAMP                                                  VARCHAR2(25)
 HAS_IDENTITY                                                   VARCHAR2(3)
 CONTAINER_DATA                                                 VARCHAR2(3)
 INMEMORY                                                       VARCHAR2(8)
 INMEMORY_PRIORITY                                              VARCHAR2(8)
 INMEMORY_DISTRIBUTE                                            VARCHAR2(15)
 INMEMORY_COMPRESSION                                           VARCHAR2(17)
 INMEMORY_DUPLICATE                                             VARCHAR2(13)
 DEFAULT_COLLATION                                              VARCHAR2(100)
 DUPLICATED                                                     VARCHAR2(1)
 SHARDED                                                        VARCHAR2(1)
 EXTERNAL                                                       VARCHAR2(3)
 CELLMEMORY                                                     VARCHAR2(24)
 CONTAINERS_DEFAULT                                             VARCHAR2(3)
 CONTAINER_MAP                                                  VARCHAR2(3)
 EXTENDED_DATA_LINK                                             VARCHAR2(3)
 EXTENDED_DATA_LINK_MAP                                         VARCHAR2(3)
 INMEMORY_SERVICE                                               VARCHAR2(12)
 INMEMORY_SERVICE_NAME                                          VARCHAR2(1000)
 CONTAINER_MAP_OBJECT                                           VARCHAR2(3)

SQL> show user
USER is "HR"
SQL> conn sys/oracle@orclpdb as sysdba
Connected.
SQL> desc sys.dba_tables
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 OWNER                                                 NOT NULL VARCHAR2(128)
 TABLE_NAME                                            NOT NULL VARCHAR2(128)
 TABLESPACE_NAME                                                VARCHAR2(30)
 CLUSTER_NAME                                                   VARCHAR2(128)
 IOT_NAME                                                       VARCHAR2(128)
 STATUS                                                         VARCHAR2(8)
 PCT_FREE                                                       NUMBER
 PCT_USED                                                       NUMBER
 INI_TRANS                                                      NUMBER
 MAX_TRANS                                                      NUMBER
 INITIAL_EXTENT                                                 NUMBER
 NEXT_EXTENT                                                    NUMBER
 MIN_EXTENTS                                                    NUMBER
 MAX_EXTENTS                                                    NUMBER
 PCT_INCREASE                                                   NUMBER
 FREELISTS                                                      NUMBER
 FREELIST_GROUPS                                                NUMBER
 LOGGING                                                        VARCHAR2(3)
 BACKED_UP                                                      VARCHAR2(1)
 NUM_ROWS                                                       NUMBER
 BLOCKS                                                         NUMBER
 EMPTY_BLOCKS                                                   NUMBER
 AVG_SPACE                                                      NUMBER
 CHAIN_CNT                                                      NUMBER
 AVG_ROW_LEN                                                    NUMBER
 AVG_SPACE_FREELIST_BLOCKS                                      NUMBER
 NUM_FREELIST_BLOCKS                                            NUMBER
 DEGREE                                                         VARCHAR2(10)
 INSTANCES                                                      VARCHAR2(10)
 CACHE                                                          VARCHAR2(5)
 TABLE_LOCK                                                     VARCHAR2(8)
 SAMPLE_SIZE                                                    NUMBER
 LAST_ANALYZED                                                  DATE
 PARTITIONED                                                    VARCHAR2(3)
 IOT_TYPE                                                       VARCHAR2(12)
 TEMPORARY                                                      VARCHAR2(1)
 SECONDARY                                                      VARCHAR2(1)
 NESTED                                                         VARCHAR2(3)
 BUFFER_POOL                                                    VARCHAR2(7)
 FLASH_CACHE                                                    VARCHAR2(7)
 CELL_FLASH_CACHE                                               VARCHAR2(7)
 ROW_MOVEMENT                                                   VARCHAR2(8)
 GLOBAL_STATS                                                   VARCHAR2(3)
 USER_STATS                                                     VARCHAR2(3)
 DURATION                                                       VARCHAR2(15)
 SKIP_CORRUPT                                                   VARCHAR2(8)
 MONITORING                                                     VARCHAR2(3)
 CLUSTER_OWNER                                                  VARCHAR2(128)
 DEPENDENCIES                                                   VARCHAR2(8)
 COMPRESSION                                                    VARCHAR2(8)
 COMPRESS_FOR                                                   VARCHAR2(30)
 DROPPED                                                        VARCHAR2(3)
 READ_ONLY                                                      VARCHAR2(3)
 SEGMENT_CREATED                                                VARCHAR2(3)
 RESULT_CACHE                                                   VARCHAR2(7)
 CLUSTERING                                                     VARCHAR2(3)
 ACTIVITY_TRACKING                                              VARCHAR2(23)
 DML_TIMESTAMP                                                  VARCHAR2(25)
 HAS_IDENTITY                                                   VARCHAR2(3)
 CONTAINER_DATA                                                 VARCHAR2(3)
 INMEMORY                                                       VARCHAR2(8)
 INMEMORY_PRIORITY                                              VARCHAR2(8)
 INMEMORY_DISTRIBUTE                                            VARCHAR2(15)
 INMEMORY_COMPRESSION                                           VARCHAR2(17)
 INMEMORY_DUPLICATE                                             VARCHAR2(13)
 DEFAULT_COLLATION                                              VARCHAR2(100)
 DUPLICATED                                                     VARCHAR2(1)
 SHARDED                                                        VARCHAR2(1)
 EXTERNAL                                                       VARCHAR2(3)
 CELLMEMORY                                                     VARCHAR2(24)
 CONTAINERS_DEFAULT                                             VARCHAR2(3)
 CONTAINER_MAP                                                  VARCHAR2(3)
 EXTENDED_DATA_LINK                                             VARCHAR2(3)
 EXTENDED_DATA_LINK_MAP                                         VARCHAR2(3)
 INMEMORY_SERVICE                                               VARCHAR2(12)
 INMEMORY_SERVICE_NAME                                          VARCHAR2(1000)
 CONTAINER_MAP_OBJECT                                           VARCHAR2(3)

SQL> select * from tab where tname like 'V_$%';

TNAME                          TABTYPE  CLUSTERID                                                   
------------------------------ ------- ----------                                                   
V_$ACCESS                      VIEW                                                                 
V_$ACTIVE_INSTANCES            VIEW                                                                 
V_$ACTIVE_SERVICES             VIEW                                                                 

SQL>  connect oe/oe@orclpdb
Connected.
SQL> conn sys/oracle@orclpdb as sysdba
Connected.
SQL> GRANT create any table TO oe;

Grant succeeded.

SQL> GRANT create table TO oe;

Grant succeeded.

SQL> grant update (salary) on hr.employees to oe;

Grant succeeded.

SQL> REVOKE update on hr.employees FROM oe;

Revoke succeeded.

SQL> REVOKE update(SALARY) on hr.employees FROM oe;
REVOKE update(SALARY) on hr.employees FROM oe
             *
ERROR at line 1:
ORA-01750: UPDATE/REFERENCES may only be REVOKEd from the whole table, not by column 


SQL> spool off

===================================================================================================================
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
=====================================================================================================================================



STRUCTURE OF PL/SQL BLOCK.
-----------------------------

1.[DECLARATIVE PART]
2.EXECUTABLE PART
3.[ERROR HANDLING ]


[DECLARE
	<variables, constrants, cursors etc....>; ]
BEGIN
	<all executable statements>;
[EXCEPTION
	<error_handling>; ]
END;
/


BEGIN
	UPDATE
	INSERT
	IF....
	LOOP...
	SELECT...
END;
/


What is variable?
-----------------
it is named memory location which stores the data of a kind.

<var_name> DATA_TYPE [(width)];

SET SERVEROUTPUT ON
===================================================================
BEGIN
		DBMS_OUTPUT.PUT_LINE('Good Morning');
END;
/
===================================================================
DECLARE
	v_sal 	NUMBER(10);
	v_dept 	NUMBER(10);
BEGIN
		SELECT salary,department_id INTO v_sal,v_dept 
		FROM employees 
		WHERE employee_id = 100;
		DBMS_OUTPUT.PUT_LINE('The salary is '||v_sal||' department is '||v_dept);
END;
/
===================================================================
The emp name is ' ' and works in department <dpartment_name> with salary of Rs '';
for empid = 101;

DECLARE
	v_name 	VARCHAR2(30);
	v_dname VARCHAR2(20);
	v_sal NUMBER(10);
BEGIN
	SELECT first_name, department_name, salary 
	INTO  v_name, v_dname,v_sal
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id
	AND e.employee_id = 101;
	
	DBMS_OUTPUT.PUT_LINE('The emp name is '||v_name
						||' and works in department '
						||v_dname
						||' with salary of Rs '
						||v_sal);
END;
/
===================================================================
DECLARE
	v_name 	VARCHAR2(30);
	v_dname VARCHAR2(20);
	v_sal NUMBER(10);
	v_con_val CONSTANT NUMBER(3):= 15;
--	v_con_val CONSTANT NUMBER(3) DEFAULT 100;
	v_total NUMBER(10);
	v_hiredate DATE;	
BEGIN
	SELECT first_name, department_name, salary,hire_date
	INTO  v_name, v_dname,v_sal,v_hiredate
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id
	AND e.employee_id = 101;
	
	DBMS_OUTPUT.PUT_LINE('The salary is '||v_sal);
	
	v_total := v_sal * v_con_val;
	
	DBMS_OUTPUT.PUT_LINE('The emp name is '||v_name
						||' and works in department '
						||v_dname
						||' with total salary of Rs '
						||v_total);
END;
/
===================================================================
%TYPE:
======
DECLARE
--	variable_name TABLE_NAME.column_name%TYPE;

	v_name 	employees.FIRST_NAME%TYPE;
	v_dname departments.DEPARTMENT_NAME%TYPE;
	v_sal employees.SALARY%TYPE;
	v_con_val CONSTANT NUMBER(3):= 15;
	v_total NUMBER(10);
	v_hiredate employees.HIRE_DATE%TYPE;	
BEGIN
	SELECT first_name, department_name, salary,hire_date
	INTO  v_name, v_dname,v_sal,v_hiredate
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id
	AND e.employee_id = 101;
	
	DBMS_OUTPUT.PUT_LINE('The salary is '||v_sal);
	
	v_total := v_sal * v_con_val;
	
	DBMS_OUTPUT.PUT_LINE('The emp name is '||v_name
						||' and works in department '
						||v_dname
						||' with total salary of Rs '
						||v_total);
END;
/
===================================================================
%ROWTYPE:
---------
			variable_name TABLE_NAME%ROWTYPE;  -- To declare variable
			variable_name.column_name			--To access the individual column
DECLARE
			v_row_emp employees%ROWTYPE;
BEGIN
		SELECT * INTO v_row_emp
		FROM employees 
		WHERE employee_id = 100;
		
		DBMS_OUTPUT.PUT_LINE('The salary is '
							||v_row_emp.salary
							||' department is '
							||v_row_emp.department_id);
END;
/
===================================================================
1. variable name can be upto 30 CHAR
2. should start with CHAR followed by alphanumeric
3. no reserved words 
4. no space allowed
===================================================================



-------------
sir notes   |
=========================================================================================================	
STRUCTURE OF PL/SQL BLOCK.
-----------------------------

1.[DECLARATIVE PART]
2.EXECUTABLE PART
3.[ERROR HANDLING ]


[DECLARE
	<variables, constrants, cursors etc....>; ]
BEGIN
	<all executable statements>;
[EXCEPTION
	<error_handling>; ]
END;
/


BEGIN
	UPDATE
	INSERT
	IF....
	LOOP...
	SELECT...
END;
/


What is variable?
-----------------
it is named memory location which stores the data of a kind.

<var_name> DATA_TYPE [(width)];

SET SERVEROUTPUT ON
===================================================================
BEGIN
		DBMS_OUTPUT.PUT_LINE('Good Morning');
END;
/
===================================================================
DECLARE
	v_sal 	NUMBER(10);
	v_dept 	NUMBER(10);
BEGIN
		SELECT salary,department_id INTO v_sal,v_dept 
		FROM employees 
		WHERE employee_id = 100;
		DBMS_OUTPUT.PUT_LINE('The salary is '||v_sal||' department is '||v_dept);
END;
/
===================================================================
The emp name is ' ' and works in department <dpartment_name> with salary of Rs '';
for empid = 101;

DECLARE
	v_name 	VARCHAR2(30);
	v_dname VARCHAR2(20);
	v_sal NUMBER(10);
BEGIN
	SELECT first_name, department_name, salary 
	INTO  v_name, v_dname,v_sal
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id
	AND e.employee_id = 101;
	
	DBMS_OUTPUT.PUT_LINE('The emp name is '||v_name
						||' and works in department '
						||v_dname
						||' with salary of Rs '
						||v_sal);
END;
/
===================================================================
DECLARE
	v_name 	VARCHAR2(30);
	v_dname VARCHAR2(20);
	v_sal NUMBER(10);
	v_con_val CONSTANT NUMBER(3):= 15;
--	v_con_val CONSTANT NUMBER(3) DEFAULT 100;
	v_total NUMBER(10);
	v_hiredate DATE;	
BEGIN
	SELECT first_name, department_name, salary,hire_date
	INTO  v_name, v_dname,v_sal,v_hiredate
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id
	AND e.employee_id = 101;
	
	DBMS_OUTPUT.PUT_LINE('The salary is '||v_sal);
	
	v_total := v_sal * v_con_val;
	
	DBMS_OUTPUT.PUT_LINE('The emp name is '||v_name
						||' and works in department '
						||v_dname
						||' with total salary of Rs '
						||v_total);
END;
/
===================================================================
DECLARE
	v_name 	VARCHAR2(30);
	v_dname VARCHAR2(20);
	v_sal NUMBER(10);
	v_con_val CONSTANT NUMBER(3):= 15;
--	v_con_val CONSTANT NUMBER(3) DEFAULT 100;
	v_total NUMBER(10);
	v_hiredate DATE;	
BEGIN
	SELECT first_name, department_name, salary,hire_date
	INTO  v_name, v_dname,v_sal,v_hiredate
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id
	AND e.employee_id = 101;
	
	v_con_val := 200;
	
	DBMS_OUTPUT.PUT_LINE('The salary is '||v_sal);
	
	v_total := v_sal * v_con_val;
	
	DBMS_OUTPUT.PUT_LINE('The emp name is '||v_name
						||' and works in department '
						||v_dname
						||' with total salary of Rs '
						||v_total);
END;
/
===================================================================
%TYPE:
======
DECLARE
--	variable_name TABLE_NAME.column_name%TYPE;

	v_name 	employees.FIRST_NAME%TYPE;
	v_dname departments.DEPARTMENT_NAME%TYPE;
	v_sal employees.SALARY%TYPE;
	v_con_val CONSTANT NUMBER(3):= 15;
	v_total NUMBER(10);
	v_hiredate employees.HIRE_DATE%TYPE;	
BEGIN
	SELECT first_name, department_name, salary,hire_date
	INTO  v_name, v_dname,v_sal,v_hiredate
	FROM employees e, departments d 
	WHERE e.department_id = d.department_id
	AND e.employee_id = 101;
	
	DBMS_OUTPUT.PUT_LINE('The salary is '||v_sal);
	
	v_total := v_sal * v_con_val;
	
	DBMS_OUTPUT.PUT_LINE('The emp name is '||v_name
						||' and works in department '
						||v_dname
						||' with total salary of Rs '
						||v_total);
END;
/
===================================================================
%ROWTYPE:
---------
			variable_name TABLE_NAME%ROWTYPE;  -- To declare variable
			variable_name.column_name			--To access the individual column
DECLARE
			v_row_emp employees%ROWTYPE;
BEGIN
		SELECT * INTO v_row_emp
		FROM employees 
		WHERE employee_id = 100;
		
		DBMS_OUTPUT.PUT_LINE('The salary is '
							||v_row_emp.salary
							||' department is '
							||v_row_emp.department_id);
END;
/
===================================================================
1. variable name can be upto 30 CHAR
2. should start with CHAR followed by alphanumeric
3. no reserved words 
4. no space allowed
===================================================================
IF STATEMENTS:
--------------
IF <condition> THEN
	<statement>;
END IF;

DECLARE 
	v_sal emp.salary%TYPE;
	v_comm emp.commission_pct%TYPE;
BEGIN
	SELECT salary, commission_pct 
	INTO v_sal, v_comm
	FROM emp
	WHERE employee_id = 100;
	
	IF v_sal > 20000 AND v_comm IS NULL THEN
		UPDATE emp
			SET commission_pct = .5
		WHERE employee_id = 100;
		
		DBMS_OUTPUT.PUT_LINE('The record updated');
	END IF;
	COMMIT;
END;
/
===================================================================
NESTED PL/SQL BLOCK
-------------------
DECLARE 
	v_sal emp.salary%TYPE;
	v_comm emp.commission_pct%TYPE;
BEGIN
	SELECT salary, commission_pct 
	INTO v_sal, v_comm
	FROM emp
	WHERE employee_id = 100;
	
	IF v_sal > 20000 AND v_comm IS NULL THEN
	---
		DECLARE 
			x number;
			y number;
		BEGIN
			<executable_stmts>
		END;
	---
	END IF;
	COMMIT;
END;
/
===================================================================
IF <condition> THEN
	<statement 1>;
ELSE
	<statement 2>;
END IF;

DECLARE 
		v_sal emp.salary%TYPE;
		v_dept emp.department_id%TYPE;
BEGIN
		SELECT salary, department_id INTO v_sal, v_dept FROM emp
		WHERE employee_id = 178;
		
		IF v_sal > 6500 AND v_dept IS NOT NULL THEN
			UPDATE emp
			SET commission_pct = .5
			WHERE employee_id = 178;
			DBMS_OUTPUT.PUT_LINE('Updated commission');
		ELSE
			UPDATE emp
			SET department_id = 10
			WHERE employee_id = 178;
			DBMS_OUTPUT.PUT_LINE('Updated department');
		END IF;
		COMMIT;
END;
/
===================================================================
IF <condition_1> THEN
	<statement 1>;
ELSIF <condition_2> THEN
	<statement 2>;
ELSIF <condition_3> THEN
	<statement 3>;
...
[ELSE
	<statement n>;]
END IF;

DECLARE 
		v_sal emp.salary%TYPE;
BEGIN
		SELECT salary INTO v_sal FROM emp
		WHERE employee_id = 180;
		IF v_sal BETWEEN 15000 AND 20000 THEN
			UPDATE emp
			SET commission_pct = .5
			WHERE employee_id = 180;
			DBMS_OUTPUT.PUT_LINE('Updated commission with .5');
		ELSIF v_sal BETWEEN 10000 AND 15000 THEN
			UPDATE emp
			SET commission_pct = .3
			WHERE employee_id = 180;
			DBMS_OUTPUT.PUT_LINE('Updated department with .3');
		ELSIF v_sal < 10000 THEN
			UPDATE emp
			SET commission_pct = .2
			WHERE employee_id = 180;
			DBMS_OUTPUT.PUT_LINE('Updated department .2');
		ELSE
			DBMS_OUTPUT.PUT_LINE('Not eligible for commission');
		END IF;
			DBMS_OUTPUT.PUT_LINE('out of if statement');
		COMMIT;
END;
/
============================================================
SIMPLE LOOP:
------------
LOOP
	<statements>
END LOOP;

DECLARE
  		x NUMBER := 0;
BEGIN
 	 LOOP
    		DBMS_OUTPUT.PUT_LINE ('Inside loop:  x = ' || TO_CHAR(x));
    		x := x + 1;
/*   		IF x > 3 THEN
      			EXIT;
    		END IF;  
*/
			EXIT WHEN x = 4;
  	END LOOP;
  -- After EXIT, control resumes here
  DBMS_OUTPUT.PUT_LINE(' After loop:  x = ' || TO_CHAR(x));
END;
/
============================================================
FOR LOOP:
---------
DECLARE 
		v_min NUMBER := 0;
		v_max NUMBER := 10;
BEGIN
		FOR i IN v_min..v_max LOOP 
			DBMS_OUTPUT.PUT_LINE('The value if i is :'||i);
		END LOOP;
END;
/

DECLARE 
		v_min NUMBER := 10;
		v_max NUMBER := 10;
BEGIN
		FOR i IN v_min..v_max LOOP 
			DBMS_OUTPUT.PUT_LINE('The value if i is :'||i);
		END LOOP;
END;
/

DECLARE 
		v_min NUMBER := 15;
		v_max NUMBER := 10;
BEGIN
		FOR i IN v_min..v_max LOOP 
			DBMS_OUTPUT.PUT_LINE('The value if i is :'||i);
		END LOOP;
END;
/

DECLARE 
		v_min NUMBER := 1;
		v_max NUMBER := 10;
BEGIN
		FOR i IN REVERSE v_min..v_max LOOP 
			DBMS_OUTPUT.PUT_LINE('The value if i is :'||i);
		END LOOP;
END;
/

============================================================
WHILE LOOP:
-----------
WHILE <condition> LOOP 
 <statements>
END LOOP;

DECLARE
  	x NUMBER := 1;
BEGIN
  	WHILE x < 10 LOOP
   	 	DBMS_OUTPUT.PUT_LINE ('The value of x is '||x);
    		x := x + 1;
  	END LOOP;
END;
/

DECLARE
  	x NUMBER := 20;
BEGIN
  	WHILE x < 10 LOOP
   	 	DBMS_OUTPUT.PUT_LINE ('The value of x is '||x);
    		x := x + 1;
  	END LOOP;
END;
/

======================================================================================================================


MY NOTES


SQL> set serveroutput on   

==============================================================================	
SQL> begin
    dbms_output.put_line('good Morning');
    end;
    /

   ----------- 
good Morning

PL/SQL procedure successfully completed.



========================================================

DECLARE
    v_sal NUMBER(10);
    v_dept_id NUMBER(10);
BEGIN
    SELECT salary, department_id 
    INTO v_sal, v_dept_id 
    FROM employees 
    WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_sal || ', Department ID: ' || v_dept_id);
END;




SQL> DECLARE
        v_sal NUMBER(10);
        v_dept_id NUMBER(10); -- Correct variable name
    BEGIN
        SELECT salary, department_id
        INTO v_sal, v_dept_id
        FROM employees
        WHERE employee_id = 100;
  
       DBMS_OUTPUT.PUT_LINE('Salary: ' || v_sal || ', Department ID: ' || v_dept_id);
   END;
   /
   -------------------------------------------------------------
Salary: 24000, Department ID: 90

PL/SQL procedure successfully completed.



===============================================================================================================



DECLARE
    v_name   VARCHAR2(30);
    v_dname  VARCHAR2(20);
    v_sal    NUMBER(10);
BEGIN
    SELECT first_name, department_name, salary
    INTO v_name, v_dname, v_sal
    FROM employees e, departments d
    WHERE e.department_id = d.department_id
    AND e.employee_id = 101;

    DBMS_OUTPUT.PUT_LINE(
        'The emp name is ' 
         || v_name
         ||' and works in department ' 
         || v_dname 
         ||' with salary of Rs ' || v_sal
    );
END;
/

-----------------------------------------------------------------------------------------
The emp name is Neena and works in department Executive with salary of Rs 17000

=============================================================================================================================================

exact fetch returns more than requested number of rows



SQL> DECLARE
  2      v_name   VARCHAR2(30);
  3      v_dname  VARCHAR2(20);
  4      v_sal    NUMBER(10);
  5  BEGIN
  6      -- This will return multiple rows if more than one employee exists
  7      SELECT first_name, department_name, salary
  8      INTO v_name, v_dname, v_sal
  9      FROM employees e, departments d
 10      WHERE e.department_id = d.department_id;
 11      -- No filter like AND e.employee_id = 101
 12
 13      DBMS_OUTPUT.PUT_LINE('The emp name is ' || v_name ||
 14                           ' and works in department ' || v_dname ||
 15                           ' with salary of Rs ' || v_sal);
 16  END;
 17  /
DECLARE
*
ERROR at line 1:
ORA-01422: exact fetch returns more than requested number of rows
ORA-06512: at line 7




====================================================================================================

DECLARE
    v_name      VARCHAR2(30);
    v_dname     VARCHAR2(20);
    v_sal       NUMBER(10);
    v_con_val   CONSTANT NUMBER(3) := 10;
    -- v_con_val CONSTANT NUMBER(3) DEFAULT 100;
    v_total     NUMBER(10);
BEGIN
    SELECT first_name, department_name, salary
    INTO v_name, v_dname, v_sal
    FROM employees e, departments d
    WHERE e.department_id = d.department_id
    AND e.employee_id = 101;

    DBMS_OUTPUT.PUT_LINE('The salary is ' || v_sal);

    v_total := v_sal * v_con_val;

    DBMS_OUTPUT.PUT_LINE('The emp name is ' || v_name 
                         || ' and works in department '
                         || v_dname 
                         || ' with total salary of Rs '
                         || v_total);
END;
/
---------------------------------------------------------------------------------------------
The salary is 17000
The emp name is Neena and works in department Executive with total salary of Rs 170000

PL/SQL procedure successfully completed.
 ==========================================================================================================   

	
 END;
SQL> BEGIN
  2     FOR rec IN (
  3        SELECT e.first_name, d.department_name, e.salary
  4        FROM employees e
  5        JOIN departments d ON e.department_id = d.department_id
  6     ) LOOP
  7        DBMS_OUTPUT.PUT_LINE(
  8           'The emp name is ' || rec.first_name ||
  9           ' and works in department ' || rec.department_name ||
 10           ' with salary of Rs ' || rec.salary
 11        );
 12     END LOOP;
 13  END;
 14  /
-----------------------------------------------------------------------------------------------	 
The emp name is Jennifer and works in department Administration with salary of Rs 4400
The emp name is Michael and works in department Marketing with salary of Rs 13000
The emp name is Pat and works in department Marketing with salary of Rs 6000
The emp name is Den and works in department Purchasing with salary of Rs 11000
The emp name is Alexander and works in department Purchasing with salary of Rs 3100
The emp name is Shelli and works in department Purchasing with salary of Rs 2900
The emp name is Sigal and works in department Purchasing with salary of Rs 2800
The emp name is Guy and works in department Purchasing with salary of Rs 2600
The emp name is Karen and works in department Purchasing with salary of Rs 2500
The emp name is Susan and works in department Human Resources with salary of Rs 6500
The emp name is Matthew and works in department Shipping with salary of Rs 8000
The emp name is Adam and works in department Shipping with salary of Rs 8200
The emp name is Payam and works in


=====================================================================================================================

if there is any change in the datatype automatical  oracle audjest and change the dataype and width


DECLARE
	--variable_name table_name.column_name%type;  
    -->>>>>>>>>>%TYPE it will asigng new data type in the query

	v_name employees.first_name%TYPE;
   -- v_name      VARCHAR2(30);
    v_dname departments.department_name%TYPE;
    --v_dname     VARCHAR2(20);
    v_sal employees.salary%TYPE;
   -- v_sal       NUMBER(10);
    v_con_val   CONSTANT NUMBER(3) := 10;
    -- v_con_val CONSTANT NUMBER(3) DEFAULT 100;
    v_total     NUMBER(10);
BEGIN
    SELECT first_name, department_name, salary
    INTO v_name, v_dname, v_sal
    FROM employees e, departments d
    WHERE e.department_id = d.department_id
    AND e.employee_id = 101;
    DBMS_OUTPUT.PUT_LINE('The salary is ' || v_sal);
    v_total := v_sal * v_con_val;
    DBMS_OUTPUT.PUT_LINE('The emp name is ' || v_name
                         || ' and works in department '
                         || v_dname
                         || ' with total salary of Rs '
                         || v_total);
END;
/



The salary is 17000
The emp name is Neena and works in department Executive with total salary of Rs 170000



==========================================================================================================

	
					%TYPE
------	
	
DECLARE
    v_sal   employees.salary%TYPE;
    v_dept  employees.department_id%TYPE;
BEGIN
    SELECT salary, department_id 
    INTO v_sal, v_dept 
    FROM employees 
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('The salary is ' || v_sal || ' department is ' || v_dept);
END;
/
------------------------------------------------------------------------
The salary is 24000 department is 90

PL/SQL procedure successfully completed.

SQL>


=======================================================================================================================================

				%ROWTYPE
				--------
				-------- if majority/ all  from the same column then use it 
	

			->	VARIABLE_NAME TABLE_NAME%ROWTYPE;  -- TO DECLARE VARIABLE 

			->	VARIABLE_NAME COLUMN_NAME%ROWTYPE;  -- TO ACCESS THE INDIVIDUAL COLUMN
				

DECLARE
	                  v_row_emp employees%ROWTYPE; --<<<<--
	
	
BEGIN
	                  SELECT * INTO v_row_emp   --<<<<-
    -- SELECT salary, department_id  cant use individual column
    -- INTO v_sal, v_dept 	
	
	

    FROM employees 
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('The salary is ' 
	    		|| v_row_emp.salary
	    		|| ' department is '
	    		|| v_row-emp.department_id);
END;
/
	
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DECLARE
    v_row_emp employees%ROWTYPE;
BEGIN
    SELECT * INTO v_row_emp
    FROM employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('The salary is ' || v_row_emp.salary
                         || ' department is '
                         || v_row_emp.department_id);
END;
/

------------------------------------------------------------------

The salary is 24000 department is 90

=====================================================================================

1. variable name can be upto 30 char
2. should start with CHAR 

1. variable name can be upto 30 CHAR
2. should **start with CHAR** followed by alphanumeric
3. **no** reserved words
4. **no space** allowed

===========================================================================================


IF STATEMENTS;

IF <condition> THEN 
	<statement>;
END IF;

==============================================================================================================
	
DECLARE 
	v_sal emp.salary%TYPE;
	v_comm emp.commission%TYPE;
BEGIN 
	SELECT salary ,commission_pct
	INTO v_sal, v_comm
	FROM emp
	WHERE employee_id = 100;

	IF v_sal > 20000 AND v_comm IS NULL THEN
		UPDATE emp
			SET commission_pct = .5
		WHERE employee_id  = 100;

		DBMS_OUTPUT.PUT_LINE('THE RECORD UPDATED');
	
=========================================================================================================================================


	                                            IF CONDITION 
						    ----------------


IF <condition> THEN
   <statement>;
END IF;

DECLARE
   v_sal  emp.salary%TYPE;
   v_comm emp.commission_pct%TYPE;
BEGIN
   SELECT salary, commission_pct
   INTO v_sal, v_comm
   FROM emp
   WHERE employee_id = 100;

   IF v_sal > 20000 AND v_comm IS NULL THEN
      UPDATE emp
      SET commission_pct = .5
      WHERE employee_id = 100;

      DBMS_OUTPUT.PUT_LINE('The record updated');
   END IF;

   COMMIT;
END;
/
----------------------------------------------------------------------------------------------------
	

SQL> SELECT * FROM EMP;

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL              PHONE_NUMBER         HIRE_DATE JOB_ID          SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        100 Steven               King                      SKING              515.123.4567         17-JUN-03 AD_PRES          24000             .5                       90
        101 Neena                Kochhar                   NKOCHHAR                   515.123.4568         21-SEP-05 AD_VP            17000                       100            90
        102 Lex                  De Haan                   LDEHAAN                    515.123.4569         13-JAN-01 AD_VP            17000                       100            90
        103 Alexander            Hunold                    AHUNOLD                    590.423.4567         03-JAN-06 IT_PROG           9000                       102            60
        104 Bruce                Ernst                     BERNST                     590.423.4568         21-MAY-07 IT_PROG           6000                       103            60
        105 David                Austin                    DAUSTIN                    590.423.4569         25-JUN-05 IT_PROG           4800                       103            60
        106 Valli                Pataballa                 VPATABAL                   590.423.4560         05-FEB-06 IT_PROG           4800                       103            60
        107 Diana                Lorentz                   DLORENTZ                   590.423.5567         07-FEB-07 IT_PROG           4200                       103            60
        108 Nancy                Greenberg                 NGREENBE                   515.124.4569         17-AUG-02 FI_MGR           12008                       101           100
        109 Daniel               Faviet                    DFAVIET                    515.124.4169         16-AUG-02 FI_ACCOUNT   



=========================================================================================================================================================================================================================
                                  NESTED IF STATEMENT
                                 ------------------------

++++++++++++++++++++++=
+++++++++














DECLARE
   v_sal  emp.salary%TYPE;
   v_dept emp.department_id%TYPE;
BEGIN
   SELECT salary, department_id 
   INTO v_sal, v_dept 
   FROM emp 
   WHERE employee_id = 178;

   IF v_sal > 6500 AND v_dept IS NOT NULL THEN
      UPDATE emp
      SET commission_pct = .5
      WHERE employee_id = 178;
      
      DBMS_OUTPUT.PUT_LINE('Updated commission');
   ELSE
      UPDATE emp
      SET department_id = 10
      WHERE employee_id = 178;
      
      DBMS_OUTPUT.PUT_LINE('Updated department');
   END IF;

   COMMIT;
END;
/





==========================================

DECLARE
   v_sal  emp.salary%TYPE;
   v_dept emp.department_id%TYPE;
BEGIN
   SELECT salary, department_id 
   INTO v_sal, v_dept 
   FROM emp 
   WHERE employee_id = 178;

   IF v_sal > 6500 AND v_dept IS NOT NULL THEN
      UPDATE emp
      SET commission_pct = .5
      WHERE employee_id = 178;

      DBMS_OUTPUT.PUT_LINE('Updated commission');
   ELSE
      UPDATE emp
      SET department_id = 10
      WHERE employee_id = 178;

      DBMS_OUTPUT.PUT_LINE('Updated department');
   END IF;

   COMMIT;
END;
/


Updated commission

PL/SQL procedure successfully completed.

SQL> select * from emp;

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER      HIRE_DATE JOB_ID          SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        100 Steven               King                      SKING                     515.123.4567      17-JUN-03 AD_PRES          24000             .5                       90
        101 Neena                Kochhar                   NKOCHHAR                  515.123.4568      21-SEP-05 AD_VP            17000                       100            90
        102 Lex                  De Haan                   LDEHAAN                   515.123.4569      13-JAN-01 AD_VP            17000                       100            90
        103 Alexander            Hunold                    AHUNOLD                   590.423.4567      03-JAN-06 IT_PROG           9000                       102            60



================================================================================================================================================================================================





DECLARE
   v_sal emp.salary%TYPE;
BEGIN
   SELECT salary INTO v_sal FROM emp
   WHERE employee_id = 180;

   IF v_sal BETWEEN 15000 AND 20000 THEN
      UPDATE emp
      SET commission_pct = 0.5
      WHERE employee_id = 180;

      DBMS_OUTPUT.PUT_LINE('Updated commission');

   ELSIF v_sal BETWEEN 10000 AND 15000 THEN
      UPDATE emp
      SET commission_pct = 0.3
      WHERE employee_id = 180;

      DBMS_OUTPUT.PUT_LINE('Updated department');

   ELSIF v_sal < 10000 THEN
      UPDATE emp
      SET commission_pct = 0.2
      WHERE employee_id = 180;

      DBMS_OUTPUT.PUT_LINE('Updated department');

   ELSE
      DBMS_OUTPUT.PUT_LINE('Not eligible for commission');
   END IF;
 commit;
END;
/

======================================================================================================================================================


                                 third form of if
				------------------------

DECLARE
   v_sal emp.salary%TYPE;
BEGIN
   SELECT salary INTO v_sal 
   FROM emp 
   WHERE employee_id = 180;

   IF v_sal BETWEEN 15000 AND 20000 THEN
      UPDATE emp
      SET commission_pct = 0.5
      WHERE employee_id = 180;

      DBMS_OUTPUT.PUT_LINE('Updated commission with 0.5');

   ELSIF v_sal BETWEEN 10000 AND 14999 THEN
      UPDATE emp
      SET commission_pct = 0.3
      WHERE employee_id = 180;

      DBMS_OUTPUT.PUT_LINE('Updated commission with 0.3');

   ELSIF v_sal < 10000 THEN
      UPDATE emp
      SET commission_pct = 0.2
      WHERE employee_id = 180;

      DBMS_OUTPUT.PUT_LINE('Updated commission with 0.2');

   ELSE
      DBMS_OUTPUT.PUT_LINE('Not eligible for commission');
   END IF;

   DBMS_OUTPUT.PUT_LINE('Out of IF statement');
   COMMIT;
END;
/



LoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoopsLoops
 -- SIMPLE LOOPS
	

DECLARE
   x NUMBER := 0;

BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Inside loop:  x = ' || TO_CHAR(x));
      x := x + 1;

      -- Conditional exit
      EXIT WHEN x = 4;
   END LOOP;

   -- After exit
   DBMS_OUTPUT.PUT_LINE('After loop:  x = ' || TO_CHAR(x));
END;
-- OUPTPUT//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Inside loop:  x = 0
Inside loop:  x = 1
Inside loop:  x = 2
Inside loop:  x = 3
After loop:  x = 4

PL/SQL procedure successfully completed.



===========================================================================================

FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP FOR LOOP 

FOR LOOP:
DECLARE 
	v_min NUMBER := 1;
	v_max NUMBER := 10;
BEGIN 
	FOR i IN v_min..v_max LOOP
		dbms_output.put_line('the value of i is : ' || i);
	END LOOP;
END;

-----------------------------------------------------------------------------------------------
the value of i is : 1
the value of i is : 2
the value of i is : 3
the value of i is : 4
the value of i is : 5
the value of i is : 6
the value of i is : 7
the value of i is : 8
the value of i is : 9
the value of i is : 10

PL/SQL procedure successfully completed.
=======================================================================================
IF LOWER BOND = HIGHER BOUD  ONLY ONE ITERATION
	
DECLARE
	v_min NUMBER := 10;
	v_max NUMBER := 10;
BEGIN
	FOR i IN v_min..v_max LOOP
		dbms_output.put_line('the value of i is : ' || i);
	END LOOP;
END;
/

===============================================================================================



============================================================================================================
	

                                                     ->USING REVERSE FOR LOOP
  1  DECLARE
  2     v_min NUMBER := 1;
  3     v_max NUMBER := 10;
  4  BEGIN
  5     FOR i IN REVERSE v_min..v_max LOOP       --> REVERE
  6             dbms_output.put_line('the value of i is : ' || i);
  7     END LOOP;
  8* END;
------------------------------------------------------------------------------------------------------------------------------------------------

SQL> /
the value of i is : 10
the value of i is : 9
the value of i is : 8
the value of i is : 7
the value of i is : 6
the value of i is : 5
the value of i is : 4
the value of i is : 3
the value of i is : 2
the value of i is : 1

PL/SQL procedure successfully completed.

==============================================================================================































































