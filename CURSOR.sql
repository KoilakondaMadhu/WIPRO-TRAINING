SQL> set serveroutput on
  
 1. Implicit Cursor
Used automatically by Oracle for single-row queries like SELECT INTO, INSERT, UPDATE, DELETE.

Example:
DECLARE
  v_emp_name employees.last_name%TYPE;
BEGIN
  SELECT last_name INTO v_emp_name
  FROM employees
  WHERE employee_id = 100;

  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emp_name);
END;

--------------------------------------------

EMPL name King
======================================================================================================
 2. Explicit Cursor
Used when you need to manually control row-by-row processing of a query that returns multiple rows.


DECLARE
  CURSOR cursor_name IS
    SELECT_statement;

  record_variable table_name%ROWTYPE; -- or define individual columns
BEGIN
  OPEN cursor_name;
  LOOP
    FETCH cursor_name INTO record_variable;
    EXIT WHEN cursor_name%NOTFOUND;

    -- Process each row here
    DBMS_OUTPUT.PUT_LINE('Data: ' || record_variable.column_name);
  END LOOP;
  CLOSE cursor_name;
END;



















