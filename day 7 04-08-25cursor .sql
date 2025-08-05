DECLARE 
  v_name VARCHAR2(20);
BEGIN 
  SELECT first_name INTO v_name FROM employees;
  DBMS_OUTPUT.PUT_LINE(v_name);
END;


----------------------------

ERROR at line 1:
ORA-01422: exact fetch returns more than requested number of rows     <<<< used a scalr variable
ORA-06512: at line 4

CURSOR 
a cursor is a pointer to a private sql area



SQL> select first_name, department_id , salary from employees where department_id = 30;

FIRST_NAME           DEPARTMENT_ID     SALARY
-------------------- ------------- ----------
Den                             30      11000
Alexander                       30       3100
Shelli                          30       2900
Sigal                           30       2800
Guy                             30       2600
Karen                           30       2500

6 rows selected.


when we return this the issue 


cursor is is pointed area 




----------------------------------------------------------------------------------------------------------------------------------------------------------------
CURSOR
Definition:
A cursor is a pointer to a private SQL area that stores information about processing a specific SELECT or DML statement.
Types:
Implicit Cursor (SQL Cursor)   CANT CONTROL
  ----------------
An implicit cursor is a session cursor that is constructed and managed by PL/SQL.. PL/SQL opens an implicit cursor every time you run a SELECT or DML statement. You cannot control an implicit cursor, but you can get information from its attributes.
Explicit Cursor
---------------
An explicit cursor is a session cursor that you construct and manage. You must declare and define an explicit cursor, giving it a name and associating it with a query (typically, the query returns multiple rows). Then you can process the query result set

----------------------------------------------------------------------------------------------------------------------------------------------------------------


IMPLICT CURSOR:
---------------- 

BEGIN
  DELETE FROM dept_temp
  WHERE department_id = dept_no;

  IF SQL%FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Delete succeeded for department number ' || dept_no);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No department number ' || dept_no);
  END IF;
END;
/


DECLARE 
    v_deptno NUMBER := 20;
BEGIN 
  DELETE FROM   emp WHERE department_id = v_deptno;
  DBMS_OUTPUT.PUT_LINE('the # of record delete is : ' || SQL%ROWCOUNT);
END;

///////////////////////////////////////////////////////////////////////

TO RESTORE THE DELETED RECORD
INSERT INTO emp
SELECT * FROM emp AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '10' MINUTE)
WHERE department_id = 20;



BEGIN
    FOR i IN (SELECT first_name, salary, department_id FROM emp WHERE salary > 15000) LOOP
        DBMS_OUTPUT.PUT_LINE('The name is : ' || i.first_name);
        DBMS_OUTPUT.PUT_LINE('The salary is : ' || i.salary);
        DBMS_OUTPUT.PUT_LINE('The dept is : ' || i.department_id);
    END LOOP;
END;
/
------------------------------------------------------------------------------------------------------
The name is : Steven
The salary is : 24000
The dept is : 90
The name is : Neena
The salary is : 17000
The dept is : 90
The name is : Lex
The salary is : 17000
The dept is : 90

PL/SQL procedure successfully completed.



======================================================================================================


SYNTAX FOR EXPLICIT CURSOR :
  
DECLARING CURSOR:
CURSOR <cursor_name IS <select stmt>;

Opening CURSOR :
  OPEN <cursor_name>;
  LOOP
    
Fetching Cursor:
  Fetch< cursor_name> INTO <variable list>;
  END LOOP;

Closing CURSOR:
  CLOSE <cursor_name>;

========================================================================

  

INTERVIEW QUESTION
 --> when it i dentify recordes if one its not i dentifies once control and open then only stament will execute
 

DECLARE
  CURSOR c1 IS 
    SELECT first_name, job_id, salary
    FROM emp 
    WHERE department_id = 50;

  v_name emp.first_name%TYPE;
  v_job emp.job_id%TYPE;
  v_sal emp.salary%TYPE;

BEGIN
  OPEN c1; ----------CURSOR OPEN        --> when it i dentify recordes if one its not 
                                        --i dentifies once control and open 
                                        --then only stament will execute

  LOOP------------------------------------------------------------LOOP                                      
    FETCH c1 INTO v_name, v_job, v_sal;
    EXIT WHEN c1%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('The name is: ' || v_name ||
                         ' The salary is: ' || v_sal ||
                         ' The job is: ' || v_job);
  END LOOP;----------------------------------------------------END LOOP
                DBMS_OUTPUT.PUT_LINE('THE total records procedure is :' || c1%ROWCOUNT);

  CLOSE c1;---------CURSOR CLOSE
END;
/

-------------------------------------------------------------------------------------------------

/
The name is: Matthew The salary is: 8000 The job is: ST_MAN
The name is: Adam The salary is: 8200 The job is: ST_MAN
The name is: Payam The salary is: 7900 The job is: ST_MAN
The name is: Shanta The salary is: 6500 The job is: ST_MAN
The name is: Kevin The salary is: 5800 The job is: ST_MAN
The name is: Julia The salary is: 3200 The job is: ST_CLERK
The name is: Irene The salary is: 2700 The job is: ST_CLERK
The name is: James The salary is: 2400 The job is: ST_CLERK
The name is: Steven The salary is: 2200 The job is: ST_CLERK
The name is: Laura The salary is: 3300 The job is: ST_CLERK
The name is: Mozhe The salary is: 2800 The job is: ST_CLERK
The name is: James The salary is: 2500 The job is: ST_CLERK
The name is: TJ The salary is: 2100 The job is: ST_CLERK


 Explicit Cursor Attributes:
Attribute	Description
cursor_name%ISOPEN	Checks if the cursor is currently open.
cursor_name%FOUND	Returns TRUE if the last fetch returned a row.
cursor_name%NOTFOUND	Returns TRUE if the last fetch did not return a row.
cursor_name%ROWCOUNT	Returns the number of rows fetched so far.


IF c1%ISOPEN THEN
  -- Cursor is open
END IF;

IF c1%FOUND THEN
  -- A row was successfully fetched
END IF;

IF c1%NOTFOUND THEN
  -- No row was fetched
END IF;

DBMS_OUTPUT.PUT_LINE('Rows fetched so far: ' || c1%ROWCOUNT);





DECLARE
  CURSOR c1 IS 
    SELECT first_name, job_id, salary FROM emp;

  v_name emp.first_name%TYPE;
  v_job  emp.job_id%TYPE;
  v_sal  emp.salary%TYPE;

BEGIN
  IF NOT c1%ISOPEN THEN
    OPEN c1;
    
    LOOP
      FETCH c1 INTO v_name, v_job, v_sal;
      EXIT WHEN c1%NOTFOUND;

      IF v_sal < 10000 THEN
        DBMS_OUTPUT.PUT_LINE('The name is: ' || v_name ||
                             ' The salary is: ' || v_sal ||
                             ' The job is: ' || v_job);
      END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('The total records processed is: ' || c1%ROWCOUNT);
    CLOSE c1;
  END IF;
END;
/

---------------------------------------------------------------------------------------
The name is: Alexander The salary is: 9000 The job is: IT_PROG
The name is: Bruce The salary is: 6000 The job is: IT_PROG
The name is: David The salary is: 4800 The job is: IT_PROG
The name is: Valli The salary is: 4800 The job is: IT_PROG
The name is: Diana The salary is: 4200 The job is: IT_PROG
The name is: Daniel The salary is: 9000 The job is: FI_ACCOUNT
The name is: John The salary is: 8200 The job is: FI_ACCOUNT
The name is: Ismael The salary is: 7700 The job is: FI_ACCOUNT
The name is: Jose Manuel The salary is: 7800 The job is: FI_ACCOUNT
The name is: Luis The salary is: 6900 The job is: FI_ACCOUNT
The name is: Alexander The salary is: 3100 The job is: PU_CLERK
The name is: Shelli The salary is: 2900 The job is: PU_CLERK
The name is: Sigal The salary is: 2800 The job is: PU_CLERK
The name is: Guy The salary is: 2600 The job is: PU_CLERK
The name is: Karen The salary is: 2500 The job is: PU_CLERK
The name is: Matthew The salary is:






DECLARE
  CURSOR c1 IS 
    SELECT last_name 
    FROM employees 
    WHERE ROWNUM < 11
    ORDER BY last_name;

  name employees.last_name%TYPE;

BEGIN
  OPEN c1;

  LOOP
    FETCH c1 INTO name;
    EXIT WHEN c1%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(c1%ROWCOUNT || ' ' || name);

    IF c1%ROWCOUNT = 5 THEN
      DBMS_OUTPUT.PUT_LINE('--- Fetched 5th row ---');
    END IF;
  END LOOP;

  CLOSE c1;
END;
/




🔍 Explanation of Cursor Attributes Used:
Attribute	Usage in Code	Meaning
c1%NOTFOUND	EXIT WHEN c1%NOTFOUND;	Stops the loop when no more rows
c1%ROWCOUNT	Used to print the row number and detect 5th row	Tracks how many rows have been fetched






DECLARE
  CURSOR c1 IS 
    SELECT last_name 
    FROM employees 
    WHERE ROWNUM < 11
    ORDER BY last_name;

  name employees.last_name%TYPE;
  v_b_count NUMBER := 0; -- Counter for names starting with 'B'

BEGIN
  OPEN c1;

  LOOP
    FETCH c1 INTO name;
    EXIT WHEN c1%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(c1%ROWCOUNT || '. ' || name);

    IF c1%ROWCOUNT = 5 THEN
      DBMS_OUTPUT.PUT_LINE('--- Fetched 5th row ---');
    END IF;

    IF name LIKE 'B%' THEN
      v_b_count := v_b_count + 1;
    END IF;

  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total names starting with B: ' || v_b_count);

  CLOSE c1;
END;
/

----------------------------------------------------------
Abel
2. Ande
3. Atkinson
4. Austin
5. Baer
--- Fetched 5th row ---
6. Baida
7. Banda
8. Bates
9. Bell
10. Bernstein
Total names starting with B: 6

PL/SQL procedure successfully completed.
------------------------------------------------------------------------------------------------
EXPLICT CURSOR - Explict Cursor FOR Loop Statement

  DECLARE
  CURSOR c1 IS 
    SELECT last_name, job_id 
    FROM employees
    WHERE job_id LIKE '%CLERK%' 
      AND manager_id > 120
    ORDER BY last_name;
BEGIN
  FOR item IN c1 LOOP
    DBMS_OUTPUT.PUT_LINE('Name = ' || item.last_name || 
                         ', Job = ' || item.job_id);
  END LOOP;
END;
/

------------------------------------------------------------------------------------------------------

Name = Atkinson, Job = ST_CLERK
Name = Bell, Job = SH_CLERK
Name = Bissot, Job = ST_CLERK
Name = Bull, Job = SH_CLERK
Name = Cabrio, Job = SH_CLERK
Name = Chung, Job = SH_CLERK
Name = Davies, Job = ST_CLERK
Name = Dellinger, Job = SH_CLERK
Name = Dilly, Job = SH_CLERK
Name = Everett, Job = SH_CLERK
Name = Feeney, Job = SH_CLERK
Name = Gates, Job = SH_CLERK
Name = Gee, Job = ST_CLERK
Name = Grant, Job = S

---------------------------------------------------------------------------------
--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< explicit cursor with a FOR loop
  

DECLARE
  CURSOR c1 IS 
    SELECT first_name, job_id, salary  FROM emp;

BEGIN
  FOR i IN c1 LOOP
    DBMS_OUTPUT.PUT_LINE(
                          'The name is :' || i.first_name ||
                           ' The salary is :' || i.salary ||
                            ' The job is :' || i.job_id
                         );
  END LOOP;
END;
/

=======================================================================================================

--   explicit cursor - subquery in the FROM clause of PARENT QUERY (also known as an inline view). 
  ===================================================================================

DECLARE
  CURSOR c1 IS 
    SELECT t1.department_id, department_name, staff
    FROM departments t1,
         ( SELECT department_id, COUNT(*) AS staff
           FROM employees
           GROUP BY department_id
         ) t2
    WHERE t1.department_id = t2.department_id 
      AND staff >= 5
    ORDER BY staff;

BEGIN
  FOR dept IN c1 LOOP
    DBMS_OUTPUT.PUT_LINE(
      'Department = ' || dept.department_name || 
      ', staff = ' || dept.staff);
  END LOOP;
END;
/


----------------------------------------------------------------------------------------------

Department = IT, staff = 5
Department = Finance, staff = 6
Department = Purchasing, staff = 6
Department = Sales, staff = 34
Department = Shipping, staff = 45

==============================================================================================================

why we need parameterized cursor  becuse we need to reuse what ever parameter we use it should give value
  =======================================================================================================
  

DECLARE
   CURSOR c1 IS 
      SELECT first_name, job_id, salary 
      FROM emp 
      WHERE department_id = 30;

   v_name emp.first_name%TYPE;
   v_job  emp.job_id%TYPE;
   v_sal  emp.salary%TYPE;
BEGIN
   OPEN c1;
   LOOP
      FETCH c1 INTO v_name, v_job, v_sal;
      EXIT WHEN c1%NOTFOUND;

      IF v_sal > 10000 THEN
         DBMS_OUTPUT.PUT_LINE('The name is : ' || v_name ||
                              ' | The salary is : ' || v_sal ||
                              ' | The job is : ' || v_job);
      END IF;
   END LOOP;
   CLOSE c1;
END;
/
----------------------------------------------------------------------------------------

The name is : Den | The salary is : 11000 | The job is : PU_MAN





DECLARE
     CURSOR c1(p_dept NUMBER) IS            -- <<<<<<<<<parameterr is used
        SELECT first_name, job_id, salary 
        FROM emp 
        WHERE department_id = p_dept;

     v_name emp.first_name%TYPE;
     v_job  emp.job_id%TYPE;
     v_sal  emp.salary%TYPE;
BEGIN
   -- Open the cursor with a specific department id, for example 30
     OPEN c1(v_dept);
     LOOP
        FETCH c1 INTO v_name, v_job, v_sal;
        EXIT WHEN c1%NOTFOUND;

   
           DBMS_OUTPUT.PUT_LINE('The name is : ' || v_name ||
                                ' | The salary is : ' || v_sal ||
                                ' | The job is : ' || v_job);

      
     END LOOP;
     CLOSE c1;
END;
/


DECLARE
   CURSOR c1(p_dept NUMBER) IS           -- <<<<<<<<<parameterr is used
      SELECT first_name, job_id, salary 
      FROM emp 
      WHERE department_id = p_dept;

   v_name emp.first_name%TYPE;
   v_job  emp.job_id%TYPE;
   v_sal  emp.salary%TYPE;
   v_dept NUMBER := 30;  -- Set department ID here
BEGIN
   OPEN c1(v_dept);
   LOOP
      FETCH c1 INTO v_name, v_job, v_sal;
      EXIT WHEN c1%NOTFOUND;

      IF v_sal > 10000 THEN
         DBMS_OUTPUT.PUT_LINE('The name is : ' || v_name ||
                              ' | The salary is : ' || v_sal ||
                              ' | The job is : ' || v_job);
      END IF;
   END LOOP;
   CLOSE c1;
END;
/


DECLARE
  CURSOR c1(p_dept NUMBER, p_job VARCHAR2) IS 
    SELECT first_name, job_id, salary 
    FROM emp
    WHERE department_id = p_dept AND job_id = p_job;

  v_name emp.first_name%TYPE;
  v_job emp.job_id%TYPE;
  v_sal emp.salary%TYPE;
  v_dept NUMBER(4) := 100;

BEGIN
  OPEN c1(v_dept, 'FI_MGR');
  LOOP
    FETCH c1 INTO v_name, v_job, v_sal;
    EXIT WHEN c1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('The name is: ' || v_name || 
                         ' The salary is: ' || v_sal || 
                         ' The job is: ' || v_job);
  END LOOP;
  CLOSE c1;
END;
/

--------------------------------------------------------------------------------------------------

The name is: Nancy The salary is: 12008 The job is: FI_MGR

PL/SQL procedure successfully completed.



====================================================================================================
10 Accounting

first_name, salary,



  DECLARE
  CURSOR c_dept IS 
    SELECT department_id, department_name FROM departments;

  CURSOR c_emp IS 
    SELECT first_name, job_id, salary FROM employees;

  v_deptid departments.department_id%TYPE;
  v_dname departments.department_name%TYPE;

  v_fn employees.first_name%TYPE;
  v_sal employees.salary%TYPE;
  v_job employees.job_id%TYPE;
BEGIN
  OPEN c_dept;
  LOOP
    FETCH c_dept INTO v_deptid, v_dname;
    EXIT WHEN c_dept%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('The deptid is : ' || v_deptid || ' Dname is : ' || v_dname || '_______________________');
  END LOOP;
  CLOSE c_dept;
END;
/




  ===================================================================================================
  

DECLARE
  CURSOR c_dept IS 
    SELECT department_id, department_name FROM departments;

  CURSOR c_emp IS 
    SELECT first_name, job_id, salary FROM employees;

  v_deptid departments.department_id%TYPE;
  v_dname departments.department_name%TYPE;
  v_fn employees.first_name%TYPE;
  v_sal employees.salary%TYPE;
  v_job employees.job_id%TYPE;
BEGIN
  OPEN c_dept;
  LOOP
    FETCH c_dept INTO v_deptid, v_dname;
    EXIT WHEN c_dept%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('The deptid is : ' || v_deptid || ' Dname is : ' || v_dname ||);
       DBMS_OUTPUT.PUT_LINE( '______________________________________________________________');

    open c_emp;
    LOOP 
        fetch c_emp INTO v_fn,v_sal,v_job;
        EXIT WHEN c_emp NOTFOUND;
        
  END LOOP;
  CLOSE c_dept;
END;
/
















































