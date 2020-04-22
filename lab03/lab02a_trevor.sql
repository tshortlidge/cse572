--lab: lab 02-A
--Name: Trevor Shortlidge



--set 75 characters per line
SET linesize 75

--output queries result to text file
SPOOL lab02AOutput_trevor.txt

--you will enter all SQL statements you have successfully practiced here,
--outputs to prompt 


--finds available tables from HR user
SELECT table_name
	FROM all_tables
	WHERE owner = 'HR';


--Describes attributes of jobs table
DESC HR.jobs;


--List all columns
SELECT *
	FROM HR.jobs;


--List specific columns
SELECT job_id, job_title
	FROM HR.jobs;



--simple column alias 
SELECT job_title, min_salary Minimum_AS Salary
	FROM HR.jobs;


--Column Alias
SELECT job_title, min_salary*1.2 "120% Minimum Salary"
	FROM HR.jobs;

SELECT job_title, min_salary*12 + 2000 New_Minimum
	FROM HR.jobs;

SELECT job_title, (min_salary+max_salary)/2 Average_Salary
	FROM HR.jobs;

--SELECT * | { [DISTINCT] column | expression [Alias],… }
--	FROM table;

SELECT last_name, salary, commission_pct
	FROM HR.employees;

SELECT last_name, salary, 12*salary*commission_pct
	FROM HR.employees;

SELECT job_title || min_salary AS "Job Title Min Salary "
	FROM HR.jobs;

SELECT job_id || ',' ||job_title AS "Job ID, Title "
	FROM HR.jobs;

SELECT min_salary
	FROM HR.jobs;

SELECT DISTINCT min_salary
	FROM HR.jobs;



--each SQL query has at least one comment line to describe what the query 
--is expected to produce
--for example
--list available tables from HR usere

SELECT table_name
	FROM all_tables
	WHERE owner = 'HR';
--stop sending output to the file
SPOOL off
