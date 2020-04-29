--name: Trevor Shortlidge
--lab: 04_A

set linesize 100
set pagesize 100

SPOOL lab04AOutput_trevor.txt

--SELECT employee with the same first_name
SELECT employee_ID, first_name, last_name, salary
	FROM HR.employees
	WHERE UPPER(first_name) = 'DAVID';

--Using Dummy table : DUAL
SELECT LOWER('SQL Course')
	FROM DUAL;

-- LENGTH(‘Sqlplus’) : 7
SELECT LENGTH('Sqlplus')
	FROM DUAL;

-- INSTR(‘Sqlplus’,’l’,3,2) : 5
SELECT INSTR('Sqlplus','l',3,2)
	FROM DUAL;

-- LPAD(24000,10,’*’) : *****24000
SELECT LPAD(24000,10,'*')
	FROM DUAL;

SELECT RPAD(24000,10,'*')
	FROM DUAL;

-- TRIM(‘L’ FROM ‘Loyal’) : oyal
SELECT TRIM('L' FROM 'Loyal')
	FROM DUAL;

-- REPLACE ('Hello home','h','H') : hello home
SELECT REPLACE ('Hello home','h','H')
	FROM DUAL;

--ROUND(45.936,2) : 45.94
SELECT ROUND(45.936,2)
	FROM DUAL;

--TRUNC(45.936,2) : 45.93
SELECT TRUNC(45.936,2)
	FROM DUAL;

-- MOD(5,3) : 2
SELECT MOD(5,3)
	FROM DUAL;

-- list employees and days being hired
SELECT employee_ID, first_name, last_name,
	SYSDATE - hire_date AS Days_Hired
	FROM HR.employees
	WHERE job_id = 'IT_PROG';

-- List programmers and months being hired
SELECT employee_ID, first_name, last_name,
	ROUND(MONTHS_BETWEEN ( SYSDATE, hire_date))
	AS Months_Hired
	FROM HR.employees
	WHERE job_id = 'IT_PROG';

-- Add 6 months
SELECT ADD_MONTHS('11-JAN-96',6)
	FROM DUAL;

-- get date of next FRIDAY
SELECT NEXT_DAY('01-SEP-95','FRIDAY')
	FROM DUAL;

-- get last date of the month
SELECT LAST_DAY('01-FEB-95')
	FROM DUAL;

-- get first date of the nearest month
SELECT ROUND(SYSDATE,'MONTH')
	FROM DUAL;

-- get first date of the current year
SELECT TRUNC(SYSDATE,'YEAR')
	FROM DUAL;

-- show today’s date
SELECT TO_CHAR(SYSDATE, 'DAY DD MON, YYYY')
	FROM DUAL; 

--list employees who first name is David, and salaries
SELECT first_name, last_name, TO_CHAR(salary,'L9,999,999.00')
	FROM HR.employees
	WHERE UPPER(first_name) = 'DAVID';

-- List programmers and months being hired
SELECT employee_ID, first_name, last_name,
	ROUND(MONTHS_BETWEEN ( SYSDATE, hire_date),0) AS
	Months_Hired
	FROM HR.employees
	WHERE job_id = 'IT_PROG';



SPOOL off
