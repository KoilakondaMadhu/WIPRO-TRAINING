What is a Package?
==================
A package is a schema object that groups logically related PL/SQL types, variables, 
constants, subprograms, cursors, and exceptions. 

A package is compiled and stored in the database, where many applications can share 
its contents.

Package Parts:
==============
1. SPECIFICATION	-- Mandatory
2. BODY				-- Optional

1. PACKAGE SPECIFICATION:
-------------------------
	--declares the public items that can be referenced from outside the package
	--If the public items include cursors or subprograms, then the package must also have 
	  a body. 
	  
2. PACKAGE BODY:
-------------------------
	The body must define queries for public cursors and code for public subprograms.

Reasons to Use Packages:
-----------------------
1. Modularity

	Subprograms let you break a program into manageable, well-defined modules.

2. Easier Application Design

	When designing an application, all you need initially is the interface information 
	in the package specifications. 

3. Hidden Implementation Details

	Packages let you share your interface information in the package specification, 
	and hide the implementation details in the package body. 

4. Better Performance

	The first time you invoke a package subprogram, Oracle Database loads the whole 
	package into memory. Subsequent invocations of other subprograms in same the package 
	require no disk I/O.
	
5. Easier to Grant Roles

	You can grant roles on the package, instead of granting roles on each object in 
	the package.

6. Maintainability

	You can change the implementation details of a subprogram without changing its invokers.

7. Reusability

	Any number of applications, in many different environments, can use the same package 
	subprogram or standalone subprogram.

SYNTAX FOR SPECIFICATION:
-------------------------
	CREATE [ OR REPLACE ] PACKAGE  [schema.] <pkg_name> IS|AS 
		<item_list>;
	END [ <pkg_name> ];

EXAMPLE:
--------

	CREATE OR REPLACE PACKAGE pkg_student IS 
			i NUMBER := 1000;
			PROCEDURE add_student(p_id NUMBER, p_name VARCHAR2, p_mark NUMBER);
			PROCEDURE del_student(p_id NUMBER);
			PROCEDURE up_student(p_id NUMBER, p_mark NUMBER);
			FUNCTION  sel_student (p_id NUMBER) RETURN NUMBER;
		END pkg_student;
		/

DESC <pkg_name>;
DESC pkg_student;

To refere PKG objects:
----------------------
Syntax 	: pkg_name.object_name [(parameter_list)];
Eg		: pkg_student.i;
		  pkg_student.del_student(v_student_id);

SYNTAX FOR BODY:
----------------
	CREATE [ OR REPLACE ] PACKAGE BODY [schema.] <pkg_name> IS|AS 
		<write code here>;
	END [ <pkg_name> ];
EXAMPLE:
--------
	CREATE OR REPLACE PACKAGE BODY pkg_student IS 
		
		PROCEDURE add_student(p_id NUMBER, p_name VARCHAR2, p_mark NUMBER) IS 
			BEGIN
				INSERT INTO student values (p_id,p_name,p_mark);
				COMMIT;
			EXCEPTION 
				WHEN DUP_VAL_ON_INDEX THEN
					DBMS_OUTPUT.PUT_LINE('Duplicate Student ID');
			END add_student;
		
		PROCEDURE del_student(p_id NUMBER) IS 
			BEGIN
				DELETE FROM student WHERE sid =  p_id;
				COMMIT;
			EXCEPTION 
				WHEN OTHERS THEN
					DBMS_OUTPUT.PUT_LINE('SOME ERRORS');
			END del_student;
		
		PROCEDURE up_student(p_id NUMBER, p_mark NUMBER) IS 
			BEGIN
					UPDATE student SET mark = p_mark WHERE sid = p_id;
					COMMIT;
			END up_student;
		
		FUNCTION  sel_student (p_id NUMBER) RETURN NUMBER IS 
				x NUMBER;
			BEGIN
				SELECT mark INTO x FROM student WHERE sid = p_id;
				RETURN x;
			EXCEPTION 
				WHEN NO_DATA_FOUND THEN
					DBMS_OUTPUT.PUT_LINE('The student id not found');
			END sel_student;
END pkg_student;
--------------------------------------------------------------------------
BEGIN
	pkg_student.add_student(1, 'RAJA',90);
END;
/

DECLARE
		i NUMBER;
BEGIN
	i := pkg_student.sel_student(1);
	DBMS_OUTPUT.PUT_LINE('The student Mark is :'||i);
END;
/
--------------------------------------------------------------------------
ALTER PACKAGE:
--------------
Syntax:
	ALTER PACKAGE [schema.] <pkg_name> COMPILE [ PACKAGE | SPECIFICATION | BODY ];
Example:
	ALTER PACKAGE  pkg_student COMPILE  PACKAGE; 		-- compiles BOTH spec & body
	ALTER PACKAGE  pkg_student COMPILE  SPECIFICATION ; -- compiles only spec 
	ALTER PACKAGE  pkg_student COMPILE  BODY ; 			-- compiles only BODY

DROP PACKAGE:
-------------
Syntax:
	DROP PACKAGE [ BODY ] [schema.] <pkg_name>;
Example:
	DROP PACKAGE pkg_student; -- drop both spec & body
	DROP PACKAGE BODY pkg_student; -- drop ONLY the body

Data Dictionary :
-----------------
select * from user_source where name = 'PKG_STUDENT' AND TYPE = 'PACKAGE BODY';
SELECT * FROM USER_OBJECTS WHERE OBJECT_NAME ='PKG_STUDENT';

