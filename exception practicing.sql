
Predefined:
----------
1. DUP_VAL_ON_INDEX -- When try to insert duplicate values for PK/Unique key COLUMNS
2. NO_DATA_FOUND    -- when the SELECT stmt fails to fetch a record/value
3. TOO_MANY_ROWS	-- when the SELECT stmt fetch more than one row
4. VALUE_ERROR		-- WHEN datatype mismatch/actual value is lengther than the width of variable
5. ZERO_DIVIDE		-- when try divide a number with Zero eg 15/0

DECLARE 
      x number (6);
BEGIN 
      SELECT salary INTO x FROM employees WHERE employee_id = 1000;
      DBMS_OUTPUT.PUT_LINE('Salary is :' || x);
EXCEPTION 
             WHEN DUP_VAL_ON_INDEX THEN 
             DBMS_OUTPUT.PUT_LINE('YOU INSERT DUPLICATE VALUE, CHANGE THE ID VALUE');

             WHEN NO_DATA_FOUND THEN 
             DBMS_OUTPUT.PUT_LINE('THE RECORD / VALUE NOT FOUND IN TABLE');

             WHEN TOO_MANY_ROWS THEN 
             DBMS_OUTPUT.PUT_LINE('DUPLICATE RECORD/VALUES FOUND');

             WHEN OTHERS THEN 
             DBMS_OUTPUT.PUT_LINE('UNABLE TO IDENTIFY THE ERROR');
END;
/
-------------------------------------------------------------------------------------------

THE RECORD / VALUE NOT FOUND IN TABLE

PL/SQL procedure successfully completed.


EXPLAIN 
THERE IS NO ROW WITH EMPLOYEEE_ID IN  = 1000 IN THE EMPLOYEES TABLE

=========================================================================================================


USER DEFINED EXCEPTION 
----------------------


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
====================================================================================
-- Declare a variable to hold the commission_pct of the employee
DECLARE 
    v_comm emp.commission_pct%TYPE;  -- Same data type as emp.commission_pct

    --<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Declare a user-defined exception for NULL commission
    ex_null_comm EXCEPTION;

BEGIN
    -- Retrieve commission_pct into v_comm for employee with ID 100
    SELECT commission_pct INTO v_comm 
    FROM emp 
    WHERE employee_id = 100;

    -- Check if the retrieved commission is NULL
    IF v_comm IS NULL THEN
        -- Raise custom exception if commission is NULL
        RAISE ex_null_comm;
    ELSE
        -- If not NULL, display the commission
        DBMS_OUTPUT.PUT_LINE('The commission is :' || v_comm);
    END IF;

-- Exception section to handle errors
EXCEPTION
    -- Handle the custom exception if commission was NULL
    WHEN ex_null_comm THEN
        -- Update commission to 0.5 for employee_id = 100
        UPDATE emp 
        SET commission_pct = 0.5 
        WHERE employee_id = 100;

        -- Commit the update
        COMMIT;

        -- Display confirmation message
        DBMS_OUTPUT.PUT_LINE('COMM was NULL, so update the record');

    -- Handle any other unexpected errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unable to find the error');
END;
----------------------------------------------------------------------------------------
The commission is :.5

PL/SQL procedure successfully completed.

=========================================================================================================


DECLARE 
		v_comm emp.commission_pct%TYPE;
		ex_null_comm EXCEPTION;
BEGIN
		SELECT commission_pct INTO v_comm FROM emp WHERE employee_id = 100;
		IF v_comm IS NULL THEN
			RAISE ex_null_comm;
              	DBMS_OUTPUT.PUT_LINE('after rise ');
		ELSE
			DBMS_OUTPUT.PUT_LINE('The commission is :'||v_comm);
		END IF;
EXCEPTION
    DBMS_OUTPUT.PUT_LINE('inside exception ');
		WHEN ex_null_comm THEN
			UPDATE emp SET commission_pct = .5 WHERE employee_id = 100;
			COMMIT;
			DBMS_OUTPUT.PUT_LINE('COMM was NULL, so update the record');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Unable to find the error');
END;
  
  ---------------
  
  
  
  
  ==============================================================================================





1. Assign error code to user defined exception -- PRAGMA EXCEPTION_INIT
2. assign error msg to user defined error code -- RAISE_APPLICATION_ERROR
3. 20000 - 20999

PRAGMA EXCEPTION_INIT
    Purpose of PRAGMA EXCEPTION_INIT
It allows you to associate a user-declared exception with a specific
    Oracle error number, so that you can handle that error with a WHEN clause by name, instead of catching all errors with WHEN OTHERS.
but in both cases procedure name is same righ
    
DECLARE 
      v_comm emp.commission_pct%TYPE;
      ex_null_comm EXCEPTION  -->>>>>>>>>>>>>>>>>>>>>>im declareing it is an exception here 
      PRAGMA EXCEPTION_INIT(ex_null_comm, -20100);
BEGIN 
      ASELECT commission_pct INTO v_comm FROM emp WHERE employee_id = 100;
      IF  v_comm IS NULL THEN
            RAISE_APPLICATION_ERROR(-20100,'This is my own error Message');
      ELSE 
            DDBMS_OUTPUT.PUT_LINE('the commision is : '||v_comm);

      END IF;
END;
      

------------------------------------------------------------------------------------
The commission is :.5

PL/SQL procedure successfully completed.







================================================================================================

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
=====================================================================================================

EXCEPTION PROPAGATION :
----------------------
DECLARE 
      x NUMBER ;
      y NUMBER ;
BEGIN 
      DBMS_OUTPUT.PUT_LINE('The outer block starts');


          ----<<<<<<<<<<INNER BLOCK
        DECLARE 
                a NUMBER;
                b NUMBER;
              BEGIN
                     DBMS_OUTPUT.PUT_LINE('Inside of INNER block');
                     SELECT salary INTO a FROM emp;
                EXCEPTION 
                      WHEN ZERO_DIVIDE THEN 
                            DBMS_OUTPUT.PUT_LINE('CAN NOT DEVIDE WITH ZERO');
              END;

        DBMS_OUTPUT.PUT_LINE('the outer block before exception');
        Exception 
            WHEN TOO_MANY_ROWS THEN 
              
        DBMS_OUTPUT.PUT_LINE('the too many rows handled in the outer block');

END;
---------------------------------------------------------------------------------------
The outer block starts
Inside of INNER block
the too many rows handled in the outer block

PL/SQL procedure successfully completed.













