
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

SQL>

























































































