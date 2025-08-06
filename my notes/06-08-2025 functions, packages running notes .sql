SUB PROGRAMS 
=============  
FUNCTIONS:
-----------


    USED TO COMPUTE.

        FUNCTION                          PROCEDURE 
        --------                          ----------
1.Can be calledd in SQL  stmts         | 1. Can not be called
2. it returns a VALUE                  | 2 . can not return any value
3. it is used to computational purpose | 3.  it used to do some processes

========================================================================================

select f1(100) from dual; update emp set sal = f1(10) 

SYNTAX:

  CREATE [ OR REPLACE ] FUNCTION [schema. ] <func_name> [ (param_list) ] RETURN <data_type> IS | AS
                        --------                                         ------
        <body of function>
      RETURN expr;
  END <func_name>;

=============================================================================================

--   example of function
--   -------------------

-- CREATE OR REPLACE FUNCTION f1 (p_empid NUMBER ) RETURN NUMBER IS 
--       i number;
-- BEGIN 
--       SELECT salary INTO i FROM emp WHERE employee_id = p_empid;
--       RETURN i;
-- EXCEPTION 
--       WHEN OTHERS THEN
--             dbms_output.put_line('Unalbe to identify the error');
--   END;

-- -----------------------------------------

-- Warning: Function created with compilation errors.
-- =================================================================================

  SIR CODE ASS IT IS CHECK DIFFERENCE

  CREATE OR REPLACE FUNCTION f1 (p_empid NUMBER) RETURN NUMBER IS
    i NUMBER;
BEGIN
    SELECT salary INTO i FROM emp WHERE employee_id = p_empid;
    RETURN i;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unable to identify the error');
END;
/
  
Function created.

===========================================================================
 <GPT CODE> 
CREATE OR REPLACE FUNCTION f1 (p_empid NUMBER) 
RETURN NUMBER 
IS 
    i NUMBER;
BEGIN 
    -- Correct column and table names
    SELECT salary 
    INTO i 
    FROM emp 
    WHERE employee_id = p_empid;

    RETURN i;

EXCEPTION 
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unable to identify the error');
        RETURN NULL; -- Must return something in all cases
END;
/

============================================================================================


  

  CREATE OR REPLACE FUNCTION f1 (p_empid NUMBER) RETURN NUMBER IS
    i NUMBER;
BEGIN
    SELECT salary INTO i FROM emp WHERE employee_id = p_empid;
      if i> 20000 then 
           RETURN 1;
             DBMS_OUTPUT.PUT_LINE('1');
      elsif i BETWEEN 10000 AND  20000 then   -- <<<<<<<<<<<<<<<<<NOT ELSEIF IT IS ELSIF NO E
           RETURN 2;
                  DBMS_OUTPUT.PUT_LINE('2');
      ELSE 
             RETURN 3;
                    DBMS_OUTPUT.PUT_LINE('3');
      END IF;
                    DBMS_OUTPUT.PUT_LINE('OUT SIDE OF IF STATEMENT');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unable to identify the error');
END;
/

-----------------------------------------============================================
> SELECT f1(101) AS result
    FROM dual;
--------------------------------------------------
    RESULT
----------
         2
---------------------------------------------------

SQL> SELECT f1(100) FROM dual;

   F1(100)
----------
         1
===================================================================================


PARAMETER NOTATION:
-------------------

1. POSITIONAL NOTATION 
2. NAMEDD NOTATION
3. MIXED NOTATION

1. POSITIONAL NOTAION:
----------------------
    Passing the actual parameter to the same position of the formal parameter.

      
      p1(p_empid number , p_name varchar2, p_hdate date, p_dept_id number);
      p1(v_empid,v_name,v_hiredate,v_department_id);


2.NAMEDD NOTATION :
---------------------
        DIrectly passing value to the formal parameter using => syntax
    p1(p_empid number, p_name varcchar2, p_hdate date , p_deptid number);
    p1(p_name => 
                     v_name , p_dept_id =>
                                     v_department_id, p_empid
                                                           => v_empid,p_hdate 
                                                                            => v_hiredate



3.MIXED NOTATION:
-----------------
      It is combination of BOTH Positional and Named notations
    p1(p_empid number , p_name varchar2, p_hdate date , p_deptid number);
    p1(v_empid,  p_deptid =>
      /* ------- */          v_department_id, p_name =>
                                                      v_name,p_hdata
                                                                      => v_hiredate);

      
      


      
========================================================================================================
--<<<<<<<<<<<<<<<<gpt>>>>>>

1️⃣ Positional Notation
You pass actual parameters in the same order as the formal parameters are declared.

Example:

plsql
Copy code
-- Procedure definition
PROCEDURE p1(p_empid   NUMBER,
             p_name    VARCHAR2,
             p_hdate   DATE,
             p_dept_id NUMBER);

-- Calling using positional notation
p1(v_empid, v_name, v_hiredate, v_department_id);
✅ Rules:

Order must match exactly with the procedure definition.

You don’t specify parameter names.

2️⃣ Named Notation
You pass values by explicitly naming the parameter using the => syntax.

Example:

plsql
Copy code
-- Procedure definition
PROCEDURE p1(p_empid   NUMBER,
             p_name    VARCHAR2,
             p_hdate   DATE,
             p_dept_id NUMBER);

-- Calling using named notation
p1(p_name    => v_name,
   p_dept_id => v_department_id,
   p_empid   => v_empid,
   p_hdate   => v_hiredate);
✅ Rules:

Order does not matter.

Each parameter name must be followed by => and its value.

3️⃣ Mixed Notation
Combination of positional and named notation.
Positional parameters must come first, followed by named parameters.

Example:

plsql
Copy code
-- Procedure definition
PROCEDURE p1(p_empid   NUMBER,
             p_name    VARCHAR2,
             p_hdate   DATE,
             p_dept_id NUMBER);

-- Calling using mixed notation
p1(v_empid, 
   p_dept_id => v_department_id,
   p_name    => v_name,
   p_hdate   => v_hiredate);
✅ Rules:

Positional parameters must be placed first.

After the first named parameter, all remaining must also be named.

If you like, I can create a working PL/SQL example with a p1 procedure and show calls in all three notations so you can run it directly in SQL*Plus or SQL Developer.
Do you want me to prepare that?

===================================================================================================================







Package Parts:
SPECIFICATION – Mandatory

BODY – Optional

1. PACKAGE SPECIFICATION:
-- declares the public items that can be referenced from outside the package
-- If the public items include cursors or subprograms, then the package must also have a body.

2. PACKAGE BODY:
The body must define queries for public cursors and code for public subprograms.

Reasons to Use Packages:
Modularity
Subprograms let you break a program into manageable, well-defined modules.

Easier Application Design
When designing an application, all you need initially is the interface information.








  SYNTAX FOR SPECIFICATION:

plsql
Copy code
CREATE [ OR REPLACE ] PACKAGE [schema.] <pkg_name> IS | AS
    <item_list>;
END [<pkg_name>];





EXAMPLE:

plsql
Copy code


  
CREATE OR REPLACE PACKAGE pkg_student IS
    i NUMBER := 1000;

    PROCEDURE add_student(p_id NUMBER, p_name VARCHAR2, p_mark NUMBER);
    PROCEDURE del_student(p_id NUMBER);
    PROCEDURE up_student(p_id NUMBER, p_mark NUMBER);
    FUNCTION sel_student(p_id NUMBER) RETURN NUMBER;
END pkg_student;




SYNTAX FOR BODY:
----------------

CREATE [ OR REPLACE ] PACKAGE BODY [schema.] <pkg_name> IS | AS
    -- write code here
END [<pkg_name>];





======================================================================================================

CREATE OR REPLACE PACKAGE pkg_student IS
    i NUMBER := 1000;

    PROCEDURE add_student(p_id NUMBER, p_name VARCHAR2, p_mark NUMBER);
    PROCEDURE del_student(p_id NUMBER);
    PROCEDURE up_student(p_id NUMBER, p_mark NUMBER);
    FUNCTION sel_student(p_id NUMBER) RETURN NUMBER;
END pkg_student;
/

========================
--      syntax to call package     desc<pkg_name>;
=================================
  
DESC pkg_student;


Package created.


  
SQL> desc pkg_student;
----------------------------------------------------------------------------------------------------
output===================================================================================
--------------------------------------------------------------------------------------
PROCEDURE ADD_STUDENT
 Argument Name                  Type                    In/Out Default?
 ------------------------------ ----------------------- ------ --------
 P_ID                           NUMBER                  IN
 P_NAME                         VARCHAR2                IN
 P_MARK                         NUMBER                  IN
PROCEDURE DEL_STUDENT
 Argument Name                  Type                    In/Out Default?
 ------------------------------ ----------------------- ------ --------
 P_ID                           NUMBER                  IN
FUNCTION SEL_STUDENT RETURNS NUMBER
 Argument Name                  Type                    In/Out Default?
 ------------------------------ ----------------------- ------ --------
 P_ID                           NUMBER                  IN
PROCEDURE UP_STUDENT
 Argument Name                  Type                    In/Out Default?
 ------------------------------ ----------------------- ------ --------
 P_ID                           NUMBER                  IN
 P_MARK                         NUMBER                  IN




=============================================================================================

TO REFER PKG OBJECTS:
---------------------

SYNTAX : pkg_name.object_name[ (parameter_list)];
Eg     : PKG_STUDENT.i;
        pkg_student.del_student(v_student_id);



===================================================================
begin  
      dbms_output.put_line(pkg_student.i);  ---<<<<<<<<<<< package fuction can be called int the select statement






SYNTAX FOR BODY :
-------------------


  CREATE [OR REPLACE ] PACKAGE BODY [schema.] <pkg_name> IS |AS
    <write code here>;

    END[<pkg_name>];
=====================================================================================
  
EXAMPLE:
--------

CREATE OR REPLACE PACKAGE BODY pkg_student IS

    PROCEDURE add_student(p_id NUMBER, p_name VARCHAR2, p_mark NUMBER) IS
    BEGIN
        INSERT INTO student VALUES (p_id, p_name, p_mark);
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate Student ID');
    END add_student;
----
    PROCEDURE del_student(p_id NUMBER ) IS 
      BEGIN
          DELETE FROM student WHERE sid = p_id;
          COMMIT;
      EXCEPTION
            WHEN OTHERS THEN
                dbms.output.put_lint('some errors');
----
    PROCEDURE up_student SET mark = p_marknumber) is 
       begin 
            update student SET mark = p_mark where sid = p_id;
commit;
end up_student 
  


    

END pkg_student;
/

ALTER PACKAGE :
-------------------\

=============================================================================================
  to check all apckages

SELECT object_name, object_type, status
FROM user_objects
WHERE object_type = 'PACKAGE';
============================================================================================










=======================================================================================================
select * from USER_SOURCE  where name = 'PKG_STUDENT ' AND TYPE = 'PACKAGE BODY';
SELECT * FROM USER_OBJECTS WHERE OBJECT



 grant execute on pkg_student to oe;
------------
no records found



select * from user_source where name = 'PKG_STUDENT';
  
select * from all_source where name = 'PKG_STUDENT';
-------------------------

SQL> select * from all_source where name = 'PKG_STUDENT';
SQL> select * from all_source where name = 'PKG_STUDENT';

OWNER                          NAME                           TYPE               LINE
------------------------------ ------------------------------ ------------ ----------
TEXT
---------------------------------------------------------------------------------------------
HR                             PKG_STUDENT                    PACKAGE               1
PACKAGE pkg_student IS

HR                             PKG_STUDENT                    PACKAGE               2
    i NUMBER := 1000;

HR                             PKG_STUDENT                    PACKAGE               3


HR                             PKG_STUDENT                    PACKAGE               4
    PROCEDURE add_student(p_id NUMBER, p_name VARCHAR2, p_mark NUMBER);

HR                             PKG_STUDENT                    PACKAGE               5
    PROCEDURE del_student(p_id NUMBER);

HR                             PKG_STUDENT                    PACKAGE               6
    PROCEDURE up_student(p_id NUMBER, p_mark NUMBER);

HR                             PKG_STUDENT                    PACKAGE               7
    FUNCTION sel_student(p_id NUMBER) RETURN NUMBER;

HR                             PKG_STUDENT                    PACKAGE               8
END pkg_student;


8 rows selected.




========================================================================================================

SCALAR SUBQUERY:

SELECT employee_id, first_name, salary
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE employee_id = 101);


MULTI-VALUED SUBQUERY:

SELECT employee_id, first_name, salary
FROM employees
WHERE department_id IN (SELECT department_id FROM department WHERE location_id = 1700);



Multi-column comparison:

SELECT employee_id, job_id, department_id
FROM employees
WHERE (job_id, department_id) = (SELECT job_id, department_id 
                                  FROM employees 
                                  WHERE employee_id = 101);





==============================================================================================












































any all ppt pdf  any ppt 

CASE STATEMENT



Definition:

CASE expressions let you use IF ... THEN ... ELSE logic in SQL statements without having to invoke procedures

TYPES: 		

Simple Case
Search Case

---------------------------
SIMPLE CASE STATEMENT



Definition:

In a simple CASE expression, Oracle Database searches for the first WHEN ... THEN pair for which expr is equal to comparison_expr and returns return_expr. If none of the WHEN ... THEN pairs meet this condition, and an ELSE clause exists, then Oracle returns else_expr. Otherwise, Oracle returns null.

SYNTAX: 	

CASE <expr>  WHEN <comparison_expr> THEN  <return_expr> … [ELSE expr]   END

Example:

	SELECT STUDENT_ID, GRADE,
		CASE GRADE 
    			WHEN 'A' THEN 'Excellent'
   			 WHEN 'B' THEN 'Good'
    			ELSE 'Poor'
		END As status
	FROM STUDENT;
----------------------------------------------------

SEARCH CASE STATEMENT



Definition:

In a searched CASE expression, Oracle searches from left to right until it finds an 
    occurrence of condition that is true, and then returns return_expr. If no condition is
    found to be true, and an ELSE clause exists, then Oracle returns else_expr. Otherwise,
    Oracle returns null.


SYNTAX: 	

	CASE WHEN  <condition> THEN  <return_expr> , … [ELSE expr]  END

------------------------------------------------------------------------

Example:


	SELECT student_id, grade,
		CASE 	WHEN grade = 'A' THEN 'Excellent'
     			WHEN grade = 'B' THEN 'Good'
     			ELSE 'Poor'
		END AS status
	FROM student;
---------------------------------------------------------------------------------



GRANT PPT PDF


Use the GRANT statement to grant:

System privileges to users and roles. 

Roles to users, roles, and program units. The granted roles can be either user-defined (local or external) or predefined. 

Object privileges for a particular object to users and roles. 

Syntax For System Privs

		GRANT {system_priv | ALL PRIVILEGES}   TO {user | role | public}
		WITH ADMIN OPTION

Syntax For Object Privs

		GRANT {object_priv | ALL PRIVILEGES} [ (col_name,…) ] 
		ON [schema.] object_name
 		TO {user | role | public}
		WITH GRANT OPTION;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
is message has been deleted.

Message List
How do I use the  To_Date function with use... by Devarapu Madhavi
Devarapu Madhavi
3:33 PM


How do I use the  To_Date function with user input ?

INSERT INTO shipment VALUES (&id, '&sdate',... by Mahendiran
Mahendiran
3:39 PM


INSERT INTO shipment VALUES (&id, '&sdate',&shipid);

1, dd-mon-rr 20-jan-25 by Mahendiran
Mahendiran
3:40 PM

1, dd-mon-rr 20-jan-25

TO_DATE('20th Aug, 2025','DDth Mon, YYYY')  by Mahendiran
Mahendiran
3:41 PM

TO_DATE('20th Aug, 2025','DDth Mon, YYYY') 

2- jan - 2002,janiuary 2, 2004, 02-01-2003  by Sri Manikanta Karthik Katta
Sri Manikanta Karthik Katta
3:44 PM


2- jan - 2002,janiuary 2, 2004, 02-01-2003 

TO_DATE('2-jan - 2002','d-mon - yyyy') by Mahendiran
Mahendiran
3:46 PM


TO_DATE('2-jan - 2002','d-mon - yyyy')

NY - 02, Jan 2025 - To_date('02, Jan 2025',... by Mahendiran
Mahendiran
3:48 PM

NY - 02, Jan 2025 - To_date('02, Jan 2025','dd, Mon 2025');

Japan Jan, 20 2025 - TO_DATE(Jan, 20 2025', by Mahendiran
Mahendiran
3:49 PM

Japan Jan, 20 2025 - TO_DATE(Jan, 20 2025',

Japan Jan, 20 2025 - TO_DATE(Jan, 20 2025',... by Mahendiran
Mahendiran
3:49 PM

Japan Jan, 20 2025 - TO_DATE(Jan, 20 2025','Mon, dd yyyy');

dd-mon-yyyy by Mahendiran
Mahendiran
3:49 PM

dd-mon-yyyy

it's clear sir. Thank you sir by Sri Manikanta Karthik Katta
Sri Manikanta Karthik Katta
3:51 PM


it's clear sir. Thank you sir


😆
1 Laugh reaction.
In HR schema there are 4 tables, employees,... by Mahendiran
Mahendiran
4:52 PM


In HR schema there are 4 tables, employees, departments, locations & countries. 

Write a query to select all employees who a... by Mahendiran
Mahendiran
4:53 PM

Write a query to select all employees who are else working in the departments present in COUNTRY_NAME ='United States of America'

try for few mins by Mahendiran
Mahendiran
4:53 PM

try for few mins


👍
1 Like reaction.

😆
1 Laugh reaction.
desc all tables and see what are the common... by Mahendiran
Mahendiran
4:55 PM

desc all tables and see what are the common columns among the tables and how we can join one table to another like


👍
5 Like reactions.
5
another question by Mahendiran
Mahendiran
4:57 PM

another question


👍
1 Like reaction.
count the number of employees departments w... by Mahendiran
Mahendiran
4:58 PM

count the number of employees departments wise for those departments present in COUNTRY_NAME ='United States of America'

IN NEXT i need those departments which has ... by Mahendiran
Mahendiran
5:00 PM

IN NEXT i need those departments which has count of employees => 5

SELECT  employee_id, first_name, job_id, de... by Mahendiran
Mahendiran
5:03 PM

SELECT  employee_id, first_name, job_id, department_id FROM EMPLOYEES  WHERE department_id IN 
( SELECT department_id from departments WHERE location_id IN 
( SELECT location_id FROM LOCATIONS WHERE COUNTRY_ID IN 
   (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME ='United States of America'
   )
  )
)
ORDER BY department_id ASC;

SELECT  department_id, COUNT(*) AS TOTAL_EM... by Mahendiran
Mahendiran
5:03 PM

SELECT  department_id, COUNT(*) AS TOTAL_EMP FROM EMPLOYEES  WHERE department_id IN 
( SELECT department_id from departments WHERE location_id IN 
( SELECT location_id FROM LOCATIONS WHERE COUNTRY_ID IN 
   (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME ='United States of America'
   )
  )
)
GROUP BY department_id
ORDER BY TOTAL_EMP DESC;

SELECT  department_id, COUNT(*) AS TOTAL_EM... by Mahendiran
Mahendiran
5:03 PM

SELECT  department_id, COUNT(*) AS TOTAL_EMP FROM EMPLOYEES  WHERE department_id IN 
( SELECT department_id from departments WHERE location_id IN 
( SELECT location_id FROM LOCATIONS WHERE COUNTRY_ID IN 
   (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME ='United States of America'
   )
  )
)
GROUP BY department_id
HAVING COUNT(*) >= 5



let me know if you have any question from these queries. Just to know how to join multiple tables.



select all employees whose salary falls between the min and max salary of the job_id = 'AD_ASST'
 
SELECT * FROM employees e WHERE salary 
BETWEEN (select min_salary from jobs where  job_id ='AD_ASST')
AND     (select max_salary from jobs where  job_id ='AD_ASST');

In region_name ='Europe' (regions table) which departments are there ? for all those departments calculate the average, max, min and total employee salary department wise.


SELECT  department_id, SUM(salary), MIN(salary), Max(salary), AVG(salary) FROM  employees WHERE department_id IN
( SELECT department_id FROM departments WHERE



	ing chat

This message has been deleted.

Message List
In HR schema there are 4 tables, employees,... by Mahendiran
Mahendiran
4:52 PM


In HR schema there are 4 tables, employees, departments, locations & countries. 

Write a query to select all employees who a... by Mahendiran
Mahendiran
4:53 PM

Write a query to select all employees who are else working in the departments present in COUNTRY_NAME ='United States of America'

try for few mins by Mahendiran
Mahendiran
4:53 PM

try for few mins


👍
1 Like reaction.
desc all tables and see what are the common... by Mahendiran
Mahendiran
4:55 PM

desc all tables and see what are the common columns among the tables and how we can join one table to another like


👍
5 Like reactions.
5
another question by Mahendiran
Mahendiran
4:57 PM

another question


👍
1 Like reaction.
count the number of employees departments w... by Mahendiran
Mahendiran
4:58 PM

count the number of employees departments wise for those departments present in COUNTRY_NAME ='United States of America'

IN NEXT i need those departments which has ... by Mahendiran
Mahendiran
5:00 PM

IN NEXT i need those departments which has count of employees => 5

SELECT  employee_id, first_name, job_id, de... by Mahendiran
Mahendiran
5:03 PM

SELECT  employee_id, first_name, job_id, department_id FROM EMPLOYEES  WHERE department_id IN 
( SELECT department_id from departments WHERE location_id IN 
( SELECT location_id FROM LOCATIONS WHERE COUNTRY_ID IN 
   (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME ='United States of America'
   )
  )
)
ORDER BY department_id ASC;

SELECT  department_id, COUNT(*) AS TOTAL_EM... by Mahendiran
Mahendiran
5:03 PM

SELECT  department_id, COUNT(*) AS TOTAL_EMP FROM EMPLOYEES  WHERE department_id IN 
( SELECT department_id from departments WHERE location_id IN 
( SELECT location_id FROM LOCATIONS WHERE COUNTRY_ID IN 
   (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME ='United States of America'
   )
  )
)
GROUP BY department_id
ORDER BY TOTAL_EMP DESC;

SELECT  department_id, COUNT(*) AS TOTAL_EM... by Mahendiran
Mahendiran
5:03 PM

SELECT  department_id, COUNT(*) AS TOTAL_EMP FROM EMPLOYEES  WHERE department_id IN 
( SELECT department_id from departments WHERE location_id IN 
( SELECT location_id FROM LOCATIONS WHERE COUNTRY_ID IN 
   (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME ='United States of America'
   )
  )
)
GROUP BY department_id
HAVING COUNT(*) >= 5
ORDER BY TOTAL_EMP DESC;

let me know if you have any question from t... by Mahendiran
Mahendiran
5:04 PM

let me know if you have any question from these queries. Just to know how to join multiple tables.

select all employees whose salary falls bet... by Mahendiran
Mahendiran
5:17 PM


select all employees whose salary falls between the min and max salary of the job_id = 'AD_ASST'

SELECT * FROM employees e WHERE salary  B... by Mahendiran
Mahendiran
5:17 PM

SELECT * FROM employees e WHERE salary 
BETWEEN (select min_salary from jobs where  job_id ='AD_ASST')
AND     (select max_salary from jobs where  job_id ='AD_ASST');

In region_name ='Europe' (regions table) wh... by Mahendiran
Mahendiran
5:27 PM


In region_name ='Europe' (regions table) which departments are there ? for all those departments calculate the average, max, min and total employee salary department wise.

SELECT  department_id, SUM(salary), MIN(sal... by Mahendiran
Mahendiran
5:27 PM

SELECT  department_id, SUM(salary), MIN(salary), Max(salary), AVG(salary) FROM  employees WHERE department_id IN
( SELECT department_id FROM departments WHERE location_id IN
( SELECT location_id FROM locations WHERE country_id IN
( SELECT country_id FROM countries WHERE region_id IN
( SELECT region_id FROM regions WHERE region_name ='Europe'
))))
GROUP BY department_id;

after converting the first_name, last_name ... by Mahendiran
Mahendiran
5:39 PM


after converting the first_name, last_name to upper case join both names and display as single name with their empid

SELECT employee_id, UPPER(first_name) ||' '... by Mahendiran
Mahendiran
5:41 PM

SELECT employee_id, UPPER(first_name) ||' '|| UPPER(last_name) FROM employees;
SELECT employee_id, CONCAT(UPPER(first_name),UPPER(last_name)) FROM employees;

