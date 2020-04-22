--La: LAB-02B
--Name: Trevor Shortidge
--ID: 006310209











--line size is how many you can fit on a single row. was a issue running some of our questions
set linesize 125
set pages 200
SPOOL lab02BOutput_trevor.txt

--providing the list of names that are available for owner HR
SELECT table_name
	FROM all_tables
	WHERE owner = 'HR';

--Listing the attributes of said lists	
DESC HR.regions
DESC HR.locations
DESC HR.departments
DESC HR.jobs
DESC HR.employees
DESC HR.job_history
DESC HR.countries

--Displaying from HR.jobs and adding computation for the delta max-min
SELECT job_id, job_title, max_salary, min_salary, (max_salary - min_salary) Difference
	FROM HR.jobs;

COLUMN employee_ID FORMAT 000000
--Displaying from HR.employees and combining first and last name together and calculating how long the employee has been with us
SELECT employee_ID, last_name||', '||first_name AS "FULL NAME",hire_date,((sysdate - hire_date)/(365))YEARS_EMPLOYED, salary
	FROM HR.employees;

--Counting the number of employees we have
SELECT COUNT(employee_ID)
	FROM HR.employees;
--Displaying the companies unique salaries we have
SELECT DISTINCT salary
	FROM HR.employees;
--Counting how many disctinct salaries the company has
SELECT COUNT(DISTINCT salary)
	FROM HR.employees;


SPOOL off
