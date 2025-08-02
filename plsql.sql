
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
declare 
  v_sal Number(10);
begin 


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














