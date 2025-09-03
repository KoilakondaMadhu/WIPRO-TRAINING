load data
infile emp.dat
badfile emp.bad 
DISCARDFILE emp.dsc
truncate
into table deptmadhu
when iden= 'D'
fields terminated by "," optionally enclosed by '"'
trailing nullcols
(
iden filler position(1),
DEPARTMENT_ID,     
DEPARTMENT_NAME, 
MANAGER_ID,      
LOCATION_ID     
)
into table jobmadhu
when iden= 'J'
fields terminated by "," optionally enclosed by '"'
trailing nullcols
(
iden filler position(1),
JOB_ID,
JOB_TITLE,
MIN_SALARY,
MAX_SALARY
)
into table empmadhu
when iden= 'E'
fields terminated by "," optionally enclosed by '"'
trailing nullcols
(
iden filler position(1),
EMPLOYEE_ID, 
FIRST_NAME,  
LAST_NAME,   
EMAIL   ,    
PHONE_NUMBER,
HIRE_DATE,
JOB_ID,      
SALARY,     
COMMISSION_PCT, 
MANAGER_ID,     
DEPARTMENT_ID  
)
