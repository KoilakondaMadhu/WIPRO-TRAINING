28-07-2025
1 CLASS

===============

OBJECT RELATIONAL DATABASE MANAGEMENT SYSTEM (ORDBMS)

What is Data?
-------------
~ is piece of meaningfull information about sb/sth

Raja is a Manager working in Wipro with 50K salary.
				
What is Record?
---------------
group of related data arranged in Row

What is column?
---------------
which is having same kind of data vertically

What is table?
--------------
Rows and columns

What is Database?
----------------
Group of related tables.

=====================================================================================
1. SQL 			Structured Query Language
2. PL/SQL		Procedural Language / Structured Query Language
=====================================================================================
CREATING TABLE:
===============
1. Create a NEW table:
----------------------
	CREATE TABLE <table_name> 
	( <col_name> DATA_TYPE[(width)], ...);
	
	CREATE TABLE student 
	( sid NUMBER(4), sname VARCHAR2(30), mark NUMBER(3), rank NUMBER(2) );

To see the structure of the table:
----------------------------------
DESC [RIBE] <table_name>

DESCRIBE student
DESC student

To see all the tables:
--------------------------
SELECT * FROM tab; (table)

2. To create a table from already existing one:
-----------------------------------------------
CREATE TABLE <new_tab_name> AS
SELECT * FROM <old_tab_name>;

CREATE TABLE emp AS
SELECT * FROM employees;

3. To create a table WITH FEW COLUMNS from already existing one:
----------------------------------------------------------------
CREATE TABLE <new_tab_name> AS
SELECT col1,col2,... FROM <old_tab_name>;

CREATE TABLE emp_1 AS
SELECT employee_id, first_name, email, job_id FROM employees;

4. To create a table WITH NEW COLUMNS NAMES from already existing one:
---------------------------------------------------------------------
CREATE TABLE <new_tab_name>(new_col_name1, new_col_name2,...) AS
SELECT col1,col2,... FROM <old_tab_name>;

CREATE TABLE emp_2 (empid,name,email,job) AS
SELECT employee_id, first_name, email, job_id FROM employees;
===============================================================================
MODIFYING TABLE:
===============
1. add column
2. drop column
3. rename column
4. change data type of a column

1. To Add new column to a table:
-----------------------------
ALTER TABLE <tab_name> 
ADD (col_name data_type [(width)], ...);

ALTER TABLE student
ADD (dob DATE, course VARCHAR2(5));

2. To rename a column in a table:
--------------------------------
ALTER TABLE <table_name>
RENAME COLUMN <old_column_name> TO <new_col_name>;

ALTER TABLE student
RENAME COLUMN dob TO date_of_birth;

3. To drop column from a table:
--------------------------------
ALTER TABLE <table_name>
DROP COLUMN <column_name>;				-- To drop single column

ALTER TABLE <table_name>
DROP (col_name1, col_name2,...);		-- To drop multiple columns

ALTER TABLE student
DROP COLUMN rank;

ALTER TABLE student
DROP (course, sname);

4. To change the datatype of a column :
---------------------------------------
ALTER TABLE <table_name>
MODIFY (col_name new_data_type[(width)], ...);

ALTER TABLE student
MODIFY (mark varchar2(3));

Restrictions on Table and Column Names:
----------------------------------------
1. names can be upto 30 chars
2. should start with character followed by alphanumeric
3. a table can have max 1000 columns
4. no space is allowed
5. if you need space then enclose the names in double quots
6. table name should be unique in a schema
7. column name should be unique in the table.
------------------------------------------------------------------
TO Drop a Table:
----------------
DROP TABLE <table_name>;
DROP TABLE student;
------------------------------------------------------------------
What is Data Dictionary?
------------------------
it is system tables - data of data.

select * from user_tables;			--To view tables
select * from user_tab_columns;		--To view columns in tables
==================================================================
SELECT STATEMENT: - To retrive(view) the data from a table.
-----------------
1. To select all rows and columns:
----------------------------------
SELECT * FROM <table_name>;
SELECT * FROM emp;

2. To select specific columns:
----------------------------------
SELECT col_name1, col_name2, ... FROM <table_name>;
SELECT first_name, email,salary FROM emp;

3. To Assign Alias name:
----------------------------------
SELECT col_name1 [AS] <alias_name>, col_name2 [AS] <alias_name>,... FROM <table_name>;

SELECT first_name AS name, email,salary compensation FROM emp;
SELECT first_name  "name", email,salary "Sal Comp" FROM emp; 
==================================================================
INSERT STATEMENT: -- To add NEW record/row into a table
-----------------
1. To insert into a new table for ALL columns:
----------------------------------------------
INSERT INTO <table_name> VALUES (val_1,val_2,...);
INSERT INTO student VALUES (1,'RAJA',90,1);

2. To insert multiple rows at a time:
-------------------------------------
INSERT INTO student VALUES (&sid, &name,&mark,&rank);
/
3 To insert into specific columns:
-----------------------------------
INSERT INTO <table_name> (col_name1,col_name2,...) VALUES (val_1,val_2,...);
INSERT INTO student (sid, mark) VALUES (6,89);

4 To insert into another table for all columns:
-----------------------------------------------
INSERT INTO <dest_tab_name> SELECT * FROM <source_tab_name>;
INSERT INTO emp SELECT * FROM employees;

4 To insert into another table for specific columns:
-----------------------------------------------
INSERT INTO <dest_tab_name>(col_name1,col_name2,...) 
SELECT col_name1,col_name2,... FROM <source_tab_name>;

INSERT INTO emp (first_name, salary)
SELECT first_name, salary FROM employees;
===================================================================
UPDATE STATEMENT: -- To modify/change the values of ALREADY EXISTING records.
-----------------
UPDATE <table_name>
SET col_name = <value>, col_name = <value>,...
[WHERE <condition>];

UPDATE student
SET sname = 'VIJAY', rank = 2
WHERE sid = 6;

UPDATE student
SET  rank = 3
WHERE mark = 89;
===================================================================
DELETE STATEMENT: -- To remove few / all records from a table
----------------
DELETE FROM <table_name>
[WHERE <condition>];

DELETE FROM student;		-- Deletes all records

DELETE FROM student
WHERE mark = 89;
==================================================================
WHERE CLAUSE: -- To filter the records
-------------
WHERE <condition>

SELECT * FROM employees 
WHERE employee_id = 101;

SELECT * FROM employees 
WHERE salary > 14000;
==================================================================
TRUNCATE STATEMENT: -- To REMOVE ALL records/Rows from a table
-------------------
TRUNCATE TABLE <table_name>;
TRUNCATE TABLE student;

		DELETE									TRUNCATE
		------									--------
1. Specific rows can be deleted			Can not specific rows. Can delete only all Rows
2. slower than Truncate 				Faster than delete
3. can be rolledback					cant rollback
==================================================================
COMMIT: --To save the changes permenently into the HDD/DB
-------
commit;

ROLLBACK: -- To undo the changes upto the last commit
---------
rollback;

commit;
insert ......
commit;  ---stops here.
insert .....
update .....
delete .....
select .....
update .....
rollback;

ROLLBACK TO SAVEPOINT -- To partially rollback
----------------------
insert ....
commit;
insert ....
save point a;
insert ....
update ....
save point c;
delete ....
save point b;
update ....

rollback to savepoint b;



====================================================================================

SQL OVER VIEW PDF      READ THE PPT AND WRITE ALL THE CODES 





  

==========================
 DAY 2   29-07-25
  ----------------

----<<<see in comments pdf>
COMMENTS    
---------
Definition:


Use the COMMENT statement to add to the data dictionary a comment about a table or table column

To drop a comment from the database, set it to the empty string ' '>.

Syntax:
	COMMENT ON TABLE  [<schema>. ] <table_name | view_name> IS <string>;

	COMMENT ON COLUMN [<schema>. ] <table_name | view_name>.<col_name>
	IS <string>;

----------------------------------------------------------------------------------------------------------

Create COMMENTS Example:


	COMMENT ON TABLE  hr.student IS 'This is Student Information Table’;

	 COMMENT ON COLUMN hr.student.student_id
     			IS 'This column stores the Student ID’;

Drop COMMENTS Example:

	 COMMENT ON TABLE  hr.student IS ‘ ‘;
	 COMMENT ON COLUMN hr.student.student_id IS ‘ ‘;


---------------------------------------------------------
COMMENTS – Data Dictionary Views


USER_COL_COMMENTS
USER_TAB_COMMENTS

ALL_COL_COMMENTS
ALL_TAB_COMMENTS

DBA_COL_COMMENTS
DBA_TAB_COMMENTS


===========================================================================================

COMMIT_ROLLBACK_SAVEPOINT.PPT
  
Transaction Control Statements
----------------------------------
COMMIT
ROLLBACK
SAVE POINT



COMMIT
------
Purpose

Use the COMMIT statement to end your current transaction and make permanent all changes performed in the transaction. 

A transaction is a sequence of SQL statements that Oracle Database treats as a single unit

Syntax : 

	 COMMIT [WORK]

------------------------------------------------------------------------------------------------
  
ROLLBACK
---------
Purpose

Use the ROLLBACK statement to undo work done in the current transaction . 

Syntax

	 ROLLBACK [WORK] [ TO SAVE POINT <savepoint_name> ]

Example 

	ROLLBACK; 
	ROLLBACK TO SAVEPOINT banda_sal; 
---------------------------------------------------------------------------------------------------

SAVEPOINT
---------

Purpose

Use the SAVEPOINT statement to create a name for a system change number (SCN), to which you can later roll back.

Syntax
		SAVEPOINT <savepoint_name>;
	
Example 

	ROLLBACK; 
	ROLLBACK TO SAVEPOINT banda_sal; 
--------------------------------------------------------------------------------------------------------------------------

SAVEPOINT Example
--------------------
UPDATE employees  SET salary = 7000 
    WHERE last_name = 'Banda’;

SAVEPOINT banda_sal;

UPDATE employees  SET salary = 12000 
    WHERE last_name = 'Greene’;

SAVEPOINT greene_sal;

SELECT SUM(salary) FROM employees;

ROLLBACK TO SAVEPOINT banda_sal;
 
UPDATE employees  SET salary = 11000 
    WHERE last_name = 'Greene';
 
COMMIT; 
-----------------------------------------------------------------------------------------
FORMAT MODELS .DOC DATA
FORMAT MODELS 
-------------


=============================================================================================================================

MERGE INTO  


MERGE INTO <target_table> alias
USING <source_table> alias ON (<condition>)
WHEN MATCHED THEN UPDATE SET col=val,...
WHEN NOT MATCHED THEN INSERT (col_list) VALUES (val_list);


MERGE INTO dest d 
USING source s  ON (s.id = d.id)
WHEN MATCHED THEN UPDATE SET d.name = s.name, d.mark = s.mark
WHEN NOT MATCHED THEN INSERT (d.id,d.name,d.mark) VALUES (s.id,s.name,s.mark);
===============================================================================================================================



OPERATORS
---------


An operator manipulates data items and returns a result. Syntactically, an operator appears before or after an operand or between two operands.

The two general classes of operators are:

unary: A unary operator operates on only one operand. A unary operator typically appears with its operand in this format:

	operator operand

binary: A binary operator operates on two operands. A binary operator appears with its operands in this format:

	operand1 operator operand2



Arithmetic Operators
---------------------
OPERATOR + -

PURPOSE 
When these denote a positive or negative expression, they are unary operators.


EXAMPLE
SELECT *
  FROM order_items
  WHERE quantity = -1
  ORDER BY order_id, line_item_id, product_id;
 
SELECT *
  FROM employees
  WHERE -salary < 0
  ORDER BY employee_id;

----------------------------------------------------------------------------------------------
Concatenation Operator (||)
---------------------------
| IS CALLED AS PIPE

The concatenation operator manipulates character strings

opeartoe ||
purpose
-------
Concatenates character strings and CLOB data.

  example 
SELECT 'Name is ' || last_name
  FROM employees
  ORDER BY last_name;
-----------------------------------------------------------------------------------------------

Comparison Operators
--------------------

Comparison conditions compare one expression with another. The result of such a comparison can be TRUE, FALSE, or UNKNOWN.



  equal =
  equality test

SELECT *
  FROM employees
  WHERE salary = 2500
  ORDER BY employee_id;





not equal  != ,, ^=, <>
  Inequality test. Some forms of the inequality condition may be unavailable on some platforms.


SELECT *
  FROM employees
  WHERE salary != 2500
  ORDER BY employee_id;



=====================================================================================================================================



LOGICAL Operators (Cont…)
NOT Truth Table
–	  TRUE	FALSE	UNKNOWN
NOT	FALSE	TRUE	UNKNOWN

AND Truth Table
  
AND	    TRUE	   FALSE	UNKNOWN
TRUE	  TRUE	   FALSE	UNKNOWN
FALSE	  FALSE	   FALSE	FALSE
UNKNOWN	UNKNOWN	 FALSE	UNKNOWN

OR Truth Table
OR	    TRUE	FALSE	  UNKNOWN
TRUE  	TRUE	TRUE	  TRUE
FALSE  	TRUE	FALSE	  UNKNOWN
UNKNOWN	TRUE	UNKNOWN	UNKNOWN

=============================================================

LIKE
-----

Pattern-matching Conditions (LIKE)

Syntax   <char1>    [ NOT ]  LIKE  <char2>  [ ESCAPE esc_char ]       
------


char1 is a character expression, such as a character column, called the search value.

char2 is a character expression, usually a literal, called the pattern.

esc_char is a character expression, usually a literal, called the escape character.


  The pattern can contain special pattern-matching characters:

An underscore (_) in the pattern matches exactly one character in the value.

A percent sign (%) in the pattern can match zero or more characters in the value. The pattern '%' cannot match a null.

Example

SELECT salary 
    FROM employees
    WHERE last_name LIKE 'R%'
    ORDER BY salary;
===============================================================================================================================





ORACLE DATA TYPES  DOCUMENT PDF
                  
Overview of Data Types
A data type is a classification of a particular type of information or data. Each value manipulated by Oracle has a data type. The data type of a value associates a fixed set of properties with the value. These properties cause Oracle to treat values of one data type differently from values of another.
Built-in Data Type Summary
Data Type	Description
  -------------------------------------------------------------------------------------------------------------------
VARCHAR2
(size [BYTE | CHAR])	Variable-length character string having maximum length size bytes or characters. You must specify size for VARCHAR2. Minimum size is 1 byte or 1 character. Maximum size is:
•	32767 bytes or characters if MAX_STRING_SIZE = EXTENDED
•	4000 bytes or characters if MAX_STRING_SIZE = STANDARD
  ---------------------------------------------------------------------------------------------------------------------------------------
  
NVARCHAR2(size)	Variable-length Unicode character string having maximum length size characters. You must specify size for NVARCHAR2. The number of bytes can be up to two times size for AL16UTF16 encoding and three times size for UTF8 encoding. Maximum size is determined by the national character set definition, with an upper limit of:
•	32767 bytes if MAX_STRING_SIZE = EXTENDED
•	4000 bytes if MAX_STRING_SIZE = STANDARD
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
NUMBER [ (p [, s]) ]	Number having precision p and scale s. The precision p can range from 1 to 38. The scale s can range from -84 to 127. Both precision and scale are in decimal digits. A NUMBER value requires from 1 to 22 bytes.
--------------------------------
  FLOAT [(p)]	A subtype of the NUMBER data type having precision p. A FLOAT value is represented internally as NUMBER. The precision p can range from 1 to 126 binary digits. A FLOAT value requires from 1 to 22 bytes.
--------------------------------------------
  LONG	Character data of variable length up to 2 gigabytes, or 231 -1 bytes. Provided for backward compatibility.
-----------------------------------
  DATE	Valid date range from January 1, 4712 BC, to December 31, 9999 AD. The default format is determined explicitly by the NLS_DATE_FORMAT parameter or implicitly by the NLS_TERRITORY parameter. The size is fixed at 7 bytes. This data type contains the datetime fields YEAR, MONTH, DAY, HOUR, MINUTE, and SECOND. It does not have fractional seconds or a time zone.

  BINARY_FLOAT	32-bit floating point number. This data type requires 4 bytes.

  BINARY_DOUBLE	64-bit floating point number. This data type requires 8 bytes.

  TIMESTAMP [(fractional_seconds_precision)]	Year, month, and day values of date, as well as hour, minute, and second values of time, where fractional_seconds_precision is the number of digits in the fractional part of the SECOND datetime field. Accepted values of fractional_seconds_precision are 0 to 9. The default is 6. The default format is determined explicitly by the NLS_TIMESTAMP_FORMAT parameter or implicitly by the NLS_TERRITORY parameter. The size is 7 or 11 bytes, depending on the precision. This data type contains the datetime fields YEAR, MONTH, DAY, HOUR, MINUTE, and SECOND. It contains fractional seconds but does not have a time zone.

  TIMESTAMP [(fractional_seconds_precision)] WITH TIME ZONE	All values of TIMESTAMP as well as time zone displacement value, where fractional_seconds_precision is the number of digits in the fractional part of the SECOND datetime field. Accepted values are 0 to 9. The default is 6. The default format is determined explicitly by the NLS_TIMESTAMP_FORMAT parameter or implicitly by the NLS_TERRITORY parameter. The size is fixed at 13 bytes. This data type contains the datetime fields YEAR, MONTH, DAY, HOUR, MINUTE, SECOND, TIMEZONE_HOUR, and TIMEZONE_MINUTE. It has fractional seconds and an explicit time zone.

  TIMESTAMP [(fractional_seconds_precision)] WITH LOCAL TIME ZONE	All values of TIMESTAMP WITH TIME ZONE, with the following exceptions:
          •	Data is normalized to the database time zone when it is stored in the database.
            •	When the data is retrieved, users see the data in the session time zone.
             The default format is determined explicitly by the NLS_TIMESTAMP_FORMAT parameter or implicitly by the NLS_TERRITORY parameter. The size is 7 or 11 bytes, depending on the precision.

  
  INTERVAL YEAR [(year_precision)] TO MONTH	Stores a period of time in years and months, where year_precision is the number of digits in the YEAR datetime field. Accepted values are 0 to 9. The default is 2. The size is fixed at 5 bytes.

  
  INTERVAL DAY [(day_precision)] TO SECOND [(fractional_seconds_precision)]	Stores a period of time in days, hours, minutes, and seconds, where
 	day_precision is the maximum number of digits in the DAY datetime field. Accepted values are 0 to 9. The default is 2.
   •	fractional_seconds_precision is the number of digits in the fractional part of the SECOND field. Accepted values are 0 to 9. The default is 6.
 The size is fixed at 11 bytes.
  
  
  RAW(size)	Raw binary data of length size bytes. You must specify size for a RAW value. Maximum size is:
•	32767 bytes if MAX_STRING_SIZE = EXTENDED
•	2000 bytes if MAX_STRING_SIZE = STANDARD

  
  
  LONG RAW	Raw binary data of variable length up to 2 gigabytes.

  ROWID	Base 64 string representing the unique address of a row in its table. This data type is primarily for values returned by the ROWID pseudocolumn.

  UROWID [(size)]	Base 64 string representing the logical address of a row of an index-organized table. The optional size is the size of a column of type UROWID. The maximum size and default is 4000 bytes.

  CHAR [(size [BYTE | CHAR])]	Fixed-length character data of length size bytes or characters. Maximum size is 2000 bytes or characters. Default and minimum size is 1 byte.

  BYTE and CHAR have the same semantics as for VARCHAR2.

  NCHAR[(size)]	Fixed-length character data of length size characters. The number of bytes can be up to two times size for AL16UTF16 encoding and three times size for UTF8 encoding. Maximum size is determined by the national character set definition, with an upper limit of 2000 bytes. Default and minimum size is 1 character.

  CLOB	A character large object containing single-byte or multibyte characters. Both fixed-width and variable-width character sets are supported, both using the database character set. Maximum size is (4 gigabytes - 1) * (database block size).

  NCLOB	A character large object containing Unicode characters. Both fixed-width and variable-width character sets are supported, both using the database national character set. Maximum size is (4 gigabytes - 1) * (database block size). Stores national character set data.

  BLOB	A binary large object. Maximum size is (4 gigabytes - 1) * (database block size).

  BFILE	Contains a locator to a large binary file stored outside the database. Enables byte stream I/O access to external LOBs residing on the database server. Maximum size is 4 gigabytes.


=====================================================================================================================================================================================


ORDED BY PPT PDF


ORDER BY Clause
---------------

Use the ORDER BY clause to order rows returned by the statement. 

Without an  order_by_clause, no guarantee exists that the same query executed more than once will retrieve rows in the same order. 

  

NULLS LAST is the default for ascending order, and NULLS FIRST is the default for descending order. 




  ORDER BY Clause (Cont…)
Example	SELECT first_name, last_name FROM employees
	WHERE department_id IN (10,20)
	ORDER BY first_name ASC;

SELECT first_name, last_name, commission_pct FROM employees
WHERE department_id IN (80,90)
ORDER BY commission_pct NULLS FIRST;

SELECT first_name, last_name, commission_pct FROM employees
WHERE department_id IN (80,90)
ORDER BY 3 DESC NULLS FIRST;

SELECT first_name, last_name, commission_pct comm FROM employees
WHERE department_id IN (80,90)
ORDER BY comm NULLS LAST;
==================================================================================================================================


SQL FUNCTIONS PPT PDF


SQL FUNCTIONS
--------------



Definition:

	SQL functions are built into Oracle Database and are available for use in 	various appropriate SQL statements.

Categories 
Single Row Functions

Aggregate Functions/Group Functions

Analytic Functions

Object Reference Functions

Model Functions

Definition:

Single-row functions return a single result row for every row of a queried table or view. These functions can appear in select lists, WHERE clauses, START WITH and CONNECT BY clauses, and HAVING clauses..

Categories

Numeric
Character
Data Time
Comparison
Conversion
Large Object
Collection

Hierarchical
Data Mining
XML
JSON
Encode & Decode
Null Related
Environment ID

----------------------------------------------------------------------------------------------------------
SINGLE ROW FUNCTIONS - Numeric
---------------------------------

Definition:

	Numeric functions accept numeric input and return numeric values

Function Name	ABS

Syntax		-> ABS (   N )	

Purpose		ABS returns the absolute value of n.

Example		SELECT ABS(-15) "Absolute"
  			FROM DUAL;
------------------------------------------------------------------------------------------------------------------------------


Definition:

	Numeric functions accept numeric input and return numeric values



Function Name	 POWER
 
Syntax		POWER ( N1, N2) 	

Purpose		POWER returns n2 raised to the n1 power.

Example		 SELECT POWER(3,2) "Raised"
			 FROM DUAL;

SQL> SELECT POWER(3,2) "Raised"  FROM DUAL;

    Raised
----------
         9
----------------------------------------------------------------------------------

      MOD  (REMAINDER)
      ----      
         
Definition:
	Numeric functions accept numeric input and return numeric values


Function Name	 MOD

Syntax		mod(N,M)	

Purpose		MOD returns the remainder of n2 divided by n1. Returns n2 if n1 			is 0

Example		 SELECT MOD(11,4) "Modulus" FROM DUAL;


-------------------------------------------------------------------
ROUND
--------
Function Name	 ROUND


Syntax			

Purpose		
  ROUND returns n rounded to integer places to the right of the 
  decimal point. If you omit integer, then n is rounded to zero 			
  places. If integer is negative, then n is rounded off to the left of 		
  the decimal point.

Example		 SELECT ROUND(15.193,1) "Round" FROM DUAL;
			 SELECT ROUND(15.193,-1) "Round" FROM DUAL;

-----------------------------------------------------

SQL> SELECT ROUND(15.193,1) "Round" FROM DUAL;

     Round
----------
      15.2

SQL>                     SELECT ROUND(15.193,-1) "Round" FROM DUAL;

     Round
----------
        20


------------------------------------------------------------------------------------------------------------------------------

REMAINDER
---------

Function Name	 REMAINDER


Syntax			

Purpose		REMAINDER returns the remainder of n2 divided by n1.

Example		 SELECT REMAINDER(20,6) FROM DUAL;



--------------------------------------------------------------------------------------
TRUNC
-----

Function Name	 TRUNC

Syntax			

Purpose
  The TRUNC (number) function returns n1 truncated to n2 decimal 		
  places. If n2 is omitted, then n1 is truncated to 0 places. n2 can be 	
  negative to  truncate (make zero) n2 digits left of the decimal 
  point.

Example		
  SELECT TRUNC(15.79,1) "Truncate" FROM DUAL;
	SELECT TRUNC(15.79,-1) "Truncate" FROM DUAL;


SQL>    SELECT TRUNC(15.79,1) "Truncate" FROM DUAL;

  Truncate
----------
      15.7

SQL>                    SELECT TRUNC(15.79,-1) "Truncate" FROM DUAL; ---------<<<<<<<<<<<<<<<<<<<<,FROM LEFT UNDERSTAND

  Truncate
----------
        10

Expression	Explanation	Result
TRUNC(15.79)	   Truncate to 0 decimal places	15
TRUNC(15.79, 1) 	Keep 1 decimal place      	15.7
TRUNC(15.79, 0)	  Truncate to whole number	  15
TRUNC(15.79, -1)	Truncate to nearest 10	    10
TRUNC(1234.567, -2)	Truncate to nearest 100	  1200
 
------------------------------------------------------------------------------------------------------------------------------

CONCAT
------

Function Name	 CONCAT

Syntax			

Purpose		CONCAT returns char1 concatenated with char2.

Example	SELECT CONCAT(CONCAT(last_name, '''s job category is '), job_id) "Job" 
  		FROM employees 
  		WHERE employee_id = 152;

--------------OUTPUT
SQL> SELECT CONCAT(CONCAT(last_name, '''s job category is '), job_id) "Job"
  2             FROM employees
  3             WHERE employee_id = 152;

Job
------------------------------------------------------
Hall's job category is SA_REP
'
----------------------------------------------------------------------------------------------------------------------------------------

INITCAP
----
Function Name	 INITCAP

Syntax			


Purpose		INITCAP returns char, with the first letter of each word in 				uppercase, all other letters in lowercase.

Example	 	SELECT INITCAP('the soap') "Capitals"
  			FROM DUAL;

--------------------------------------------------------------------------------
LOWER
Function Name	 LOWER

Syntax			


Purpose		LOWER returns char, with all letters lowercase.

Example	 	 SELECT LOWER('MR. SCOTT MCMILLAN') "Lowercase"
			 FROM DUAL;
------------------------------------------------------------------------------
Function Name	 LPAD

Syntax			


Purpose		LPAD returns expr1, left-padded to length n characters with the 			sequence of characters in expr2. This function is useful for 				formatting the output of a query

Example	 	 SELECT LPAD('Page 1',15,'*.') "LPAD example"
			 FROM DUAL;
--------------------------------------------------------------------------------
Function Name	 RPAD

Syntax			


Purpose		RPAD returns expr1, right-padded to length n characters with 			expr2, replicated as many times as necessary. This function is 			useful for formatting the output of a query.

Example	 	 SELECT RPAD('Page 1',15,'*.') "LPAD example"
			 FROM DUAL;
------------------------------------------------------------------------------------

Function Name	 LTRIM

Syntax			


Purpose		LTRIM removes from the left end of char all of the characters 			contained in set. If you do not specify set, then it defaults to a 			single blank. 

Example	  SELECT LTRIM('<=====>BROWNING<=====>', '<>=') "LTRIM Example"
		  FROM DUAL;

SQL> SELECT LTRIM('<=====>BROWNING<=====>', '<>=') "LTRIM Example"  FROM DUAL;

LTRIM Example
---------------
BROWNING<=====>                                         -------<<<IT WILL STIO WORKIN IF IT HAVE OTHER THAN THE CHARACTOR

SQL>
-----------------------------------------------------------------------------------------
Function Name	 RTRIM

Syntax			


Purpose		RTRIM removes from the right end of char all of the characters 			that appear in set. If you do not specify set, then it defaults to a 			single blank. RTRIM works similarly to LTRIM.

Example	  SELECT RTRIM('<=====>BROWNING<=====>', '<>=') "RTRIM Example" FROM DUAL;
-----------------------------------------------------------------------------------------
Function Name	 TRIM

Syntax			TRIM(trim_char FROM source_char)

Purpose		TRIM enables you to trim leading or trailing characters (or both) 			from a character string. 

Example	  	SELECT TRIM('*' FROM '***ABC***') FROM DUAL;



-------------------------------------------------------------------------------------------


Function Name	 UPPER

Syntax			


Purpose		UPPER returns char, with all letters uppercase

Example	 	SELECT UPPER(last_name) "Uppercase"
			FROM employees;
----------------------------------------------------------------------------------------


Function Name	 SUBSTR

Syntax			 SUBSTR(char, position [,substring_length] )

Purpose		The SUBSTR functions return a portion of char, beginning at 			character position, substring_length characters long. If position is 			positive, then Oracle Database counts from the beginning of char 			to find the first character. If position is negative, then Oracle 			counts backward from the end of char.

Example	 	 SELECT SUBSTR('ABCDEFG',3,4) "Substring“  FROM DUAL;

	 		SELECT SUBSTR('ABCDEFG',-5,4) "Substring“  FROM DUAL;
	 
------------------------------------------------------------------------------------

Function Name	 INSTR

Syntax			 INSTR(string,substring[,position] [,occurance] )

Purpose		The INSTR functions search string for substring. 
			
Example	 	 SELECT INSTR('CORPORATE FLOOR','OR', 1, 1) "Instring"
 			 FROM DUAL;
  
			SELECT INSTR('CORPORATE FLOOR','OR', -3, 2) "Reversed Instring"
			FROM DUAL;
-------------------------------------------------------------------------------------------------

Function Name	 LENGTH

Syntax			 LENGTH(char )

Purpose		The LENGTH functions return the length of char.			
Example	 	 SELECT LENGTH('CANDIDE') "Length in characters"
			 FROM DUAL;
--------------------------------------------------------------------------------------------
Function Name	 REPLACE

Syntax			


Purpose	REPLACE returns char with every occurrence of search_string replaced 		with replacement_string. If replacement_string is omitted or null, then all 		occurrences of search_string are removed. If search_string is null, then 		char is returned.	

Example	 	 SELECT REPLACE('JACK and JUE','J','BL') "Changes"
			 FROM DUAL;
------------------------------------------------------------------------------
Function Name	 NVL

Syntax			


Purpose		If expr1 is null, then NVL returns expr2. If expr1 is not null, then 			NVL returns expr1.	

Example	 	 SELECT last_name, 
			NVL(TO_CHAR(commission_pct), 'Not Applicable') commission
		  	FROM employees
  			WHERE last_name LIKE 'B%'
  			ORDER BY last_name;


SQL> SELECT last_name,
  2                     NVL(TO_CHAR(commission_pct), 'Not Applicable') commission
  3                     FROM employees
  4                     WHERE last_name LIKE 'B%'
  5                     ORDER BY last_name;

LAST_NAME                 COMMISSION
------------------------- ----------------------------------------
Baer                      Not Applicable
Baida                     Not Applicable
Banda                     .1
Bates                     .15
Bell                      Not Applicable
Bernstein                 .25
Bissot                    Not Applicable
Bloom                     .2
Bull                      Not Applicable

9 rows selected.

SQL>
------------------------------------------------------------------------------------


Function Name	 NVL2

Syntax			


Purpose		If expr1 is not null, then NVL2 returns expr2. If expr1 is null, then 			NVL2 returns expr3.	

Example	SELECT last_name, salary,
       		NVL2(commission_pct, salary + (salary * commission_pct), salary) AS income
  		FROM employees
  		WHERE last_name like 'B%'
  		ORDER BY last_name;





LAST_NAME                     SALARY     INCOME
------------------------- ---------- ----------
Baer                           10000      10000
Baida                           2900       2900
Banda                           6200       6820
Bates                           7300       8395
Bell                            4000       4000
Bernstein                       9500      11875
Bissot                          3300       3300
Bloom                          10000      12000
Bull                            4100       4100

9 rows selected

---------------------------------------------------------------------------------------
Function Name	 NULLIF

Syntax			


Purpose	NULLIF compares expr1 and expr2. If they are equal, then the function 		returns null. If they are not equal, then the function returns expr1. You 		cannot specify the literal NULL for expr1.

Example	SELECT e.last_name, NULLIF(j.job_id, e.job_id) "Old Job ID"
  		FROM employees e, job_history j
  		WHERE e.employee_id = j.employee_id
  		ORDER BY last_name, "Old Job ID";
----------------------------------------------------------------------

LAST_NAME                 Old Job ID
------------------------- ----------
De Haan                   IT_PROG
Hartstein                 MK_REP
Kaufling                  ST_CLERK
Kochhar                   AC_ACCOUNT
Kochhar                   AC_MGR
Raphaely                  ST_CLERK
Taylor                    SA_MAN
Taylor
Whalen                    AC_ACCOUNT
Whalen

10 rows selected.



-------------------------------------------------------------------------
  Function Name	 COALESCE

Syntax			


Purpose	COALESCE returns the first non-null expr in the expression list. You must 		specify at least two expressions. If all occurrences of expr evaluate to 		null, then the function returns null.

Example	 SELECT COALESCE(NULL,'RAJA','RANI') FROM DUAL;


SELECT COALESCE(NULL, 'RAJA', 'RANI') AS Result
FROM DUAL;
Step-by-step:

First value = NULL → skip.

Second value = 'RAJA' → not NULL → return this value.

'RANI' is never checked because 'RAJA' already satisfies the condition.

Result:

markdown
Copy
Edit
RESULT
------
RAJA
💡 More Examples:
Expression	Output	Explanation
COALESCE(NULL, NULL, 'Hello')	Hello	First two are NULL, third is returned
COALESCE(NULL, NULL, NULL)	NULL	All are NULL, so result is NULL
COALESCE(10, 20, 30)	10	First non-NULL is 10
COALESCE(NULL, SYSDATE, 'Fallback')	Current date	SYSDATE is not NULL

--------------------------------------------------------------------------------------------------
SIMPLE CASE STATEMENT	

Syntax		CASE <expr> WHEN <comparison_expr> THEN <return_expr>
		[ ELSE <else_expr> ]

Purpose	In a simple CASE expression, Oracle Database searches for the 
  first WHEN 		... THEN pair for which expr is equal to comparison_expr
  and returns 		return_expr. 
  If none of the WHEN ... THEN pairs meet this condition, and 
  an ELSE clause exists, then Oracle returns else_expr. Otherwise, Oracle 	
  returns null.



=======================================================================================









CASE 
====


SIMPLE CASE STATEMENT	


Example	SELECT department_id,
CASE department_id
WHEN 10 THEN 'ADMINISTRATION'
WHEN 20 THEN 'MARKETING'
WHEN 30 THEN 'PURCHASING'
ELSE 'UNKNOW'
END CASE
FROM departments
WHERE department_id <50;


---------------------------------------------------
SEARCH CASE STATEMENT	

Syntax		CASE WHEN <condition> THEN <return_expr>
		[ ELSE <else_expr> ]

Purpose	In a searched CASE expression, Oracle searches from left to right until it 	
  finds an occurrence of condition that is true, and then returns 	
  return_expr. If no condition is found to be true, and an ELSE clause exists, 
  then Oracle returns else_expr. Otherwise, Oracle returns null.
----------------------------------------------------------------

  
  SEARCH CASE STATEMENT	
------------------------

Example	SELECT employee_id,
			CASE 	WHEN salary BETWEEN 2000 AND 5000 THEN ‘Low’
				WHEN salary BETWEEN 5000 AND 10000 THEN ‘Medum’
				WHEN salary >10000  THEN ‘High’
			ELSE
				‘Unknown’
			END CASE
		FROM employees 
		WHERE salary between 2000 and 10000;


====================================================================================

DECODE 
------- 
Syntax		DECODE ( expr, search, result [ ,… ] [,default] )

Purpose	DECODE compares expr to each search value one by one. If expr is equal 
  to a search, then Oracle Database returns the corresponding result. If no 	
  match is found, then Oracle returns default. If default is omitted, then 
  Oracle returns null.
Example
		SELECT employee_id, salary,
			DECODE (department_id, 
					10, 'MARKETING’,
					20, 'SALES’,
					30,'WAREHOUSE’,
					'UNKNOWN’)
		FROM employees
		WHERE employee_id < 200

============================================================================================
  
CONVERSION FUNCTIONS
--------------------
Function Name	 TO_CHAR

Syntax			TO_CHAR ( datatime [, format ] )
			TO_CHAR ( number [, format ] )

Purpose	TO_CHAR (datetime) converts a datetime or interval value of DATE to a 			value of VARCHAR2 data type in the format specified by the date format fmt.
		
		TO_CHAR (number) converts n to a value of VARCHAR2 data type, using 			the optional number format fmt.

Example	SELECT sysdate, TO_CHAR(sysdate,'DD/MON/YYYY HH:MI:SS') FROM DUAL; 
		SELECT TO_CHAR(172347,'999,99,999.90') AS tochar FROM DUAL;





Function Name
  TO_DATE

Syntax		TO_DATE (char [ DEFAULT return_val ON CONVERSION ERROR ] [,fmt] )
			
Purpose	TO_DATE converts char to a value of DATE data type.
		
Example	SELECT TO_DATE( 'January 15, 1989, 11:00 A.M.’
				    , 'Month dd, YYYY, HH:MI A.M.’) 
		FROM DUAL;	

		 SELECT TO_DATE( 'January 15, 1989, 11:00 A.M.’ 
			DEFAULT 'January 1, 1990, 11:00 A.M.' ON CONVERSION ERROR,
 				     'Month dd, YYYY, HH:MI A.M.’)
 		FROM DUAL; 	

--------------
Function Name	    
  TO_DATE

Syntax		TO_DATE (char [ DEFAULT return_val ON CONVERSION ERROR ] [,fmt] )
			
Purpose	TO_DATE converts char to a value of DATE data type.
		
Example	SELECT TO_DATE( 'January 15, 1989, 11:00 A.M.’
				    , 'Month dd, YYYY, HH:MI A.M.’) 
		FROM DUAL;	

		 SELECT TO_DATE( 'January 15, 1989, 11:00 A.M.’ 
			DEFAULT 'January 1, 1990, 11:00 A.M.' ON CONVERSION ERROR,
 				     'Month dd, YYYY, HH:MI A.M.’)
 		FROM DUAL; 	

=====================================================================================

DATE FUNCTIONS
----------------

Function Name	- MONTH_BETWEEN

Syntax		 MONTH_BETWEEN (date1, date2)
			
Purpose	 MONTHS_BETWEEN returns number of months between dates date1 and 		date2. If date1 is later than date2, then the result is positive. If date1 is 			earlier than date2, then the result is negative. 
		
Example	 SELECT MONTHS_BETWEEN
 				(TO_DATE('02-02-1995','MM-DD-YYYY'),
				 TO_DATE('01-01-1995','MM-DD-YYYY') ) "Months"
 		FROM DUAL; 	

-----------------------------
Function Name	  - ADD_MONTHS

Syntax		 ADD_MONTHS (date, integer)
			
Purpose	 ADD_MONTHS returns the date, date plus integer months.
		
Example	 SELECT 
		TO_CHAR(ADD_MONTHS(hire_date, 1), 'DD-MON-YYYY') "Next month"
 		FROM employees 
	 	WHERE last_name = 'Baer';

----------------------------------------------------------------------------------------------
SYSDATE

Function Name	- SYSDATE

Syntax		 SYSDATE
			
Purpose	 SYSDATE returns the current date and time set for the operating system on 		which the database server resides.		

Example	SELECT TO_CHAR (SYSDATE, 'MM-DD-YYYY HH24:MI:SS') "NOW" 
		FROM DUAL; 

--------------------------------------------------------------------------------
Function Name	 NEXT_DAY

Syntax		 NEXT_DAY (date, char )
			
Purpose	 NEXT_DAY returns the date of the first weekday named by char that is later 		than the date		

Example	SELECT NEXT_DAY('15-OCT-2009','TUESDAY') "NEXT DAY" FROM DUAL; 

------------------------------------------------------------------------------------
Function Name	 LAST_DAY

Syntax		 LAST_DAY (date)
			
Purpose	 LAST_DAY returns the date of the last day of the month that contains date. 

Example	 SELECT SYSDATE, LAST_DAY(SYSDATE) "Last"
		FROM DUAL;
-------------------------------------------------------------------------------
Function Name	 AVG

Syntax		 AVG ([ DISTINCT | ALL ] expr)
			
Purpose	 AVG returns average value of expr.

Example	 SELECT AVG(salary) "Average" FROM employees;
--------------------------------------------------------------------------------
Function Name	 COUNT

Syntax		 COUNT  ({ * | [ DISTINCT | ALL ] expr })
			
Purpose	 COUNT returns the number of rows returned by the query.

Example	 SELECT COUNT(*) "Total" FROM employees;
-----------------------------------------------------------------------------


Function Name	 COUNT

Syntax		 COUNT  ({ * | [ DISTINCT | ALL ] expr })
			
Purpose	 COUNT returns the number of rows returned by the query.

Example	 SELECT COUNT(*) "Total" FROM employees;
----------------------------------------------------------------------------------
Function Name	 MAX

Syntax		 MAX([ DISTINCT | ALL ] expr)
			
Purpose	 MAX returns maximum value of expr. 

Example	 SELECT MAX(salary) "Maximum"  FROM employees;
------------------------------------------------------------------------------------
Function Name	 MIN

Syntax		 MIN([ DISTINCT | ALL ] expr)
			
Purpose	 MIN returns minimum value of expr. 

Example	 SELECT MIN(hire_date) "Earliest"   FROM employees;
----------------------------------------------------------------------------------------------------

Function Name	 STDDEV

Syntax		 STDDEV ([ DISTINCT | ALL ] expr)
			
Purpose	 STDDEV returns the sample standard deviation of expr. 

Example	 SELECT STDDEV(salary) "Deviation" FROM employees;
-----------------------------------------------------------------------------------------

Function Name	 SUM

Syntax		 SUM ([ DISTINCT | ALL ] expr)
			
Purpose	 SUM returns the sum of values of expr. 

Example	 SELECT SUM(salary) "Total"
		     FROM employees;
-------------------------------------------------------------------------------------

Function Name	 VARIANCE

Syntax		 VARIANCE([ DISTINCT | ALL ] expr)
			
Purpose	 VARIANCE returns the variance of expr.

Example	 SELECT VARIANCE(salary) "Variance"
		   FROM employees;
------------------------------------------------------------------------------------------
=====================================================================================================
	
GROUP BY HAVING PDF PPT

GROUP BY Clause
--------------
Specify the GROUP BY clause if you want the database to group the selected rows based on the value of expr(s) for each row and return a single row of summary information for each group. 

Expressions in the GROUP BY clause can contain any columns of the tables, views, or materialized views in the FROM clause, regardless of whether the columns appear in the select list.

The GROUP BY clause groups rows but does not guarantee the order of the result set. To order the groupings, use the ORDER BY clause.

-------------------------------------------------------------------
GROUP BY Clause (Cont…)


Syntax

		GROUP BY expr,… HAVING <condition>
Example

SELECT department_id, MIN(salary), MAX (salary)
     FROM employees
     GROUP BY department_id
   ORDER BY department_id;

SELECT department_id, MIN(salary), MAX (salary)
     FROM employees
     WHERE job_id = 'PU_CLERK'
     GROUP BY department_id
   ORDER BY department_id;

-------------------------------------------------------

HAVING Clause

Use the HAVING clause to restrict the groups of returned rows to those groups for which the specified condition is TRUE. If you omit this clause, then the database returns summary rows for all groups.

Example		SELECT department_id, MIN(salary), MAX (salary)
   FROM employees
   GROUP BY department_id
   HAVING MIN(salary) < 5000
   ORDER BY department_id;

SELECT department_id, manager_id 
   FROM employees 
   GROUP BY department_id, manager_id HAVING (department_id, manager_id) IN
   (SELECT department_id, manager_id FROM employees x 
      WHERE x.department_id = employees.department_id)
   ORDER BY department_id;

The above example uses a correlated subquery in a HAVING clause that eliminates from the result set any departments without managers and managers without departments:
---------------------------------------------------------------------------------------------------------------------------------------------------------



DAY 3 30-07-25

	VIEW PPT PDF
VIEW
----

Definition:

View is a logical table based on one or more tables or views. A view contains no data itself. The tables upon which a view is based are called base tables.

Syntax

CREATE [OR REPLACE] [[NO] FORCE] VIEW [schema.] <view_name> 
[ ( col_list ) [ <inline_constraint>  |  <out_of_line_constraint>  ] ]
   AS <subquery> 
   [ WITH READ ONLY | CHECK OPTION 
	[CONSTRAINT <constraint_name> ]  
   ] ;

--------------------------------------------------------------
Creating a View: Example

CREATE VIEW emp_view AS 
   SELECT last_name, salary*12 annual_salary
   FROM employees 
   WHERE department_id = 20;

Creating a View with Constraints: Example

CREATE VIEW emp_sal (emp_id, last_name, email UNIQUE ,
   CONSTRAINT id_pk PRIMARY KEY (emp_id))
   AS SELECT employee_id, last_name, email FROM employees;

----------------------------------------------------------

Creating an Updatable View: Example
CREATE VIEW clerk AS
   SELECT employee_id, last_name, department_id, job_id 
   FROM employees
   WHERE job_id = 'PU_CLERK' 
      or job_id = 'SH_CLERK' 
      or job_id = 'ST_CLERK';

UPDATE clerk SET job_id = 'PU_MAN' WHERE employee_id = 118;
Creating a View with Check Option: Example
CREATE VIEW clerk AS
   SELECT employee_id, last_name, department_id, job_id 
   FROM employees
   WHERE job_id = 'PU_CLERK' 
WITH CHECK OPTION;



---------------------------------------------------------------------


Creating a Read-Only View: Example
CREATE VIEW customer_ro (name, language, credit)
      AS SELECT cust_last_name, nls_language, credit_limit
      FROM customers
      WITH READ ONLY;
Creating a Join View: Example
CREATE VIEW locations_view AS
   SELECT d.department_id, d.department_name, l.location_id, l.city
   FROM departments d, locations l
   WHERE d.location_id = l.location_id;

SELECT column_name, updatable 
   FROM user_updatable_columns
   WHERE table_name = 'LOCATIONS_VIEW'
   ORDER BY column_name, updatable;
--------------------------------------------------------------------


To Alter View Syntax

ALTER VIEW [schema.] <view_name> 
[ADD <out_of_line_constraint> ]
[DROP [CONSTRAINT <constraint_name> | PRIMARY KEY | UNIQUE (<col_name>) ]
[COMPILE]
[ READ [ ONLY | WRITE ] ]

Example   			ALTER VIEW customer_ro  COMPILE;

To Drop View 
				DROP VIEW <view_name>;

Data Dictionary Views		USER_VIEWS
				ALL_VIEWS
				DBA_VIEWS
-----------------------------------------------------------------------------------


SET PPT PDF

SET OPERATORS

Definition:

Set operators combine the results of two component queries into a single result. Queries containing set operators are called compound queries. 

------------
SET OPERATORS – UNION ALL


Definition:


	The UNION ALL operator does not eliminate duplicate selected rows

Syntax 
		SELECT statement_1
		UNION ALL
		SELECT statement_2;

Example
		SELECT department_id FROM employees
		UNION ALL
		SELECT department_id FROM departments;
-------------------------------------------------------
SET OPERATORS – INTERSECT


Definition:


	Returns only those unique rows returned by both queries

Syntax 
		SELECT statement_1
		INTERSECT
		SELECT statement_2;

Example
		SELECT department_id FROM employees
		 INTERSECT
		SELECT department_id FROM departments;


---------------------------------------------------------------


SET OPERATORS – MINUS


Definition:


	Returns only those unique rows returned by both queries

Syntax 
		SELECT statement_1
		MINUS
		SELECT statement_2;

Example
		SELECT department_id FROM employees
		 MINUS
		SELECT department_id FROM departments;
=====================================================================================================================================
SEQUENCE PDF PPT
SEQUENCE
--------


Definition:

Sequence is a database object from which multiple users may generate unique integers. You can use sequences to automatically generate primary key values.

Syntax: 		CREATE SEQUENCE [ schema. ] sequence
   			[ { INCREMENT BY | START WITH } integer  
   			| { MAXVALUE integer | NOMAXVALUE }
   			| { MINVALUE integer | NOMINVALUE }
   			| { CYCLE | NOCYCLE }
   			| { CACHE integer | NOCACHE }
   			| { SESSION | GLOBAL }
   			];






	
