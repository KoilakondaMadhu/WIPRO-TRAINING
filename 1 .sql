connect sys/"Madhu@1234"@xe as sysdba
alter user hr identified by hr account unlock;
connect hr/hr
====================================================================================================
1) to see all tables
select * from tab;

2 
CREATE TABLE tablename( col1 datatype[10] ,col2 datatype2(10)) 
3
INSERT INTO tablename(attripues) VALUES (col1, col2, ...) 
4
DESC tablename;
5 
SELECT colname FROM tablename;

6
SELECT * FROM tablename;


7 
select colname from tablename where {condition};

SQL> select sid  from student9 where sid > 2

-------------------
/

       SID
----------
         3
         3
         3


SQL> select *  from student9 where sid > 2
  2
SQL> /

       SID NAME                 COURSE
---------- -------------------- --------------------
         3 madhu                cse
         3 madhu                cse
         3 madhu                cse




