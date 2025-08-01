SQL> desc student
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER
 NAME                                               VARCHAR2(20)
 PHONE                                              NUMBER

SQL> select * from student;

        ID NAME                      PHONE                                      
---------- -------------------- ----------                                      
         1 ABC                          90                                      
         2 ABC                          90                                      
         3 ABC                          90                                      
         4 ABC                          90                                      
         5 ABC                          90                                      
         6 ABC                          90                                      
         7 ABC                          90                                      
         8 ABC                          90                                      
         9 ABC                          90                                      
        10 ABC                          90                                      
         1 ABC                          90                                      

        ID NAME                      PHONE                                      
---------- -------------------- ----------                                      
         2 ABC                          90                                      
         3 ABC                          90                                      
         4 ABC                          90                                      
         5 ABC                          90                                      

15 rows selected.

SQL> truncate table student;

Table truncated.

SQL> set pagesize 1000 linesize 100

SQL> alter table student add(mark number(4));

Table altered.

SQL> desc student
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 ID                                                             NUMBER
 NAME                                                           VARCHAR2(20)
 PHONE                                                          NUMBER
 MARK                                                           NUMBER(4)

SQL> insert into student values (&id,'&name',&phone,&mark);
Enter value for id: 1
Enter value for name: raja
Enter value for phone: 8765
Enter value for mark: 90
old   1: insert into student values (&id,'&name',&phone,&mark)
new   1: insert into student values (1,'raja',8765,90)

1 row created.

SQL> /
Enter value for id: 2
Enter value for name: rani
Enter value for phone: 5647
Enter value for mark: 89
old   1: insert into student values (&id,'&name',&phone,&mark)
new   1: insert into student values (2,'rani',5647,89)

1 row created.

SQL> /
Enter value for id: 3
Enter value for name: king
Enter value for phone: 5363
Enter value for mark: 80
old   1: insert into student values (&id,'&name',&phone,&mark)
new   1: insert into student values (3,'king',5363,80)

1 row created.

SQL> /
Enter value for id: 4
Enter value for name: queen
Enter value for phone: 60
Enter value for mark: 70
old   1: insert into student values (&id,'&name',&phone,&mark)
new   1: insert into student values (4,'queen',60,70)

1 row created.

SQL> commit;

Commit complete.

SQL> select * from student
  2  ;

        ID NAME                      PHONE       MARK                                               
---------- -------------------- ---------- ----------                                               
         1 raja                       8765         90                                               
         2 rani                       5647         89                                               
         3 king                       5363         80                                               
         4 queen                        60         70                                               

SQL> update student set phone=8740 where id = 4;

1 row updated.

SQL> commit;

Commit complete.

SQL> clear scr

SQL> SELECT * FROM STUDENT;

        ID NAME                      PHONE       MARK                                               
---------- -------------------- ---------- ----------                                               
         1 raja                       8765         90                                               
         2 rani                       5647         89                                               
         3 king                       5363         80                                               
         4 queen                      8740         70                                               

SQL> INSERT INTO STUDENT VALUES (5,'ABC',7387,90);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> CONN hr/hr@orclpdb
Connected.
SQL> desc emp_job
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                                    NUMBER(6)
 FIRST_NAME                                                     VARCHAR2(20)
 JOB_ID                                                NOT NULL VARCHAR2(10)

SQL> desc emp_dept
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                                    NUMBER(6)
 FIRST_NAME                                                     VARCHAR2(20)
 DEPARTMENT_ID                                                  NUMBER(4)

SQL> desc emp_hire
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                                    NUMBER(6)
 LAST_NAME                                             NOT NULL VARCHAR2(25)
 HIRE_DATE                                             NOT NULL DATE

SQL> desc emp_salary
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                                    NUMBER(6)
 FIRST_NAME                                                     VARCHAR2(20)
 JOB_ID                                                NOT NULL VARCHAR2(10)
 SALARY                                                         NUMBER(8,2)

SQL> conn sys/oracle@orclpdb as sysdba
Connected.
SQL> create public synonym pub_sy_student FOR hr.student;

Synonym created.

SQL> grant all on pub_sy_student to public;

Grant succeeded.

SQL> drop public synonym pub_sy_student;

Synonym dropped.

SQL> desc employees
ERROR:
ORA-04043: object employees does not exist 


SQL> conn hr/hr@orclpdb
Connected.
SQL> desc employees
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPLOYEE_ID                                           NOT NULL NUMBER(6)
 FIRST_NAME                                                     VARCHAR2(20)
 LAST_NAME                                             NOT NULL VARCHAR2(25)
 EMAIL                                                 NOT NULL VARCHAR2(25)
 PHONE_NUMBER                                                   VARCHAR2(20)
 HIRE_DATE                                             NOT NULL DATE
 JOB_ID                                                NOT NULL VARCHAR2(10)
 SALARY                                                         NUMBER(8,2)
 COMMISSION_PCT                                                 NUMBER(2,2)
 MANAGER_ID                                                     NUMBER(6)
 DEPARTMENT_ID                                                  NUMBER(4)

SQL> conn sys/oracle@orclpdb as sysdba
Connected.
SQL> grant create table to oe;

Grant succeeded.

SQL> conn hr/hr@orclpdb
Connected.
SQL> desc user_tables;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 TABLE_NAME                                            NOT NULL VARCHAR2(128)
 TABLESPACE_NAME                                                VARCHAR2(30)
 CLUSTER_NAME                                                   VARCHAR2(128)
 IOT_NAME                                                       VARCHAR2(128)
 STATUS                                                         VARCHAR2(8)
 PCT_FREE                                                       NUMBER
 PCT_USED                                                       NUMBER
 INI_TRANS                                                      NUMBER
 MAX_TRANS                                                      NUMBER
 INITIAL_EXTENT                                                 NUMBER
 NEXT_EXTENT                                                    NUMBER
 MIN_EXTENTS                                                    NUMBER
 MAX_EXTENTS                                                    NUMBER
 PCT_INCREASE                                                   NUMBER
 FREELISTS                                                      NUMBER
 FREELIST_GROUPS                                                NUMBER
 LOGGING                                                        VARCHAR2(3)
 BACKED_UP                                                      VARCHAR2(1)
 NUM_ROWS                                                       NUMBER
 BLOCKS                                                         NUMBER
 EMPTY_BLOCKS                                                   NUMBER
 AVG_SPACE                                                      NUMBER
 CHAIN_CNT                                                      NUMBER
 AVG_ROW_LEN                                                    NUMBER
 AVG_SPACE_FREELIST_BLOCKS                                      NUMBER
 NUM_FREELIST_BLOCKS                                            NUMBER
 DEGREE                                                         VARCHAR2(10)
 INSTANCES                                                      VARCHAR2(10)
 CACHE                                                          VARCHAR2(5)
 TABLE_LOCK                                                     VARCHAR2(8)
 SAMPLE_SIZE                                                    NUMBER
 LAST_ANALYZED                                                  DATE
 PARTITIONED                                                    VARCHAR2(3)
 IOT_TYPE                                                       VARCHAR2(12)
 TEMPORARY                                                      VARCHAR2(1)
 SECONDARY                                                      VARCHAR2(1)
 NESTED                                                         VARCHAR2(3)
 BUFFER_POOL                                                    VARCHAR2(7)
 FLASH_CACHE                                                    VARCHAR2(7)
 CELL_FLASH_CACHE                                               VARCHAR2(7)
 ROW_MOVEMENT                                                   VARCHAR2(8)
 GLOBAL_STATS                                                   VARCHAR2(3)
 USER_STATS                                                     VARCHAR2(3)
 DURATION                                                       VARCHAR2(15)
 SKIP_CORRUPT                                                   VARCHAR2(8)
 MONITORING                                                     VARCHAR2(3)
 CLUSTER_OWNER                                                  VARCHAR2(128)
 DEPENDENCIES                                                   VARCHAR2(8)
 COMPRESSION                                                    VARCHAR2(8)
 COMPRESS_FOR                                                   VARCHAR2(30)
 DROPPED                                                        VARCHAR2(3)
 READ_ONLY                                                      VARCHAR2(3)
 SEGMENT_CREATED                                                VARCHAR2(3)
 RESULT_CACHE                                                   VARCHAR2(7)
 CLUSTERING                                                     VARCHAR2(3)
 ACTIVITY_TRACKING                                              VARCHAR2(23)
 DML_TIMESTAMP                                                  VARCHAR2(25)
 HAS_IDENTITY                                                   VARCHAR2(3)
 CONTAINER_DATA                                                 VARCHAR2(3)
 INMEMORY                                                       VARCHAR2(8)
 INMEMORY_PRIORITY                                              VARCHAR2(8)
 INMEMORY_DISTRIBUTE                                            VARCHAR2(15)
 INMEMORY_COMPRESSION                                           VARCHAR2(17)
 INMEMORY_DUPLICATE                                             VARCHAR2(13)
 DEFAULT_COLLATION                                              VARCHAR2(100)
 DUPLICATED                                                     VARCHAR2(1)
 SHARDED                                                        VARCHAR2(1)
 EXTERNAL                                                       VARCHAR2(3)
 CELLMEMORY                                                     VARCHAR2(24)
 CONTAINERS_DEFAULT                                             VARCHAR2(3)
 CONTAINER_MAP                                                  VARCHAR2(3)
 EXTENDED_DATA_LINK                                             VARCHAR2(3)
 EXTENDED_DATA_LINK_MAP                                         VARCHAR2(3)
 INMEMORY_SERVICE                                               VARCHAR2(12)
 INMEMORY_SERVICE_NAME                                          VARCHAR2(1000)
 CONTAINER_MAP_OBJECT                                           VARCHAR2(3)

SQL> desc all_tables
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 OWNER                                                 NOT NULL VARCHAR2(128)
 TABLE_NAME                                            NOT NULL VARCHAR2(128)
 TABLESPACE_NAME                                                VARCHAR2(30)
 CLUSTER_NAME                                                   VARCHAR2(128)
 IOT_NAME                                                       VARCHAR2(128)
 STATUS                                                         VARCHAR2(8)
 PCT_FREE                                                       NUMBER
 PCT_USED                                                       NUMBER
 INI_TRANS                                                      NUMBER
 MAX_TRANS                                                      NUMBER
 INITIAL_EXTENT                                                 NUMBER
 NEXT_EXTENT                                                    NUMBER
 MIN_EXTENTS                                                    NUMBER
 MAX_EXTENTS                                                    NUMBER
 PCT_INCREASE                                                   NUMBER
 FREELISTS                                                      NUMBER
 FREELIST_GROUPS                                                NUMBER
 LOGGING                                                        VARCHAR2(3)
 BACKED_UP                                                      VARCHAR2(1)
 NUM_ROWS                                                       NUMBER
 BLOCKS                                                         NUMBER
 EMPTY_BLOCKS                                                   NUMBER
 AVG_SPACE                                                      NUMBER
 CHAIN_CNT                                                      NUMBER
 AVG_ROW_LEN                                                    NUMBER
 AVG_SPACE_FREELIST_BLOCKS                                      NUMBER
 NUM_FREELIST_BLOCKS                                            NUMBER
 DEGREE                                                         VARCHAR2(10)
 INSTANCES                                                      VARCHAR2(10)
 CACHE                                                          VARCHAR2(5)
 TABLE_LOCK                                                     VARCHAR2(8)
 SAMPLE_SIZE                                                    NUMBER
 LAST_ANALYZED                                                  DATE
 PARTITIONED                                                    VARCHAR2(3)
 IOT_TYPE                                                       VARCHAR2(12)
 TEMPORARY                                                      VARCHAR2(1)
 SECONDARY                                                      VARCHAR2(1)
 NESTED                                                         VARCHAR2(3)
 BUFFER_POOL                                                    VARCHAR2(7)
 FLASH_CACHE                                                    VARCHAR2(7)
 CELL_FLASH_CACHE                                               VARCHAR2(7)
 ROW_MOVEMENT                                                   VARCHAR2(8)
 GLOBAL_STATS                                                   VARCHAR2(3)
 USER_STATS                                                     VARCHAR2(3)
 DURATION                                                       VARCHAR2(15)
 SKIP_CORRUPT                                                   VARCHAR2(8)
 MONITORING                                                     VARCHAR2(3)
 CLUSTER_OWNER                                                  VARCHAR2(128)
 DEPENDENCIES                                                   VARCHAR2(8)
 COMPRESSION                                                    VARCHAR2(8)
 COMPRESS_FOR                                                   VARCHAR2(30)
 DROPPED                                                        VARCHAR2(3)
 READ_ONLY                                                      VARCHAR2(3)
 SEGMENT_CREATED                                                VARCHAR2(3)
 RESULT_CACHE                                                   VARCHAR2(7)
 CLUSTERING                                                     VARCHAR2(3)
 ACTIVITY_TRACKING                                              VARCHAR2(23)
 DML_TIMESTAMP                                                  VARCHAR2(25)
 HAS_IDENTITY                                                   VARCHAR2(3)
 CONTAINER_DATA                                                 VARCHAR2(3)
 INMEMORY                                                       VARCHAR2(8)
 INMEMORY_PRIORITY                                              VARCHAR2(8)
 INMEMORY_DISTRIBUTE                                            VARCHAR2(15)
 INMEMORY_COMPRESSION                                           VARCHAR2(17)
 INMEMORY_DUPLICATE                                             VARCHAR2(13)
 DEFAULT_COLLATION                                              VARCHAR2(100)
 DUPLICATED                                                     VARCHAR2(1)
 SHARDED                                                        VARCHAR2(1)
 EXTERNAL                                                       VARCHAR2(3)
 CELLMEMORY                                                     VARCHAR2(24)
 CONTAINERS_DEFAULT                                             VARCHAR2(3)
 CONTAINER_MAP                                                  VARCHAR2(3)
 EXTENDED_DATA_LINK                                             VARCHAR2(3)
 EXTENDED_DATA_LINK_MAP                                         VARCHAR2(3)
 INMEMORY_SERVICE                                               VARCHAR2(12)
 INMEMORY_SERVICE_NAME                                          VARCHAR2(1000)
 CONTAINER_MAP_OBJECT                                           VARCHAR2(3)

SQL> show user
USER is "HR"
SQL> conn sys/oracle@orclpdb as sysdba
Connected.
SQL> desc sys.dba_tables
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 OWNER                                                 NOT NULL VARCHAR2(128)
 TABLE_NAME                                            NOT NULL VARCHAR2(128)
 TABLESPACE_NAME                                                VARCHAR2(30)
 CLUSTER_NAME                                                   VARCHAR2(128)
 IOT_NAME                                                       VARCHAR2(128)
 STATUS                                                         VARCHAR2(8)
 PCT_FREE                                                       NUMBER
 PCT_USED                                                       NUMBER
 INI_TRANS                                                      NUMBER
 MAX_TRANS                                                      NUMBER
 INITIAL_EXTENT                                                 NUMBER
 NEXT_EXTENT                                                    NUMBER
 MIN_EXTENTS                                                    NUMBER
 MAX_EXTENTS                                                    NUMBER
 PCT_INCREASE                                                   NUMBER
 FREELISTS                                                      NUMBER
 FREELIST_GROUPS                                                NUMBER
 LOGGING                                                        VARCHAR2(3)
 BACKED_UP                                                      VARCHAR2(1)
 NUM_ROWS                                                       NUMBER
 BLOCKS                                                         NUMBER
 EMPTY_BLOCKS                                                   NUMBER
 AVG_SPACE                                                      NUMBER
 CHAIN_CNT                                                      NUMBER
 AVG_ROW_LEN                                                    NUMBER
 AVG_SPACE_FREELIST_BLOCKS                                      NUMBER
 NUM_FREELIST_BLOCKS                                            NUMBER
 DEGREE                                                         VARCHAR2(10)
 INSTANCES                                                      VARCHAR2(10)
 CACHE                                                          VARCHAR2(5)
 TABLE_LOCK                                                     VARCHAR2(8)
 SAMPLE_SIZE                                                    NUMBER
 LAST_ANALYZED                                                  DATE
 PARTITIONED                                                    VARCHAR2(3)
 IOT_TYPE                                                       VARCHAR2(12)
 TEMPORARY                                                      VARCHAR2(1)
 SECONDARY                                                      VARCHAR2(1)
 NESTED                                                         VARCHAR2(3)
 BUFFER_POOL                                                    VARCHAR2(7)
 FLASH_CACHE                                                    VARCHAR2(7)
 CELL_FLASH_CACHE                                               VARCHAR2(7)
 ROW_MOVEMENT                                                   VARCHAR2(8)
 GLOBAL_STATS                                                   VARCHAR2(3)
 USER_STATS                                                     VARCHAR2(3)
 DURATION                                                       VARCHAR2(15)
 SKIP_CORRUPT                                                   VARCHAR2(8)
 MONITORING                                                     VARCHAR2(3)
 CLUSTER_OWNER                                                  VARCHAR2(128)
 DEPENDENCIES                                                   VARCHAR2(8)
 COMPRESSION                                                    VARCHAR2(8)
 COMPRESS_FOR                                                   VARCHAR2(30)
 DROPPED                                                        VARCHAR2(3)
 READ_ONLY                                                      VARCHAR2(3)
 SEGMENT_CREATED                                                VARCHAR2(3)
 RESULT_CACHE                                                   VARCHAR2(7)
 CLUSTERING                                                     VARCHAR2(3)
 ACTIVITY_TRACKING                                              VARCHAR2(23)
 DML_TIMESTAMP                                                  VARCHAR2(25)
 HAS_IDENTITY                                                   VARCHAR2(3)
 CONTAINER_DATA                                                 VARCHAR2(3)
 INMEMORY                                                       VARCHAR2(8)
 INMEMORY_PRIORITY                                              VARCHAR2(8)
 INMEMORY_DISTRIBUTE                                            VARCHAR2(15)
 INMEMORY_COMPRESSION                                           VARCHAR2(17)
 INMEMORY_DUPLICATE                                             VARCHAR2(13)
 DEFAULT_COLLATION                                              VARCHAR2(100)
 DUPLICATED                                                     VARCHAR2(1)
 SHARDED                                                        VARCHAR2(1)
 EXTERNAL                                                       VARCHAR2(3)
 CELLMEMORY                                                     VARCHAR2(24)
 CONTAINERS_DEFAULT                                             VARCHAR2(3)
 CONTAINER_MAP                                                  VARCHAR2(3)
 EXTENDED_DATA_LINK                                             VARCHAR2(3)
 EXTENDED_DATA_LINK_MAP                                         VARCHAR2(3)
 INMEMORY_SERVICE                                               VARCHAR2(12)
 INMEMORY_SERVICE_NAME                                          VARCHAR2(1000)
 CONTAINER_MAP_OBJECT                                           VARCHAR2(3)

SQL> select * from tab where tname like 'V_$%';

TNAME                          TABTYPE  CLUSTERID                                                   
------------------------------ ------- ----------                                                   
V_$ACCESS                      VIEW                                                                 
V_$ACTIVE_INSTANCES            VIEW                                                                 
V_$ACTIVE_SERVICES             VIEW                                                                 

SQL>  connect oe/oe@orclpdb
Connected.
SQL> conn sys/oracle@orclpdb as sysdba
Connected.
SQL> GRANT create any table TO oe;

Grant succeeded.

SQL> GRANT create table TO oe;

Grant succeeded.

SQL> grant update (salary) on hr.employees to oe;

Grant succeeded.

SQL> REVOKE update on hr.employees FROM oe;

Revoke succeeded.

SQL> REVOKE update(SALARY) on hr.employees FROM oe;
REVOKE update(SALARY) on hr.employees FROM oe
             *
ERROR at line 1:
ORA-01750: UPDATE/REFERENCES may only be REVOKEd from the whole table, not by column 


SQL> spool off
