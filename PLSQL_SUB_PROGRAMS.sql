PL/SQL SUBPROGRAMS:
===================
Definition:
-----------
	A PL/SQL subprogram is a named PL/SQL block that can be invoked repeatedly. 
	If the subprogram has parameters, their values can differ for each invocation.

Two Types:
----------
1. Procedure 
2. Function

Procedure 	--to perform an action 
Function 	--to compute and return a value

Reasons to Use Subprograms
--------------------------
1. Modularity

	Subprograms let you break a program into manageable, well-defined modules.

2. Easier Application Design

	When designing an application, you can defer the implementation details of the 
	subprograms.

3. Maintainability

	You can change the implementation details of a subprogram without changing its invokers.

4. Packageability

	Subprograms can be grouped into packages

5. Reusability

	Any number of applications, in many different environments, can use the same 
	package subprogram or standalone subprogram.

6. Better Performance

	Each subprogram is compiled and stored in executable form, 
	which can be invoked repeatedly. 
	
Types of Subprograms:
---------------------
1. Nested
		--A subprogram created inside a PL/SQL block is a nested subprogram. 
2. Packaged
		--A subprogram created inside a package is a package subprogram. 
3. Standalone Subprograms
		--A subprogram created at schema level is a standalone subprogram. 
			You create it with the CREATE statements.

Subprogram Invocations:
----------------------	
SQL> EXE [CUTE] <proc_name>;

subprogram_name [ ( [ parameter [, parameter]... ] ) ]; -- call in another program

Subprogram Parts:
-----------------
1. Subprogram Heading
	--A subprogram begins with a subprogram heading, 
		which specifies its name and (optionally) its parameter list.
2. Declarative part (optional)
3. Executable part (required)
4. Exception-handling part (optional)

Syntax For Procedure:
---------------------
CREATE [ OR REPLACE ] PROCEDURE [schema_name.]<proc_name> [ (param_list) ] IS|AS
	<body>
END [<proc_name>];

Example:
--------
CREATE OR REPLACE PROCEDURE hr.p1 IS 
		v_sal NUMBER;
		v_job VARCHAR2(20);
BEGIN
		SELECT salary, job_id INTO v_sal, v_job FROM emp WHERE employee_id = 110;
		DBMS_OUTPUT.PUT_LINE('The salary is :'||v_sal||'  The job is :'||v_job);
EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The Record not found');
END p1;
/
---------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE hr.p1(p_empid NUMBER) IS 
		v_sal NUMBER;
		v_job VARCHAR2(20);
BEGIN
		SELECT salary, job_id INTO v_sal, v_job FROM emp WHERE employee_id = p_empid;
		DBMS_OUTPUT.PUT_LINE('The salary is :'||v_sal||'  The job is :'||v_job);
EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The Record not found');
END p1;
/

BEGIN
	p1(150);
END;
---------------------------------------------------------------------------
Formal and Actual Parameters:
-----------------------------
Formal = The parameter declared in the Header of Subprograms
Actual = The variable etc which pass value to Formal parameters.

DECLARE
	v_id NUMBER := 150;  -- Actual Parameter
BEGIN
	p1(v_id);
END;
/
---------------------------------------------------------------------------
PARAMETER MODE:
--------------
1. IN 			--it takes values to INSIDE of the subprogram (DEFAULT)
2. OUT 			--it takes values to OUTSIDE of the subprogram
3. IN OUT 		--first it takes the value inside, after execution, takes the value OUTSIDE

CREATE OR REPLACE PROCEDURE hr.p1(p_empid IN NUMBER, p_sal OUT NUMBER) IS 
		v_sal NUMBER;
		v_job VARCHAR2(20);
BEGIN
		SELECT salary, job_id INTO v_sal, v_job FROM emp WHERE employee_id = p_empid;
		p_sal := v_sal;
EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The Record not found');
END p1;
/

DECLARE
		x NUMBER := 160;
		y number;
BEGIN
		p1(x,y);
		DBMS_OUTPUT.PUT_LINE('The salary of employee_id '||x||'  is '||y);
END;
/
---------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE hr.p1(p_empid IN NUMBER, p_sal IN OUT NUMBER) IS 
		v_sal NUMBER;
		v_job VARCHAR2(20);
BEGIN
		SELECT salary, job_id INTO v_sal, v_job FROM emp WHERE employee_id = p_empid;
		p_sal := p_sal + v_sal;
EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The Record not found');
END p1;
/

DECLARE
		x NUMBER := 160;
		y number := 1000;
BEGIN
		p1(x,y);
		DBMS_OUTPUT.PUT_LINE('The salary of employee_id '||x||'  is '||y);
END;
/
---------------------------------------------------------------------------
DECLARE
		i NUMBER := 110;
		
	PROCEDURE p2(p_empid IN NUMBER) IS 
		x number;
	BEGIN
		SELECT salary INTO x FROM emp WHERE employee_id = p_empid;
		DBMS_OUTPUT.PUT_LINE('The salary is :'||x);
	END;
	
BEGIN
	p2(i);
END;
/
---------------------------------------------------------------------------
1. Pass by REFERENCES -- Variable & parameter points to THE SAME memory location.
2. Pass by VALUE --Variable & parameter points to separate memory location for the same value
---------------------------------------------------------------------------
DESC <sub_program_name>
DESC p1;

ALTER PROCDURE:
---------------
ALTER PROCEDURE <proc_name> COMPILE;
ALTER PROCEDURE p1 COMPILE;

DROP PROEDURE
-------------
DROP PROCEDURE <proc_name>;
DROP PROCEDURE p1;

DATA DICTIONARY VIEWS:
----------------------
USE_OBJECTS
USER_SOURCE




	
	