SELECT 
    d.dept_name, AVG(salary) AS avg_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY d.dept_no
;


SELECT 
    d.dept_name, AVG(salary) AS avg_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY avg_salary DESC
;

SELECT 
    d.dept_name, AVG(salary) AS avg_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING avg_salary > 60000
ORDER BY avg_salary DESC
;

/*
How many male and how many female managers do we have in the "employees" database?
*/
SELECT 
    e.gender, COUNT(dm.emp_no) AS count_managers
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

/* UNION VS UNION ALL */
drop table if exists employees_dup; 
CREATE TABLE employees_dup (
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

-- duplicate the structure of the employees table
INSERT INTO employees_dup 
SELECT 
	e.* 
FROM 
	employees e 
LIMIT 20;

SELECT 
    *
FROM
    employees_dup;
    
-- insert a duplicate of the first row
INSERT INTO employees_dup VALUES ('10001','1953-09-02','Georgi','Facello','M','1986-06-26');

SELECT 
    *
FROM
    employees_dup;
    
/* UNION  vs UNION ALL
UNION ALL - used to combine a few SELECT statements in a single output
to unify tables
*/
SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
	employees_dup e
WHERE
	e.emp_no = 10001
UNION ALL SELECT
	NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
	dept_manager m;
    
SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
	employees_dup e
WHERE
	e.emp_no = 10001
UNION SELECT
	NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
	dept_manager m;
    
# when uniting two identically organized tables, UNION displays only distinct values in the output
## UNION ALL retrieves the duolicates as well
## UNION uses more MySQL resources, more storage

# UNION is for better results
# UNION ALL is for optimizing performance

/*
Go forward to the solution and execute the query. What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)
*/
SELECT
    *
FROM
    (SELECT
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY -a.emp_no DESC;