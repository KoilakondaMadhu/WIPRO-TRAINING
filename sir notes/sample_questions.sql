Write SQL Query to Display FIRST_NAME with Alias EMPLOYEE_NAME.
Write SQL Query to Display FIRST_NAME in Upper Case from the Employees Table.
Write SQL Query to Display Unique DEPARTMENT Values from the Employees Table.
Write SQL Query to Display the First 3 Chars of FIRST_NAME from the Employees Table.
Write SQL Query to Find the Position of Alphabet ‘a’ in the FIRST_NAME Column.
Write SQL Query to Fetch FIRST_NAME from the Employees Table With No White Spaces on the Right.
Write SQL Query to List DEPARTMENT from the Employees Table With No White Spaces on the Left.
Write SQL Query to Display Unique DEPARTMENT Values and Their Lengths from the Employees Table.
Write SQL Query to Replace ‘a’ with ‘A’ in FIRST_NAME from the Employees Table.
Write SQL Query to Combine FIRST_NAME and LAST_NAME into COMPLETE_NAME.
Write SQL Query to Print Employees Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending.
Write SQL Query to Print Employees Details with First Names “Valli” and “Karen”.
Write SQL Query to Print Employees Details Excluding First Names “Valli” and “Karen”.
Write SQL Query to Print Employees Details with DEPARTMENT Name as “Admin”.
Write SQL Query to Print Employees Details Whose FIRST_NAME Contains ‘a’.
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







CREATE OR REPLACE PROCEDURE p5 IS

	i NUMBER;

BEGIN

	SELECT salary INTO i FROM employees WHERE employee_id = 101;

	IF i > 15000 THEN

		RETURN;

	ELSE

		DBMS_OUTPUT.PUT_LINE('Salary is  than 15K');

	END IF;

END;

/
 
sample questions for MCQ
 
2. SELECT salary INTO v_sal FROM EMPLOYEES; This statement raises the exception____________

	a) NO_DATA_FOUND

	b) TOO_MANY_ROWS

	c) VALUE_ERROR

	d) No Exception is raised
 
3. Which of the following is true regarding PL/SQL block
 
	a) Declarative & Executable parts are optional

	b) Executable & Exception parts are optional

	c) Declarative & Exception parts are optional

	d) All are above
 
4. %ROWTYPE is an example of ______________ data type
 
	a) Scalar 

	b) Composite/Record

	c) LOB 

	d) Ref
 
5. PL/SQL does not support ____________ and ___________ statements
 
	a) DDL, DML

	b) DDL, DCL

	c) DML, DCL

	d) None of the above
 
6. 	<<outerblock>>

		DECLARE

			v_sal NUMBER := 100;

		BEGIN

			v_sal := 150;
<<innerblock>>

					DECLARE

						v_sal NUMBER := 250;

					BEGIN

						outerblock.v_sal := 500;

						v_sal := 500;

						DBMS_OUTPUT.PUT_LINE('The value of v_sal = '||v_sal);

					END innerblock;

			DBMS_OUTPUT.PUT_LINE('The value of v_sal = '||v_sal);

		END outerblock;

	What is the out put of the above code?

		a) 100, 250

		b) 150, 250

		c) 500, 500

		d) 500, 150
 
7.	Which of the followings returns True if the cursor processes the records further?

		a) %ROWCOUNT

		b) %NOTFOUND

		c) %FOUND

		d) %ISOPEN
 
8. 	FOR i IN 5..10 LOOP
<statements>

	END LOOP;

	In the above code, how many time the statement will be execute?

		a) 1

		b) 6

		c) 10

		d) 15
 
9. 	What is the sequence of steps to use the user defined exception?
 
		a) Raise, Declare, Handle

		b) Declare, Handle, Raise

		c) Declare, Raise, Handle

		d) Handle, Raise, Declare
 

