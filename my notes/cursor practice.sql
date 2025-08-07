
https://www.youtube.com/watch?v=_snAMqCBitg&list=PLL_LQvNX4xKyiExzq9GKwORoH6nvaRnOQ&index=27

  
cursor is a pointer  to a memory area
context area  is a memmory region inside the process global Area or PGA
ASSIGNED to hold the information about the processing of a select statement or dml statement

contex area?
  context area is a memory region inside the pga which helps oracle server i processing an 
  sql statement by holding the important informationabout that statement
includes
  rows returned by query
  number of rows processed by a query
  a pointer to the query in the shared pool

  
using cursor you can control the context area as it is a pointer to the same
  --------------------------------------------------------------------------

types of cursor
  implicit cursor
  -----------------
  automatiacl created by the oracle server
  user cannot control the behavior of these cursor

  oracle server creates an implict cursor for any pl/sql block which execute an sql statement
  as long as an explicit cursor does not exist for that sql staements
---------------------------------------------------------------------------
EXPLICIT CUSOR
  Explicit cursor are used defined cursor 
  user has full control of explicit cursor

steps for creating explicit cursor 
  4
  1. declare  
  2. open
  3.fetch
  4.close

1)Declare a cursor means inintializing a cursor into a memory
you define explicit cursor in declaration setion of your pl/sql block

SYNTAX OF DECLARE
  CURSOR cursor_name IS select_statement;
 ----------------------------------------
2)OPEN 
  in order to put that cursor to work we have to open it first
  when you open a cursor the memory will be alloted to it
OPEN  cursor_name
 ---------------- 
3)FETCH 
   the process of retriving the data from the cursor is called fetching.
  FETCH cursor_name INTO plsql variable;
  --------------------------------------
  or 
  FETCH cursor_name INTO pl/sql record;
----------------------------------------
4) CLOSE 
  CLOSE cursor_name

-----------------------------------------------------------
  basic structure of cursor
DECLARE 
         CURSOR cursor_name IS select_statement;
BEGIN 
     OPEN  cursor_name;
     FETCH  cursor_name INTO pl/sql variable;
     CLOSE  cursor_name;
END;
  
-----------------------------------------------------------------------
1) example 
  -----------
  -----------




  
DECLARE 
  -- Variable to store the fetched first_name
  v_name VARCHAR2(30);

  -- Cursor declaration: Select first_name of employees with ID less than 105
  CURSOR cur_rr IS 
    SELECT first_name 
    FROM employees
    WHERE employee_id < 105;
BEGIN 
   -- Open the cursor to start fetching rows
   OPEN cur_rr;
   LOOP 
      -- Fetch one row's first_name into the variable
      FETCH cur_rr INTO v_name;

      -- Exit the loop when no more rows are found
      EXIT WHEN cur_rr%NOTFOUND;
                      --------------  <DONT FORGET THE %NOTFOUND


      -- Display the fetched name in the output
      DBMS_OUTPUT.PUT_LINE(v_name);
   END LOOP;

   -- Close the cursor to free resources
   CLOSE cur_rr;
END;
/
==============================================================================================================
  PARAMETER CURSOR

DECLARE 
   v_name VARCHAR2(30);
   CURSOR cur_1 (par_1 varchar2) IS      --- <HERE WE DDECLARE PARAMETER AS VARCHAR2 BUT IT WE USE 105 NUBER BUT INTERNALLY IT CONVERS TO CHAR AND GIVE VALUE
   SELECT first_name FROM employees WHERE employee_id < par_1;
BEGIN
  OPEN cur_1(105);
  LOOP 
       FETCH cur_1 INTO v_name;
       EXIT WHEN cur_1%NOTFOUND;
                  --------------  <DONT FORGET THE %NOTFOUND
        DBMS_OUTPUT.PUT_LINE(V_NAME);
  END LOOP;   -- ;TERMINATE THE LOOP

  CLOSE cur_1;
END;
-------------------------------------------------------
Steven
Neena
Lex
Alexander
Bruce

PL/SQL procedure successfully completed.
-------------------------------------------------------------------------------
CAN ALSO USE NUMBER DATATYPE PARAMETER
  
DECLARE 
   v_name VARCHAR2(30);
   CURSOR cur_1 (par_1 NUMBER) IS
   SELECT first_name FROM employees WHERE employee_id < par_1;
BEGIN
  OPEN cur_1(105);  -------<using the parameter
  LOOP 
       FETCH cur_1 INTO v_name;
       EXIT WHEN cur_1%NOTFOUND;
                  --------------  <DONT FORGET THE %NOTFOUND
        DBMS_OUTPUT.PUT_LINE(V_NAME);
  END LOOP; ----; THE LOOP 

  CLOSE cur_1;
END;
-------------------------------------------------------------------------------------------------
Steven
Neena
Lex
Alexander
Bruce

PL/SQL procedure successfully completed.

  ========================================================================================
  
  1  DECLARE
  2        var_1 varchar2(20);
  3        CURSOR cur_1 (par_1 NUMBER ) IS  -- do not forget is before select
  4        SELECT first_name FROM EMPLOYEES WHERE employee_id<par_1;
  5  BEGIN
  6       OPEN
  7           CUR_1(105);
  8  LOOP
  9       -- DO NOT FOR GET THE FETCH
 10       FETCH cur_1 into var_1;  -- after featch it should to exit
 11       EXIT WHEN CUR_1%NOTFOUND; --ITS WHEN NOT WHERE
 12       DBMS_OUTPUT.PUT_LINE(VAR_1);
 13  END LOOP;
 14  CLOSE CUR_1;
 15* END;
 16  /
   --------------------
   
Steven
Neena
Lex
Alexander
Bruce

------------------------------------------------
    DECLARE
  2     var_1 varchar2(20);
  3          CURSOR cur_1 (par NUMBER ) IS -- DONT FOR GET  IS
  4          SELECT first_name
  5          FROM EMPLOYEES WHERE EMPLOYEE_ID < par ;
  6  BEGIN
  7        OPEN cur_1(150);
  8    LOOP
  9        FETCH cur_1 into var_1;
 10        EXIT WHEN cur_1%NOTFOUND;
 11        dbms_OUTPUT.PUt_line (var_1);
 12    END LOOP;
 13* END;

==================================================================================================================
  
IMPLICT CURSOR:
---------------

DECLARE 
    v_deptno NUMBER := 20;
BEGIN 
    DELETE FROM emp WHERE department_id = v_deptno;
    DBMS_OUTPUT.PUT_LINE('THE # OF RECORD DELETE ID :'||SQL%ROWCOUNT);
END;

----------------------------------------------------------------------------
DECLARE
    v_deptno NUMBER := 20;   -- Variable to store department ID
BEGIN
    DELETE FROM emp 
    WHERE department_id = v_deptno;  -- Deletes all rows where dept_id = 20

    DBMS_OUTPUT.PUT_LINE(
        'The # of record delete is : ' || SQL%ROWCOUNT                 --  SQL%ROWCOUNT
                                                                 --Built-in cursor attribute that returns the number of rows affected by 
                                                                  --the last DML statement (INSERT, UPDATE, DELETE) in the block.
                                                                    --Here, it will return the number of rows deleted.
    );  -- Prints the number of rows deleted
END;
/
----------------------------------------------------------------------------------
  The # of record delete is : 3
----------------------------------------------------------------------------------------

Key Points
v_deptno NUMBER := 20;
Declares a variable and assigns it the value 20.

DELETE FROM emp WHERE department_id = v_deptno;
Deletes rows from the emp table where department_id matches 20.

SQL%ROWCOUNT

Built-in cursor attribute that returns the number of rows affected by the last DML statement (INSERT, UPDATE, DELETE) in the block.

Here, it will return the number of rows deleted.

DBMS_OUTPUT.PUT_LINE
Prints the message along with the number of deleted records.
================================================================================================================================================================================================================



BEGIN
    -- Loop through each employee record where salary is greater than 15000
    FOR i IN (
        SELECT first_name, salary, department_id 
        FROM emp 
        WHERE salary > 15000
    )
    LOOP
        -- Print employee details: first name, salary, and department ID
        DBMS_OUTPUT.PUT_LINE(
            'The name is : ' || i.first_name ||
            ' The salary is : ' || i.salary ||
            ' The dept is : ' || i.department_id
        );
    END LOOP; -- End of the loop for each selected employee
END;
/

the name is :Steven the salary is:24000the dept is:90
the name is :Neena the salary is:17000the dept is:90
the name is :Lex the salary is:17000the dept is:90


Explanation of the Flow
FOR i IN (SELECT...) LOOP →
Runs an implicit cursor FOR loop over the result set of the SELECT query.

SELECT first_name, salary, department_id FROM emp WHERE salary > 15000 →
Fetches only those employees whose salary is more than 15,000.

i.first_name, i.salary, i.department_id →
Each row returned is stored in i, and the columns are accessed using dot notation.

DBMS_OUTPUT.PUT_LINE →
Prints the values for each employee to the console.

END LOOP; →
Ends the loop after all qualifying employees are processed.

======================================================================================================
                              ---<<<<<<<<<STRUCTURE OF EXPLICIT CURSOR>>>>>>>>>>
EXPLICIT CURSOR:       
----------------

Declaring Cursor:
               CURSOR <cursor_name> IS <select stmt>;   -- <<<<<<<dont for get IS
Opening cursor:
                OPEN <cursor_name>;  --,,,,,,,,cursor open
                LOOP  --<<<<<<open loop
Fetching Cursor:
                FETCH <cursor_name> INTO <variable list>;
                END LOOP; ---<<<<<<<<<<end loop
Closing Cursor:
                CLOSE <cursor_name>; --,,,,,,,,cursor close



=================================================================================================
DECLARE
    -- Declaring a cursor 'c1' to select first_name, job_id, and salary from the 'emp' table
    CURSOR c1 IS 
        SELECT first_name, job_id, salary FROM emp;

    -- Declaring variables to store the fetched values from the cursor
    v_name emp.first_name%TYPE; 
    v_job emp.job_id%TYPE;
    v_sal emp.salary%TYPE;

BEGIN
    -- Opening the cursor to start fetching records
    OPEN c1;

    -- Starting a loop to fetch data one row at a time
    LOOP
        -- Fetching the values into declared variables
        FETCH c1 INTO v_name, v_job, v_sal;

        -- Exit the loop when there are no more records to fetch
        EXIT WHEN c1%NOTFOUND;

        -- Conditional block to check if salary is greater than 10000
        IF v_sal > 10000 THEN
            -- Outputting the values to the console
            DBMS_OUTPUT.PUT_LINE(
                'The name is :' || v_name ||
                ' The salary is :' || v_sal ||
                ' The job is :' || v_job
            );
        END IF;
    END LOOP;

    -- Closing the cursor after processing all records
    CLOSE c1;
END;
/
============================================================================================================\
  PARAMETER CURSOR
  ----------------

  SQL> EDIT
Wrote file afiedt.buf

  1  DECLARE
  2     var_1 varchar2(20);
  3          CURSOR cur_1 (par NUMBER ) IS -- DONT FOR GET  IS
  4          SELECT first_name
  5          FROM EMPLOYEES WHERE EMPLOYEE_ID < par ;
  6  BEGIN
  7        OPEN cur_1(150);
  8    LOOP
  9        FETCH cur_1 into var_1;
 10        EXIT WHEN cur_1%NOTFOUND;
 11        dbms_OUTPUT.PUt_line (var_1);
 12    END LOOP;
 13* END;
SQL> /
Steven
Neena
Lex
Alexander
Bruce
David
Valli
Diana
Nancy
Daniel
John

============================================================================================================

DEFAULT CURSOR
-------------
Wrote file afiedt.buf

  1  DECLARE
  2       V_NAME VARCHAR2(30);
  3       v_ID NUMBER(30);
  4  CURSOR CUR_1 (PAR NUMBER   := 150) IS SELECT FIRST_NAME,EMPLOYEE_ID FROM EMPLOYEES WHERE EMPLOYEE_ID<PAR;
  5     BEGIN OPEN CUR_1;
  6  LOOP
  7      FETCH CUR_1 INTO V_NAME,V_ID;
  8      EXIT WHEN CUR_1%NOTFOUND;
  9      DBMS_OUTPUT.PUT_LINE('EMPLOYE NAME IS '|| V_NAME||'ID IS '||V_ID);
 10  END LOOP;
 11* END;
SQL> /
EMPLOYE NAME IS StevenID IS 100
EMPLOYE NAME IS NeenaID IS 101
EMPLOYE NAME IS LexID IS 102
EMPLOYE NAME IS AlexanderID IS 103
EMPLOYE NAME IS BruceID IS 104
EMPLOYE NAME IS DavidID IS 105
EMPLOYE NAME IS ValliID IS 106
EMPLOYE NAME IS DianaID IS 107
EMPLOYE NAME IS NancyID IS 108
EMPLOYE NAME IS DanielID IS 109
====================================================================================



















