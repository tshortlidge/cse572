--Name: Trevor Shortlidge
--ID: 006310209
--Lab 04B-Query SQLPLUS

set linesize 200
set pagesize 200

SPOOL lab04BOutput_trevor.txt

--P.1 Write a query to display the current System date. Label the column Date.
SELECT sysdate "Date"
FROM DUAL;

--P.2 . Display employee ID, last name, first name, commission point for employees who have commission
--      Sort the result in order of commission
SELECT employee_ID, last_name, first_name,commission_pct
FROM HR.employees
WHERE NOT commission_pct = 0
ORDER BY commission_pct DESC;

--P.3 Display employee ID, last name, first name, salary, and salary increased by 15% as a whole number
--      for employees whose salaries are greater or equal $10,000. Label the column New Salary. Salary is
--      printed in currency format. For example, $24,000.00. Sort the results by employee ID.

SELECT employee_ID,last_name,first_name,salary,(TO_CHAR(ROUND(salary*1.15,0),'$99,999')) "New_Salary"
FROM HR.employees
WHERE salary >= 10000;

--P.4 Write a query that displays employee’s last name, with the first letter capitalized, and all other
--      letters lowercase, length of the last names for all employees whose name starts with letter J, A or
--      M. Sort the results by employees’ last name

SELECT INITCAP(last_name)
FROM HR.employees
WHERE last_name LIKE '%J%' OR last_name LIKE '%A%' OR last_name LIKE '%M%';

--P.5 Display the employees’ last name, and calculate the number of months between today and the date
--      the employee was hired of employees whose job ID ends with MGR or MAN. Label the column as
--      MONTHS_WORKED. Order the results by the months employed. Round the number of months up to
--      the closest whole number

SELECT last_name, ROUND((SYSDATE - hire_date),0) AS MONTHS_WORKED
FROM HR.employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%MAN%'
ORDER BY MONTHS_WORKED DESC;


--P.6 Display last name and salary of all employees whose job-ID is ‘IT_PROG, and salary greater or equal
--      3000. Format the salary to be 15 characters long, left-padded with $. For example,
--      $$$$$$$$$$24000. Label the column SALARY. Sort the result by salary.

SELECT last_name, LPAD(SALARY,15,'$')
FROM HR.employees
WHERE SALARY >= 3000
ORDER BY SALARY DESC;

--P.7 Displays employee’s last name, first name, and bonus is computed by salary * commission and in
--      currency format for employees in departments 80 and 90 . If an employee does not earn any
--      commission, put “No Bonus”. Label the column BONUS. Sort the results in order of last name, and
--      then first name.

SELECT last_name, first_name, NVL2(commission_pct, TO_CHAR(salary*commission_pct,'$9,999,999.00'),'NO BONUS')
FROM HR.employees
WHERE department_id BETWEEN 80 AND 90
ORDER BY last_name,first_name; 

--P.8 Using DECODE function, displays last name, first name, Job_ID, and the grade of all employees based
--      on the value of the column JOB_ID, as per the following data for employees whose salaries are
--      greater or equal 10,000. Sort the results by grade

SELECT last_name,first_name,job_id, DECODE(job_id,'AD_PRES','A','ST_MAN','B','IT_PROG','C','SA_REP','D','ST_CLERK','D','NA') GRADE
FROM HR.employees
WHERE SALARY >= 10000
ORDER BY GRADE;

--P.9 Write the query for question #7 using CASE syntax

SELECT last_name,first_name,job_id, CASE WHEN commission_pct is null THEN 'NO BONUS' ELSE TO_CHAR(salary*commission_pct,'$9,999,999.00') END AS BONUS 
FROM HR.employees
WHERE department_id BETWEEN 80 AND 90
ORDER BY last_name, first_name;



SPOOL off

