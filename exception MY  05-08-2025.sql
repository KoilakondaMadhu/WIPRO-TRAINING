


Predefined:
  1. DUP_VAL_ON_INDEX   -- When try to insert duplicate values for PK/Unique key COLUMNS
  2. NO_DATA_FOUND      -- when the SELECT stmt fails to fetch a record/value
  3. TOO_MANY_ROWS      -- when the SELECT stmt fetch more than one row
  4. VALUE_ERROR -- WHEN DATATYPE MISMATCH/ ACTUAL VALUE IS LEATHER

DECLARE
    x number(1);
BEGIN
    SELECT salary INTO x FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE('Salary is :'||x);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('You insert Duplicate value, Change the ID value');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('The record/value not found in table');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate records/values found');
    WHEN OTHERS THEN
      
END;

-----------------------------------------------------------------------------------------
SQL> /
An unexpected error occurred: ORA-06502: PL/SQL: numeric or value error: number
precision too large

PL/SQL procedure successfully completed.




  DECLARE
    x NUMBER(1);
BEGIN
    SELECT salary INTO x FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE('Salary is :' || x);
EXCEPTION
   
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('You insert Duplicate value, Change the ID value');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('The record/value not found in table');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate records/values found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/


=============================================


 DECLARE
    x NUMBER(1);
BEGIN
    SELECT salary INTO x FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE('Salary is :' || x);
EXCEPTION
   WHEN OTHERS THEN                ---------------------------------<<<<<<<<<<<<<<<<<<<<SHOULD BE AT LAS ONLY
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM); 
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('You insert Duplicate value, Change the ID value');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('The record/value not found in table');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate records/values found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/

----------------------------------------------------------
    *
ERROR at line 7:
ORA-06550: line 7, column 4:
PLS-00370: OTHERS handler must be last among the exception handlers of a block -----<<<<<<<<<<OTHERS SHOULD BE LAST
ORA-06550: line 0, column 0:
PL/SQL: Compilation unit analysis terminated


  ========================================


DECLARE
    x number(6);
BEGIN
    SELECT salary INTO x FROM employees WHERE employee_id = 1000;
    DBMS_OUTPUT.PUT_LINE('Salary is :'||x);
EXCEPTION
    /* WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('You insert Duplicate value, Change the ID value');
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('The record/value not found in table');
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Duplicate records/values found');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('unable to identify the error');*/
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('unable to identify the error');    ---<<<<<<<<<<<<<<<<<<<<<<<<<<IF THERE IS NO OTHER EXCEOPRION ONLY THEN IT WILL WORK 
END;
/
-------------------------------------------------------
unable to identify the error

PL/SQL procedure successfully completed.

=======================================================================================================



user defined exception
USER DEFINED EXCCEPTION

DECLARE
    v_comm emp.commission_pct%TYPE;
    ex_null_comm EXCEPTION;
BEGIN
    SELECT commission_pct INTO v_comm FROM emp WHERE employee_id = 100;
    IF v_comm IS NULL THEN
        RAISE ex_null_comm;
    ELSE
        DBMS_OUTPUT.PUT_LINE('The commission is :'||v_comm);
    END IF;
EXCEPTION
    WHEN ex_null_comm THEN
        UPDATE emp SET commission_pct = .5 WHERE employee_id = 100;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('COMM was NULL, so update the record');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unable to find the error');
END;
/

----------------------------------------------------------------------------------------------

The commission is: .5

PL/SQL procedure successfully completed.

========================================================================================================
-- Declare section: variables and custom exception
DECLARE
    v_comm emp.commission_pct%TYPE;  -- Variable to hold the commission value for the employee
    ex_null_comm EXCEPTION;          -- Custom exception to handle NULL commission case

BEGIN
    -- Fetch the commission_pct value for employee_id = 100
    SELECT commission_pct INTO v_comm FROM emp WHERE employee_id = 100;

    -- Check if the commission is NULL
    IF v_comm IS NULL THEN
        RAISE ex_null_comm;  -- Raise custom exception if commission is NULL
    ELSE
        -- If not NULL, print the commission
        DBMS_OUTPUT.PUT_LINE('The commission is :' || v_comm);
    END IF;

-- Exception handling section
EXCEPTION
    WHEN ex_null_comm THEN
        -- Handle custom exception: update NULL commission to 0.5
        UPDATE emp SET commission_pct = 0.5 WHERE employee_id = 100;
        COMMIT;  -- Save the changes
        DBMS_OUTPUT.PUT_LINE('COMM was NULL, so update the record');

    WHEN OTHERS THEN
        -- Handle any other unexpected errors
        DBMS_OUTPUT.PUT_LINE('Unable to find the error');
END;
/



===================================================================================================

20000  - 20999


1.assign error code to your exception -- PRACMA_EXCEPTION_INIT
2. assign error msg to your error code   -- RAISE_APPLICTION_ERROR


  
============================================================


1. assign error code to user defined Exception     -- PRAGMA EXCEPTION_INIT
2. assign error msg to user defined error code     -- RAISE_APPLICATION_ERROR
  
 ============================================================================================== 
DECLARE
    v_comm emp.commission_pct%TYPE;
    ex_null_comm EXCEPTION;
    PRAGMA EXCEPTION_INIT (ex_null_comm, -20100);
BEGIN
    SELECT commission_pct INTO v_comm FROM emp WHERE employee_id = 100;
    IF v_comm IS NULL THEN
        RAISE_APPLICATION_ERROR(-20100, 'This is my own error Message');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The commission is :'||v_comm);
    END IF;
EXCEPTION
    WHEN ex_null_comm THEN
        UPDATE emp SET commission_pct = .5 WHERE employee_id = 100;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('COMM was NULL, so update the record');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unable to find the error');
END;
/



========================================================================================================

EXCEPTION PROPAGATION 

------------------

DECLARE 
     X NUMBER ;
     Y  NUMBERL;
BEGIN 
      DBMS_OUTPUT.PUT_LINE('THE OUTER BLOCK STARTS');
        DECLARE 
                a NUMBER ;
                b NUMBER ;
        BEGIN 
              DBMS_OUTPUT.PUT_LINE('INSIDE OF INNERR BLOCK :' );
              SELECT salary INTO a FROM emp; -- <<<<<<<<<<<<<<fetch more rows so TOO_MANY_ROWS raise
        EXCEPTION 
              WHEN ZERO_DIVIDE THEN   ---<<<<<<<<<<<<<<<<<<<<<<<ONLY ZERO DIVIDE IS HANDELD
                      DBMS_OUTPUT.PUT_LINE('CAN NOT DEVIDE WITH ZERO');
        END;
       DBMS_OUTPUT.PUT_LINE('The outer block Before EXCEPTION ');
EXCEPTION 
    WHEN TOO_MANY_ROWS THEN 
        DBMS_OUTPUT.PUT_LINE('THE TOO MANY ROWS HANDED IN THE OUTER BLOCK');
END;
--------------------------------------------------------------------------------------------------------------
THE OUTER BLOCK STARTS
INSIDE OF INNERR BLOCK :
THE TOO MANY ROWS HANDED IN THE OUTER BLOCK ----<<<<<<<<<<<<IT MEANS THE OUTER EXCEPTION BLOCK IS HANDE THE EXCEPTION  OF THE INNER EXCEPTION 

PL/SQL procedure successfully completed.


  the above is unanymous they can not be referced 
============================================================================================================
============================================================================================================

=============================================================================================================
  --<<<<<<<<<<<<<<<<<<<<<<<SUBPROGRAMS

SUB PROGRAMS:   is a named pl/sql block which is stored in the database and CAN BE refered in any statements
--------------


 salary: 
DECLARE 
       i NUMBER ;
        y varchar2(40);
BEGIN 
      SELECT salary , job_id into i,y from employees where employee_id = p_empid;
      DBMS_OUTPUT.PUT_LINE('THE SALARY IS :' ||i);
END;
/

=============================================================================================



PL/SQL Subprograms
Definition
A PL/SQL subprogram is a named PL/SQL block that can be invoked repeatedly.

If the subprogram has parameters, their values can differ for each invocation.

Two Types:
Procedure – to perform an action

Function – to compute and return a value

Reasons to Use Subprograms
1. Modularity

Subprograms let you break a program into manageable, well-defined modules.

2. Easier Application Design

When designing an application, you can defer implementation details of the subprograms until youve tested the main program, and then refine them one step at a time.


3 Maintainability
you can change the implementation details of a subprogram without changing its invoker
4 Packageability
 SUBPROGRAMS CAN BE GROUPED INTO PACKAGES
5 REUSABILITY
 Any number of applications, in many different environments, can use the same


=========================================
















===================
====

















=========================











syntax for procedure :


CREATE [ OR REPLACE ] PROCEDURE [ schema_name. ] <proc_name> (param_list) ] IS | AS
<BODY>

END [<proc_name>

  example 
  







-- Create or replace a procedure named p1 in the HR schema
CREATE OR REPLACE PROCEDURE hr.p1 IS

    -- Declare a variable to store the salary
    v_sal NUMBER;

    -- Declare a variable to store the job ID
    v_job VARCHAR2(20);

BEGIN
    -- Start an inner block to handle exceptions specifically for the SELECT statement
    BEGIN
        -- Try to fetch salary and job ID for employee with ID 110 from the EMP table
        SELECT salary, job_id INTO v_sal, v_job
        FROM emp
        WHERE employee_id = 110;

        -- Print the fetched values using DBMS_OUTPUT
        DBMS_OUTPUT.PUT_LINE('The salary is : ' || v_sal || '  The job is : ' || v_job);

    EXCEPTION
        -- Handle case where no record is found for employee_id = 110
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('The Record not found');
    END;
END p1;
/

  --------------------------
  Procedure created.
===============================================================================================================================



-- Create or replace a dynamic procedure with input parameter p_empid
CREATE OR REPLACE PROCEDURE hr.p1(p_empid NUMBER) IS
    -- Declare variables to store result of SELECT
    v_sal NUMBER;
    v_job VARCHAR2(20);
BEGIN
    BEGIN
        -- Fetch salary and job for the given employee ID
        SELECT salary, job_id INTO v_sal, v_job
        FROM emp
        WHERE employee_id = p_empid;

        -- Print the fetched data
        DBMS_OUTPUT.PUT_LINE('The salary is :' || v_sal || '  The job is :' || v_job);

    EXCEPTION
        -- Handle case when no matching employee is found
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('The Record not found');
    END;
END p1;
/



SQL> BEGIN
  2      p1(999);
  3  END;
  4  /
   --------------------------------------------------------------------------------- 
The Record not found

PL/SQL procedure successfully completed.

=======================================================================================================================


FORMAL and ACTUAL Parameters:
------------------------------
Formal == THE  Parameter declare in the header of Subprograms
Actual == The Variable etc which pass value to Formal Parameters.

DECLARE 
        v_id NUMBER := 150;
BEGIN 
        p1(v_id);
END;


===============================================================================
PARAMETER MODE:
1. IN    -- it takes values to INSIDE of the subprogram (DEFAULT)
2. OUT   -- it takes values to OUTSIDE of the subprogram
3. IN OUT -- first it takes the value inside , after execution , takes the value OUTSIDE
 inout is not advisable to use it

CREATE OR REPLACE PROCEDURE hr.p1(p_empid IN NUMBER, p_sal OUT NUMBER) IS 
      v_sal NUMBER;
      v_job VARCHAR2(20);

BEGIN 
      SELECT salary , job_id  INTO v_sal , v_job FROM emp WHERE employee_id = p_empid;
      p_sal := v_sal;
EXCEPTION 
      WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE ('THE RECORD NOT FOUND');
END p1;
/
--------------------------------------------------------------------
===================================================================================================




DECLARE
    v_id NUMBER := 150;
    v_salary NUMBER;
BEGIN
    p1(v_id, v_salary);
END;
/



m
===============================================================================================================
--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<IN OUT

CREATE OR REPLACE PROCEDURE hr.p1(
    p_empid IN NUMBER,
    p_sal   IN OUT NUMBER
) IS
    v_sal NUMBER;
    v_job VARCHAR2(20);
BEGIN
    BEGIN
        SELECT salary, job_id INTO v_sal, v_job
        FROM emp
        WHERE employee_id = p_empid;

        p_sal := p_sal + v_sal;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('The Record not found');
    END;
END p1;
/


---------------------------------
DECLARE 
      X NUMBER := 160;
      Y  NUMBER := 1000;
BEGIN 
    P1(X,Y);
    DBMS_OUTPUT.PUT_LINE('the salary of employee_id ' ||X||'is' ||Y);

end;

---------------------------------------------------------------------------------------

the salary of employee_id 160is8500

PL/SQL procedure successfully completed.

=================================================================================================


DECLARE 
        i NUMBER := 110;
    PROCEDURE p2(p_empid IN NUMBER ) IS 
        x number;
    BEGIN 
        SELECT salary INTO x FROM emp WHERE employee_id = p_empid;
        DBMS_OUTPUT.PUT_LINE('The salary is : ' || x);
    END;
BEGIN 
    p2(i);
END;

    

=============================================================

1. pass by referance 
2. pass by value




















































