--Trevor Shortlidge
--CSE572-LAB-06B


SPOOL lab06BOutput_trevor.txt

--1
SELECT employee_ID, last_name, hire_date
FROM HR.employees
WHERE department_ID = (SELECT department_ID FROM HR.employees
WHERE last_name = 'Zlotkey')
ORDER BY employee_ID ASC;

--2
SELECT employee_ID, last_name
FROM HR.employees
WHERE salary NOT IN (SELECT AVG(salary) FROM HR.employees)
ORDER BY salary, employee_ID;


--3
SELECT e.employee_ID, e.last_name
FROM HR.employees e, HR.departments d
WHERE e.department_ID = d.department_ID AND d.location_ID = 1700;

--4 
SELECT e.employee_ID, e.last_name, e.JOB_ID
FROM HR.employees e, HR.departments d
WHERE d.manager_id = 100 OR d.manager_id = 156;


--5

SELECT employee_ID, last_name, job_ID
FROM HR.employees, HR.departments d
WHERE d.department_name = 'Executive';


--6
SELECT department_ID , COUNT(employee_ID) ,
AVG(salary), MIN(salary) , MAX(salary), SUM(salary)
FROM HR.employees
WHERE department_ID is NOT NULL
GROUP BY department_ID
ORDER BY AVG(salary);

--7
SELECT department_ID, COUNT(employee_ID),
AVG(salary), MIN(salary), MAX(salary), SUM(salary)
FROM HR.employees
WHERE department_ID > 50 AND department_ID < 100
GROUP BY department_ID
ORDER BY department_ID;

--8
SELECT job_ID, COUNT(employee_ID), AVG(salary), MIN(salary),
MAX(salary)
FROM HR.employees
GROUP BY job_ID
ORDER BY job_ID ASC;

--9
SELECT job_ID, COUNT(employee_ID), AVG(salary), MIN(salary), MAX(salary)
FROM HR.employees
GROUP BY job_ID
HAVING AVG(salary) > 5000
ORDER BY job_ID;

SPOOL off
