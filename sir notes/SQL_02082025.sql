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
