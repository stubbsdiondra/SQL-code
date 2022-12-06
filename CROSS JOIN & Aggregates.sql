/* CROSS JOIN
takes the values from a certain table and connects them with all the values from
the tables we want to join it with
connects all the values, not just those that match
 the Cartesian product of two or more sets
*/
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT # same output as cross join
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no; # CROSS JOIN is the best practice for clarity

SELECT # same output as cross join
    dm.*, d.*
FROM
    dept_manager dm
		JOIN # also same if INNER JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
	d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

# JOIN = ON clause = CROSS JOIN + WHERE

/* can CROSS JOIN more than 2 tables but becareful cause can have too many rows */
SELECT 
    e.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
        JOIN
    employees e ON dm.emp_no = e.emp_no
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

/* Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9. */
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;

/* Return a list with the first 10 employees with all the departments they can be assigned to. */
SELECT
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;

/*
Aggregate Functions with JOINS
*/
SELECT 
    e.gender, AVG(s.salary) AS avg_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;

# joining more than 2 tables, handling with care 
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d 
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    employees e ON m.emp_no = e.emp_no;

/* Select all managers' first and last name, hire date, job title, start date, and department name. */
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
order by e.emp_no;