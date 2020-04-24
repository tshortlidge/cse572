set linesize 132

SPOOL lab03BOutput_trevor.txt



--Problem 1 
--Selects only employees over 15 years tenure
SELECT department_ID, employee_ID, first_name, last_name,hire_date, (SYSDATE-hire_date)/365 years_service
	FROM HR.employees
	WHERE (SYSDATE-hire_date)/365 > 15
	ORDER BY department_ID,employee_ID;

--Problem 2
--Selects from to departments and years service over 15 years
SELECT department_ID, employee_ID, first_name, last_name,hire_date, (SYSDATE-hire_date)/365 years_service
	FROM HR.employees
	WHERE (SYSDATE-hire_date)/365 > 15 AND department_ID IN (100,110)
	ORDER BY department_ID,employee_ID;

--Problem 3
--Orders the hire date in ascending also provides hire dates before date shown
SELECT department_ID, employee_ID, first_name, last_name,hire_date, (SYSDATE-hire_date)/365 years_service
	FROM HR.employees
	WHERE ((SYSDATE - hire_date )/365) > ((SYSDATE - TO_DATE('01-01-2008','DD-MM-YYYY'))/365)
	ORDER BY hire_date ASC;

--Problem 4
--Displays problem 4 and gets employees that make less than 10000 and the hire date is more than 15 years
SELECT department_ID, employee_ID, first_name, last_name,hire_date,salary, (SYSDATE-hire_date)/365 years_service
	FROM HR.employees
	WHERE (SYSDATE-hire_date)/365 > 15 AND salary < 10000
	ORDER BY last_name,first_name;

--Problem 5
--Displays the total # of employees as well as the max and min salary
SELECT  COUNT(*) AS "Total Employees", MAX(salary),MIN(salary)
	FROM HR.employees;

--Problem 6
--Displays uniques jobs in order
SELECT DISTINCT job_id
	FROM HR.employees
	ORDER BY job_id ASC;

--Problem7
SELECT first_name
	FROM HR.employees
	WHERE first_name LIKE 'D%' AND LENGTH(first_name) > 6;

--Problem8
SELECT UPPER(last_name),UPPER(first_name),job_id
	FROM HR.employees
	WHERE job_id LIKE 'IT_%';

--Problem9
SELECT DISTINCT salary
	FROM HR.employees
	WHERE salary >= 10000
	ORDER BY salary;

--Problem 10
SELECT employee_ID, start_date, end_date, job_ID, department_ID, (SYSDATE-start_date)/365 years_service
	FROM HR.job_history
	ORDER BY employee_ID, start_date;


SPOOL off

