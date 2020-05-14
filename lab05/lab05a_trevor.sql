--Name:Trevor Shortlidge
--ID: 006310209
--Lab05-A
set linesize 200
set pagesize 200

SPOOL lab05AOutput_trevor.txt


-- Cartesian join - no join condition
SELECT employee_ID, first_name, last_name,
department_name
FROM HR.employees, HR.departments;

-- List employees, who are assigned to departments
SELECT employee_id, first_name, last_name,
HR.employees.department_id, department_name
FROM HR.employees, HR.departments
WHERE HR.employees.department_id =
HR.departments.department_id;

-- join three tables to list employees, department names and locations
SELECT e.employee_id, e.first_name, e.last_name,
d.department_name, l.city
FROM HR.employees e, HR.departments d, HR.locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND e.department_id IN (80,90);

-- List employees whose salaries are in salary ranges of job titles
SELECT e.first_name, e.last_name, e.salary, j.job_id,
j.min_salary, j.min_salary
FROM HR.employees e, HR.jobS j
WHERE e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY e.first_name, e.last_name;

-- Inner join excludes employees not having department_id,
SELECT e.first_name, e.last_name, e.department_id,
d.department_name
FROM HR.employees e, HR.departments d
WHERE e.department_id = d.department_id;

-- Outer Join list all employees
SELECT e.first_name, e.last_name, e.department_id,
d.department_name
FROM HR.employees e, HR.departments d
WHERE e.department_id = d.department_id (+)
ORDER BY e.first_name, e.last_name;

-- Equivalent left join
SELECT e.first_name, e.last_name, e.department_id,
d.department_name
FROM HR.employees e
LEFT JOIN HR.departments d
ON e.department_id = d.department_id
ORDER BY e.first_name, e.last_name;

-- List employees and their managers
SELECT e.first_name, e.last_name, m.last_name Manager
FROM HR.employees e, HR.employees m
WHERE e.manager_id = m.employee_id;

--CROSS JOIN returns CARTISEAN PRODUCT
SELECT employee_ID, first_name, last_name, department_name
FROM HR.employees CROSS JOIN HR.departments;

-- list employees whose supervisors are also department mangers
SELECT e.employee_ID, e.last_name, e.last_name,
d.department_name
FROM HR.employees e, HR.departments d
WHERE e.department_id = d.department_id
AND e.manager_id = d.manager_id;

-- Using NATURAL JOIN
SELECT employee_ID, first_name, last_name, department_name
FROM HR.employees NATURAL JOIN HR.departments;

-- List employees, who are assigned to departments
SELECT employee_ID, first_name, last_name, department_name
FROM HR.employees
JOIN HR.departments USING ( department_id );

-- List employees using ON condition
SELECT employee_ID, first_name, last_name, department_name
FROM HR.employees e
JOIN HR.departments d
ON e.department_id = d.department_id ;

-- List employees, their department names and locations
SELECT e.employee_ID, e.first_name, e.last_name,
d.department_name, l.city
FROM HR.employees e
JOIN HR.departments d
ON e.department_id = d.department_id
JOIN HR.locations l
ON d.location_id = l.location_id;

-- List all employees and their departments if any
SELECT first_name, last_name, department_id, department_name
FROM HR.employees
LEFT OUTER JOIN HR.departments
USING ( department_id );

-- List all departments and their employees if any
SELECT first_name, last_name, department_id, department_name
FROM HR.employees
RIGHT OUTER JOIN HR.departments
USING ( department_id );

-- List employees’ names and their departments of all employees
-- and of all departments
SELECT first_name, last_name, d.department_name
FROM HR.employees e
FULL OUTER JOIN HR.departments d
ON e.department_id = d.department_id;

SPOOL off
