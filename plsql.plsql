
SQL> set serveroutput on
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
    --AND e.employee_id = 101;

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


















