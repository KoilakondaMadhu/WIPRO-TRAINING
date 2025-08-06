IMPLICIT CURSOR:
----------------
DECLARE
	v_deptno NUMBER := 20;
BEGIN
	DELETE FROM emp WHERE department_id = v_deptno;
	DBMS_OUTPUT.PUT_LINE ('The # of record delete is :'||SQL%ROWCOUNT);
END;
/
==========================================================================
BEGIN
		FOR i IN (SELECT first_name, salary, department_id 
					FROM emp WHERE salary > 15000)
		LOOP
			DBMS_OUTPUT.PUT_LINE('The name is :'||i.first_name
									||'The salary is :'||i.salary
									||'The dept is :'||i.department_id);
		END LOOP;
END;
/
==========================================================================
EXPLICIT CURSOR:
---------------
Declaring Cursor:
	CURSOR <cursor_name> IS <select stmt>;
Opening cursor:
	OPEN <cursor_name>;
	LOOP
Fetching Cursor:
	FETCH <cursor_name> INTO <variable list>;
	END LOOP;
Closing Cursor:
	CLOSE <cursor_name>;
==========================================================================
DECLARE
		CURSOR c1 IS SELECT first_name, job_id, salary FROM emp;
		v_name emp.first_name%TYPE; 
		v_job emp.job_id%TYPE;
		v_sal emp.salary%TYPE;
BEGIN
		OPEN c1;
		LOOP
			FETCH c1 INTO v_name, v_job, v_sal;
			EXIT WHEN c1%NOTFOUND;
				IF v_sal > 10000 THEN
					DBMS_OUTPUT.PUT_LINE('The name is :'||v_name
										||'The salary is :'||v_sal
										||'The job is :'||v_job);
				END IF;
		END LOOP;
		CLOSE c1;
END;
/

==========================================================================
DECLARE
		CURSOR c1 IS SELECT first_name, job_id, salary FROM emp;
		v_name emp.first_name%TYPE; 
		v_job emp.job_id%TYPE;
		v_sal emp.salary%TYPE;
BEGIN
	IF  NOT c1%ISOPEN THEN	
		OPEN c1;
		LOOP
			FETCH c1 INTO v_name, v_job, v_sal;
			EXIT WHEN c1%NOTFOUND;
				IF v_sal > 10000 THEN
					DBMS_OUTPUT.PUT_LINE('The name is :'||v_name
										||'The salary is :'||v_sal
										||'The job is :'||v_job);
				END IF;
		END LOOP;
		CLOSE c1;
	END IF;
END;
/
==========================================================================
DECLARE
		CURSOR c1 IS SELECT first_name, job_id, salary FROM emp;
		v_name emp.first_name%TYPE; 
		v_job emp.job_id%TYPE;
		v_sal emp.salary%TYPE;
BEGIN
	IF  NOT c1%ISOPEN THEN	
		OPEN c1;
		LOOP
			FETCH c1 INTO v_name, v_job, v_sal;
			EXIT WHEN c1%NOTFOUND;
				IF v_sal > 10000 THEN
					DBMS_OUTPUT.PUT_LINE('The name is :'||v_name
										||'The salary is :'||v_sal
										||'The job is :'||v_job);
				END IF;
		END LOOP;
				DBMS_OUTPUT.PUT_LINE('The total records processed is :'||c1%ROWCOUNT);
		CLOSE c1;
	END IF;
END;
/
==========================================================================
CURSOR FOR LOOP:
----------------
DECLARE
		CURSOR c1 IS SELECT first_name, job_id, salary FROM emp;
BEGIN
		FOR i IN c1
		LOOP
			DBMS_OUTPUT.PUT_LINE('The name is :'||i.first_name
										||'The salary is :'||i.salary
										||'The job is :'||i.job_id);
		END LOOP;
END;
/
==========================================================================
PARAMETERIZED CURSOR:
---------------------
DECLARE
		CURSOR c1(p_dept NUMBER,p_job VARCHAR2) IS SELECT first_name, job_id, salary 
				FROM emp WHERE department_id = p_dept AND job_id = p_job;
				
		v_name emp.first_name%TYPE; 
		v_job emp.job_id%TYPE;
		v_sal emp.salary%TYPE;
		v_dept NUMBER(4) := 100;
BEGIN
		OPEN c1(v_dept,'FI_MGR');
		LOOP
			FETCH c1 INTO v_name, v_job, v_sal;
			EXIT WHEN c1%NOTFOUND;
				DBMS_OUTPUT.PUT_LINE('The name is :'||v_name
										||'The salary is :'||v_sal
										||'The job is :'||v_job);
			END LOOP;
		CLOSE c1;
END;
/
==========================================================================
DECLARE
		CURSOR c_dept IS SELECT department_id, department_name FROM departments;
		CURSOR c_emp(p_deptid NUMBER) IS SELECT first_name, job_id, salary 
									FROM employees WHERE department_id = p_deptid;
		v_deptid  departments.department_id%TYPE;
		v_dname  departments.department_name%TYPE;
		v_fn employees.first_name%TYPE;
		v_sal employees.salary%TYPE;
		v_job employees.job_id%TYPE;
BEGIN
		OPEN c_dept;
		LOOP
			FETCH c_dept INTO v_deptid, v_dname;
			EXIT WHEN c_dept%NOTFOUND;
				DBMS_OUTPUT.PUT_LINE('The deptid is : '||v_deptid||' Dname is : '||v_dname);
				DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
				
				OPEN c_emp(v_deptid);
				LOOP
					FETCH c_emp INTO v_fn, v_job, v_sal;
					EXIT WHEN c_emp%NOTFOUND;
						DBMS_OUTPUT.PUT_LINE(v_fn||'   '||v_sal||'   '||v_job);
				END LOOP;
				CLOSE c_emp;
					
		END LOOP;
		CLOSE c_dept;
END;
/
==========================================================================
CURSOR ROWTYPE:
--------------
DECLARE
		CURSOR c1 IS SELECT first_name, job_id, salary, 
							salary + NVL(commission_pct,0) total FROM emp
					 WHERE department_id = 30;
		v_c1 c1%ROWTYPE;
BEGIN
		OPEN c1;
		LOOP
			FETCH c1 INTO v_c1;
			EXIT WHEN c1%NOTFOUND;
				DBMS_OUTPUT.PUT_LINE('The name is :'||v_c1.first_name
										||' The salary is :'||v_c1.salary
										||' The job is : '||v_c1.job_id
										||' The total sal is '||v_c1.total);
			END LOOP;
				DBMS_OUTPUT.PUT_LINE('The total records processed is :'||c1%ROWCOUNT);
		CLOSE c1;
END;
/
==========================================================================
SCOPE OF VARIABLES: -- Outer Block variables are GLOBAL to all Inner Blocks.
------------------		But Inner block variables can not be refered by the outer blocks.
<<outer>>
DECLARE
		i NUMBER := 10;
BEGIN
		DBMS_OUTPUT.PUT_LINE('The i value is :'||i);
		<<inner_1>>
		DECLARE
				i NUMBER := 100;
		BEGIN
				DBMS_OUTPUT.PUT_LINE('The OUTER i value is :'||outer.i);
				<<inner_2>>
				DECLARE
						i NUMBER := 200;
				BEGIN
						DBMS_OUTPUT.PUT_LINE('The INNER 1 i value is :'||inner_1.i);
						DBMS_OUTPUT.PUT_LINE('The OUTER i value is :'||outer.i);
				END;
		END;
END;
/
==========================================================================
DECLARE
		TYPE t_ref_cur IS REF CURSOR;
		v_ref_cur 	t_ref_cur;
		v_emp_row 	employees%ROWTYPE;
		v_dept_row 	departments%ROWTYPE;
		v_loc_row  	locations%ROWTYPE;
BEGIN
		OPEN v_ref_cur FOR SELECT * FROM employees;
		LOOP
			FETCH v_ref_cur INTO v_emp_row;
			EXIT WHEN v_ref_cur%NOTFOUND;
				DBMS_OUTPUT.PUT_LINE('The name is :'||v_emp_row.first_name);
		END LOOP;
				DBMS_OUTPUT.PUT_LINE('--------------------------------------');
				
		OPEN v_ref_cur FOR SELECT * FROM departments;
		LOOP
			FETCH v_ref_cur INTO v_dept_row;
			EXIT WHEN v_ref_cur%NOTFOUND;
				DBMS_OUTPUT.PUT_LINE('The name is :'||v_dept_row.department_name);
		END LOOP;
				DBMS_OUTPUT.PUT_LINE('--------------------------------------');
		OPEN v_ref_cur FOR SELECT * FROM locations;
		LOOP
			FETCH v_ref_cur INTO v_loc_row;
			EXIT WHEN v_ref_cur%NOTFOUND;
				DBMS_OUTPUT.PUT_LINE('The name is :'||v_loc_row.city);
		END LOOP;
END;
/
==========================================================================
