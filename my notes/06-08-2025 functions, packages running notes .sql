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








































































