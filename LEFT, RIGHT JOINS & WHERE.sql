/* LEFT JOIN
allows us to see al records from the table on the left side of the JOIN,
including all matching rows of the two tables.
 */
 
# remove the duplicates from the two tables
DELETE FROM dept_manager_dup 
WHERE
    emp_no = '110228';
    
DELETE FROM departments_dup 
WHERE
    dept_no = 'd009';
    
# add back the initial records
INSERT INTO dept_manager_dup
VALUES ('110228','d003','1992-03-21','9999-01-01');

INSERT INTO departments_dup
VALUES ('d009','Customer Service');

# LEFT JOIN
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

## Change order of tables - LEFT JOIN = LEFT OUTER JOIN
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT OUTER JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    dept_name IS NULL
ORDER BY m.dept_no;

/* Join the 'employees' and the 'dept_manager' tables to return a subset of all 
the employees whose last name is Markovitch. See if the output contains a manager with that name. */
SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'  
ORDER BY dm.dept_no DESC, e.emp_no;

/* RIGHT JOIN
RIGHT JOIN - RIGHT OUTER JOIN
*/

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
	departments_dup d
        RIGHT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- OLD JOIN SYNTAX - WHERE JOIN or WHERE gives identical output, WHERE is more time consuimh
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    departments_dup d
WHERE
    m.dept_no = d.dept_no
ORDER BY m.dept_no;

/* 
Extract a list containing information about all managers' employee number, 
first and last name, department number, and hire date. Use the old type of join syntax to obtain the result. 
*/
SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    dept_manager m,
    employees e
WHERE
    e.emp_no = m.emp_no
ORDER BY m.dept_no;

/* JOIN and WHERE together */
SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000;
    
/* 
Select the first and last name, the hire date, and the job title of all employees 
    whose first name is "Margareta" and have the last name "Markovitch". 
*/
SELECT 
   e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON t.emp_no = e.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;
