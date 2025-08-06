SUBPROGRAM
==========
FUNCTIONS:
----------
	Used to compute.
	
		FUNCTION					PROCEDURE
		--------					---------
1. Can be called in SQL stmts		1. Can not be called
2. it returns a VALUE				2. can not return any value
3. it used computation purposes		3. it used to do some processes

=====================================================================
Syntax:
-------

CREATE [OR REPLACE] FUNCTION [schema.]<func_name> [(param_list)] RETURN <data_type> IS|AS
  <body of function>
	RETURN expr;
END <func_name>;

EXAMPLE:
--------
CREATE OR REPLACE FUNCTION f1 (p_empid NUMBER) RETURN NUMBER IS
		i number;
BEGIN
		SELECT salary INTO i FROM emp WHERE employee_id = p_empid;
		RETURN i;
EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Unable to identify the error');
END;
/

CREATE OR REPLACE FUNCTION f1 (p_empid NUMBER) RETURN NUMBER IS
		i number;
BEGIN
		SELECT salary INTO i FROM emp WHERE employee_id = p_empid;
		IF i > 20000 THEN
			RETURN 1;
			DBMS_OUTPUT.PUT_LINE('1');
		ELSIF i BETWEEN 10000 AND 20000 THEN
			RETURN 2;
			DBMS_OUTPUT.PUT_LINE('2');
		ELSE
			RETURN 3;
			DBMS_OUTPUT.PUT_LINE('3');
		END IF;
			DBMS_OUTPUT.PUT_LINE('OUTSIDE OF IF STATEMENT');
EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Unable to identify the error');
END;
/

===========================================================================
PARAMETER NOTATION:
-------------------
1. Positional Notation 
2. Named Notation 
3. Mixed Notation

1. Positional Notation:
-----------------------
		Passing the actual parameter to the same position of the formal parameter.

	p1( p_empid number, p_name varchar2, p_hdate date, p_deptid number);
	p1( v_empid, v_name, v_hiredate, v_department_id);

2. Named Notation:
------------------
		Directly passing value to the Formal parameter using => syntax

	p1( p_empid number, p_name varchar2, p_hdate date, p_deptid number);
	p1(p_name => v_name, p_deptid => v_department_id, p_empid => v_empid,p_hdate => v_hiredate);
	
2. Mixed Notation:
------------------
		It is combination of BOTH Positional and Named notations. 
		It should first start with Positional notation then followed by Named.

	p1(p_empid number, p_name varchar2, p_hdate date, p_deptid number);
	p1(v_empid, p_deptid => v_department_id, p_name => v_name,p_hdate => v_hiredate);
