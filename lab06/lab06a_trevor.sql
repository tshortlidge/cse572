--Trevor Shortlidge
--CSE572-Lab06A

set linesize 100
set pagesize 100
SPOOL lab06AOutput_trevor.txt

-- List employees whose salaries are at least the same salary of
--employee with ID = 201
SELECT employee_ID, first_name, last_name, salary
FROM HR.employees
WHERE salary >=
(SELECT salary FROM HR.employees
WHERE employee_ID = '201');

-- List employees(id, first name, last name, salary, job id) whose
--salaries are at least the maximum salary of employees with “ITPRO” job title
SELECT employee_ID, first_name, last_name, salary
FROM HR.employees
WHERE salary >= ALL
(SELECT salary FROM HR.employees
WHERE Job_ID = 'IT_PROG')
ORDER BY employee_ID;

-- Equivalent
SELECT employee_ID, first_name, last_name, salary, Job_ID
FROM HR.employees
WHERE salary >=
(SELECT MAX(salary) FROM HR.employees
WHERE Job_ID = 'IT_PROG')
ORDER BY employee_ID;

--List supervisors (employee id, first name, last name, salary)
--whose salary is at most as large as the average salary among
--all employees
SELECT employee_ID, first_name, last_name, salary
FROM HR.employees
WHERE employee_ID IN
(SELECT manager_ID FROM HR.employees)
AND salary <= (SELECT AVG(salary) FROM HR.employees );

-- List of employees (employee id, first name, lastname, dept
--id, salary) who earn the lowest salary
SELECT employee_ID, first_name, last_name, department_iD,
salary
FROM HR.employees
WHERE salary = (SELECT MIN(salary) FROM HR.employees );

-- List employees who are supervisors
SELECT employee_ID, first_name, last_name
FROM HR.employees
WHERE employee_ID IN
(SELECT DISTINCT manager_ID FROM HR.employees);

-- Fail to List employees who are not supervisors
SELECT employee_ID, first_name, last_name
FROM HR.employees
WHERE employee_ID NOT IN
(SELECT DISTINCT manager_ID FROM HR.employees);

-- List employees who are not supervisors
SELECT employee_ID, first_name, last_name
FROM HR.employees
WHERE employee_ID NOT IN
(SELECT DISTINCT manager_ID FROM HR.employees
WHERE manager_ID IS NOT NULL);

-- Produce statistics
SELECT COUNT(*), MIN(salary), MAX(salary), AVG(salary),
SUM(salary)
FROM HR.employees;

-- List employees whose salaries are at most equal to the
--average salary in the company
SELECT employee_ID, first_name, last_name, salary
FROM HR.employees
WHERE salary <=
(SELECT AVG(salary) FROM HR.employees );
-- List employees whose salaries are at least equal to the
--maximum salary of employees with "IT-PRO" job
SELECT employee_ID, first_name, last_name, salary, Job_ID
FROM HR.employees
WHERE salary >=
(SELECT MAX(salary) FROM HR.employees
WHERE Job_ID = 'IT_PROG')
ORDER BY employee_ID;

-- List the salary statistics (total no of employees,
--min/max/average salary) for each department
SELECT department_ID, count(*), MIN(salary), MAX(salary),
AVG(salary)
FROM HR.employees
GROUP BY department_ID;

-- For each department (except department id 100) whose
--minimum salary is less than 8000, list the department id,
--minimum salary and maximum salary
SELECT department_ID, count(*), MIN(salary), MAX(salary)
FROM HR.employees WHERE department_ID <> 100
GROUP BY department_ID
HAVING MIN(salary) < 8000;

-- For each department whose minimum salary is at least the
--same as the minimum salary of employees in Dept 100, list the
--department id, the number of employees in the dept, and
--salary statistics – minimum/maximum/average salary
SELECT department_ID, count(*), MIN(salary), MAX(salary),
AVG(salary) FROM HR.employees
GROUP BY department_ID HAVING MIN(salary) >=
( SELECT MIN(salary) FROM HR.employees
WHERE department_id = 100);

-- List employees (first and last names, department they work
--for, salary) who earn the lowest salary in their respective
--departments
SELECT first_name, last_name, department_iD, salary
FROM HR.employees a
WHERE salary IN
(SELECT MIN(salary) FROM HR.employees b
GROUP by department_iD
HAVING a.department_iD = b.department_iD );









SPOOL off
