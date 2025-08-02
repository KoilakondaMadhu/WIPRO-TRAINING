1) Write SQL Query to Display FIRST_NAME with Alias EMPLOYEE_NAME.


SQL> select FIRST_NAME employee_name from employees;
or 
 
SQL> select FIRST_NAME as employee_name from employees;

EMPLOYEE_NAME
--------------------
Ellen
Sundar
Mozhe
David
Hermann
Shelli
=========================================================================================================================================================================================================================

2)Write SQL Query to Display FIRST_NAME in Upper Case from the Employees Table.

 
SQL> select upper(FIRST_NAME) employee_name from employees;

EMPLOYEE_NAME
--------------------
ELLEN
SUNDAR
MOZHE
DAVID
HERMANN
SHELLI
AMIT
ELIZABETH
SARAH
DAVID
==========================================================================================================================================================================================

 
3)Write SQL Query to Display Unique DEPARTMENT Values from the Employees Table.

 
SQL> select unique department_id from employees;

DEPARTMENT_ID
-------------
          100
           30

           90
           20
           70
          110
           50
           80
           40
           60
           10
 ==========================================================================================================================================================================================

 4)Write SQL Query to Display the First 3 Chars of FIRST_NAME from the Employees Table.  -->> use of substring

 SQL> select substr(first_name, 1, 3) from employees;     --SUBSTR

SUBSTR(FIRST
------------
Ell
Sun
Moz
Dav
Her
She
Ami
Eli
==========================================================================================================================================================================================

5)Write SQL Query to Find the Position of Alphabet ‘a’ in the FIRST_NAME Column.

 SQL> SELECT INSTR(FIRST_NAME, 'a') FROM EMPLOYEES;   -->>>>>>>>> A  a BOTH ARE DIFFERENT

INSTR(FIRST_NAME,'A')
---------------------
                    0
                    5
                    0
                    2
                    5
                    0
                    0
                    5
                    2
                    2

==========================================================================================================================================================================================

 
 
6)Write SQL Query to Fetch FIRST_NAME from the Employees Table With No White Spaces on the Right.
 SELECT RTRIM(FIRST_NAME) FROM EMPLOYEES;



SQL> SELECT RTRIM(FIRST_NAME) FROM EMPLOYEES;

RTRIM(FIRST_NAME)
--------------------
Ellen
Sundar
Mozhe
David
Hermann
Shelli
Amit
Elizabeth
Sarah
David
===============================================================================================
 
7)Write SQL Query to List DEPARTMENT from the Employees Table With No White Spaces on the Left.


 
SQL> SELECT LTRIM(FIRST_NAME) FROM EMPLOYEES;

RTRIM(FIRST_NAME)
--------------------
Ellen
Sundar
Mozhe
David
Hermann
Shelli
Amit
Elizabeth
Sarah
David

 
8)Write SQL Query to Display Unique DEPARTMENT Values and Their Lengths from the Employees Table.
 
SQL> SELECT LTRIM(DEPARTMENT_id) FROM EMPLOYEES;

LTRIM(DEPARTMENT_ID)
----------------------------------------
90
90
90
60
60
60
60
60
100
100
100
100
100


========================================================================================================================================
 
9)Write SQL Query to Replace ‘a’ with ‘A’ in FIRST_NAME from the Employees Table.

 
SQL> select REPLACE(first_name, 'a', 'A') from employees;

--------------------
Ellen
SundAr
Mozhe
DAvid
HermAnn
Shelli
Amit
ElizAbeth

 but col name is changing so 


SQL>     SELECT
  2        REPLACE(FIRST_NAME, 'a', 'A') AS FIRST_NAME
  3     FROM
  4      EMPLOYEES
  5  /

FIRST_NAME
--------------------
Ellen
SundAr
Mozhe
DAvid
Anthony
GerAld
NAnette
===================================================================================================
10)Write SQL Query to Combine FIRST_NAME and LAST_NAME into COMPLETE_NAME.

 In Oracle SQL, the double pipe operator (||) serves as the concatenation

 
SQL> select First_name || ' '|| Last_name  completename from Employees;

COMPLETENAME
----------------------------------------------
Ellen Abel
Sundar Ande
Mozhe Atkinson
David Austin
Hermann Baer
Shelli Baida
Amit Banda
Elizabeth Bates
==================================================================================================================================
 
 
 
11)Write SQL Query to Print Employees Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending.
 
SQL> SELECT * FROM EMPLOYEES ORDER BY FIRST_NAME ASC, DEPARTMENT_id DESC;

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                  PHONE_NUMBER         HIRE_DATE JOB_ID     SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        121 Adam                 Fripp                     AFRIPP                 650.123.2234         10-APR-05 ST_MAN       8200                        100            50
        196 Alana                Walsh                     AWALSH                 650.507.9811         24-APR-06 SH_CLERK     3100                        124            50
        147 Alberto              Errazuriz                 AERRAZUR               011.44.1344.429278   10-MAR-05 SA_MAN      12000              .3        100            80
        103 Alexander            Hunold                    AHUNOLD                590.423.4567         03-JAN-06 IT_PROG      9000                        102            60

 ==========================================================================================================================================================================================
 
12)Write SQL Query to Print Employees Details with First Names “Valli” and “Karen”.

 SQL> SELECT * FROM EMPLOYEES WHERE FIRST_NAME IN ('Valli', 'Karen');

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        106 Valli                Pataballa                 VPATABAL                  590.423.4560         05-FEB-06 IT_PROG          4800               103             60
        119 Karen                Colmenares                KCOLMENA                  515.127.4566         10-AUG-07 PU_CLERK         2500               114             30
        146 Karen                Partners                  KPARTNER                  011.44.1344.467268   05-JAN-05 SA_MAN          13500             .3100             80

====================================================================================================================================================================================================
 
 
13)Write SQL Query to Print Employees Details Excluding First Names “Valli” and “Karen”.

 
SQL> SELECT * FROM EMPLOYEES WHERE FIRST_NAME NOT IN ('Valli', 'Karen');

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER    HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        100 Steven               King                      SKING                     515.123.4567    17-JUN-03 AD_PRES         24000                                      90
        101 Neena                Kochhar                   NKOCHHAR                  515.123.4568    21-SEP-05 AD_VP           17000                       100            90
        102 Lex                  De Haan                   LDEHAAN                   515.123.4569    13-JAN-01 AD_VP           17000                       100            90
 ============================================================================================================================================================================================
 
14)Write SQL Query to Print Employees Details with DEPARTMENT Name as “Admin”.

 SQL> SELECT e.*
  2  FROM employees e
  3  JOIN departments d
  4    ON e.department_id = d.department_id
  5  WHERE d.department_name = 'Administration';

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER    HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        200 Jennifer             Whalen                    JWHALEN                   515.123.4444    17-SEP-03 AD_ASST          4400                       101            10

SQL>










 
15)Write SQL Query to Print Employees Details Whose FIRST_NAME Contains ‘a’.


 DESC
Write SQL Query to List Employees Info Whose FIRST_NAME Ends with ‘r’.
Write SQL Query to Fetch Employeess Whose FIRST_NAME Ends with ‘h’ and Has 6 Letters.
Write SQL Query to Show Employees Info Whose SALARY is Between 10000 & 20000.
Write SQL Query to Display Employeess Who Joined in 07-MAR-06
Write SQL Query to Print Employee Count in ‘Admin’ Department.
Write SQL Query to Fetch Employees Names with Salaries >= 5000 and <= 10000.
Write SQL Query to List Employees Count Per Department in Descending Order.
Write SQL Query to Clone a New Table from Another Table.
Write SQL Query to Display Intersecting Records of Two Tables.
Write SQL Query to Show Records from One Table That Are Not Present in Another Table.
Write SQL Query to Show the Current Date and Time.
Write SQL Query to Fetch Departments with Less than Five People in Them.
Write SQL Query to Show All Departments with the Number of People in There.
Write SQL Query to Fetch Departments and Their Total Salaries.
---------------------------------------------------------------------
Which code snippet will alter the table LOCATIONS and change the datatype of the column CITY to varchar2(30)?

A - ALTER TABLE locations MODIFY COLUMN (city varchar2(30));
B - MODIFY TABLE locations ADD (city varchar2(30));
C - ALTER TABLE locations MODIFY (city varchar2(30));
D - None of the above.
---------------------------------------------------------------------
Which of the following is true about Cartesian Products?

A - A Cartesian product is formed when a join condition is omitted.
B - A Cartesian product is formed when a join condition is valid.
C - Some rows in the first table are joined to all rows in the second table.
D - All rows in the first table are joined to some rows in the second table.
---------------------------------------------------------------------
Which code snippet will alter the table LOCATIONS and add a column named Address, with datatype VARCHAR2(100)?

A - ALTER TABLE locations ADD (address varchar2(100));
B - ALTER TABLE locations ADD COLUMN(address varchar2(100));
C - MODIFY TABLE locations ADD COLUMN (address varchar2(100));
D - None of the above.
---------------------------------------------------------------------
Q - Which of the following is true about database indexes?

A - You can create an index on one or more columns.
B - Indexes always slow down the speed of query process.
C - Indexes are always created automatically.
D - Indexes should ideally be created on small tables.
---------------------------------------------------------------------
Q - Which of the following is not true about a sequence?

A - They are used for generating sequential numbers.
B - Sequences are created by the CREATE SEQUENCE statement.
C - You cannot modify a sequence.
D - None of the above.
---------------------------------------------------------------------
 - Which of the following functions can be used on both numeric as well as non-numeric data?

A - COUNT
B - AVG
C - STDDEV
D - VARIANCE
---------------------------------------------------------------------
Q - Consider the following schema −

LOCATIONS(subject_code, department_name, location_id, city);

Which code snippet will alter the table LOCATIONS and delete the column named CITY?

A - MODIFY TABLE locations DROP (city varchar2(30));
B - ALTER TABLE locations DROP COLUMN city;
C - ALTER TABLE locations DROP (city);
D - None of the above.
---------------------------------------------------------------------
Q - Which of the following code will create an index named stu_marks_ind on the columns student_code and percentage_of_marks of the STUDENTS table?

A - Itâ€™s not possible to create an index on two columns.
B - create index stu_marks_ind from students(student_code, percentage_of_marks);
C - create index stu_marks_ind on students(student_code, percentage_of_marks);
D - create index stu_marks_ind (student_code, percentage_of_marks) on students;
---------------------------------------------------------------------
Q - Which of the following code will successfully delete the table LOCATIONS from the database?

A - DROP TABLE locations;
B - DELETE TABLE locations;
C - TRUNCATE TABLE locations;
D - None of the above.
---------------------------------------------------------------------
Q - Which of the following is not a group function?

A - SUM
B - NVL
C - COUNT
D - MIN
---------------------------------------------------------------------
Q - What is returned by ROUND(789.8389, 2)?

A - 789.84
B - 789.83
C - 78
D - 789.00
---------------------------------------------------------------------
What is the purpose of the SQL keyword “DISTINCT” in a SELECT statement?
a) To retrieve unique values from a column
b) To filter NULL values
c) To delete duplicate records
d) To sort the result set
---------------------------------------------------------------------
 Which statement(s) are mandatory in a simple SQL SELECT statement?
a) Select, From
b) Select, OrderBy
c) Select, Where
d) Select, GroupBy
---------------------------------------------------------------------
Which of the following is a default join type?
a) Right join
b) Left join
c) Inner join
d) Outer join
---------------------------------------------------------------------
Which SQL keyword is used to sort the data returned by a SELECT statement?
a) Group
b) Order
c) Group By
d) Order By
---------------------------------------------------------------------
The SQL LIKE operator is used in which of the following clause?
a) Having
b) Select
c) Where
d) Group by

