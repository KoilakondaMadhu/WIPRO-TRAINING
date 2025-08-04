

1) INNER JOIN 
  
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

===================================================================================================


2) create new table by join 
  
CREATE TABLE empdetails AS
SELECT e.employee_id AS empid, 
       e.first_name AS empname, 
       d.department_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id;



====================================================================================================

SELECT e.First_name,e.last_name,d.department_name,e.department_id ,d.department_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
/


FIRST_NAME           LAST_NAME                 DEPARTMENT_NAME                DEPARTMENT_ID
-------------------- ------------------------- ------------------------------ -------------
DEPARTMENT_ID
-------------
James                Landry                    Shipping                                  50
           50

Matthew              Weiss                     Shipping                                  50
           50

==========================================================================================================
4
  SAME NAEM FOR COL AT SELECT OK BUT AT CREATE TABLE IS NOT OK

✅ Here's a practical example:
✔️ This works:
sql
Copy
Edit
SELECT e.DEPARTMENT_ID, d.DEPARTMENT_ID
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
Because it's just a query, Oracle displays both columns, even though they share the same name.

❌ This fails:
sql
Copy
Edit
CREATE TABLE test AS
SELECT e.DEPARTMENT_ID, d.DEPARTMENT_ID
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

===============================================================================================



join brings only common from both 



=================================


=================================================================================================================
left join bring 
which are from beside from -> complete after join only matched
                      ----------------

=================================================================================================================
RIGHT join bring 
which are from beside from -> only matched after join complete
                      --------------------


===================================================================================================================

FULL OUTTER JOIN ON 
  WILL CREATE TABLE WITH DUPLICATE COLUMNS SO IT WILL THROW A ERRON ON CREATE A TABLE SO USE AS ALISIS ;

CREATE TABLE emp_dept_fulljoin AS
SELECT 
    e.employee_id,
    e.first_name,
    e.department_id AS emp_dept_id,     -- alias to avoid duplication
    d.department_id AS dept_dept_id,    -- alias to avoid duplication
    d.department_name
FROM employees e
FULL OUTER JOIN departments d 
    ON e.department_id = d.department_id;


