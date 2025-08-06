EXCEPTION : ERROR HANDLINGING
=============================
Ways to get errors.

1. system -- failure of hardware, not available of oracle
2. user   -- wrongly delete or droped /insert etc data 
3. data   -- example duplicate values, NULL values 

Exception Types:
----------------
1. Internal  	-- Only error code.
2. Predefined 	-- error code + a name for that error code
3. user defined -- user has to declare, raise and handle

Predefined:
----------
1. DUP_VAL_ON_INDEX -- When try to insert duplicate values for PK/Unique key COLUMNS
2. NO_DATA_FOUND    -- when the SELECT stmt fails to fetch a record/value
3. TOO_MANY_ROWS	-- when the SELECT stmt fetch more than one row
4. VALUE_ERROR		-- WHEN datatype mismatch/actual value is lengther than the width of variable
5. ZERO_DIVIDE		-- when try divide a number with Zero eg 15/0

DECLARE
		x number(6);
BEGIN
		SELECT salary INTO x FROM employees WHERE employee_id = 1000;
		DBMS_OUTPUT.PUT_LINE('Salary is :'||x);
EXCEPTION 
			WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('You insert Duplicate value, Change the ID value');
			WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('The record/value not found in table');
			WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE('Duplicate records/values found');
			WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('unable to identify the error');
			WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('unable to identify the error');
				
END;
/

USER DEFINED EXCEPTION:
-----------------------

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
==========================================================================
1. assign error code to user defined Exception  -- PRAGMA EXCEPTION_INIT
2. assign error msg to user defined error code  -- RAISE_APPLICATION_ERROR
3. 20000-20999

DECLARE 
		v_comm emp.commission_pct%TYPE;
		ex_null_comm EXCEPTION;
		PRAGMA EXCEPTION_INIT (ex_null_comm,-20100);
BEGIN
		SELECT commission_pct INTO v_comm FROM emp WHERE employee_id = 100;
		IF v_comm IS NULL THEN
			RAISE_APPLICATION_ERROR(-20100,'This is my own error Message');
		ELSE
			DBMS_OUTPUT.PUT_LINE('The commission is :'||v_comm);
		END IF;
/*EXCEPTION
		WHEN ex_null_comm THEN
			UPDATE emp SET commission_pct = .5 WHERE employee_id = 100;
			COMMIT;
			DBMS_OUTPUT.PUT_LINE('COMM was NULL, so update the record');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Unable to find the error');*/
END;
/		
============================================================================
EXCEPTION PROPAGATION:
----------------------
DECLARE 
		x NUMBER;
		y NUMBER;
BEGIN
	DBMS_OUTPUT.PUT_LINE('The outer block starts');
		DECLARE
			a NUMBER;
			b NUMBER;
		BEGIN
			DBMS_OUTPUT.PUT_LINE('Inside of INNER block');
			SELECT salary INTO a FROM emp; --fetch more rows so TOO_MANY_ROWS raised.
		EXCEPTION
			WHEN ZERO_DIVIDE THEN
				DBMS_OUTPUT.PUT_LINE(' Can not devide with Zero');
		END;
	DBMS_OUTPUT.PUT_LINE('The outer bloCK BEFORE EXECEPTION');	
EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('THE TOO MANY ROWS HANDLED IN THE OUTER BLOCK');
END;
/

			