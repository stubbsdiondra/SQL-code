/* JOINS
SQL tool that allow us to construct a relationship between objects
A JOIN shows a result set, containing fields derived from two or more tables
1. must find a related column from thw two tables that contains the same type of data
INNER JOIN()
*/

/* departments_dup table
If you don’t currently have the ‘departments_dup’ table set up, create it. 
Let it contain two columns: dept_no and dept_name. Let the data type of dept_no be CHAR of 4, 
and the data type of dept_name be VARCHAR of 40. Both columns are allowed to have null values. 
Finally, insert the information contained in ‘departments’ into ‘departments_dup’.
*/

CREATE TABLE departments_dup
(
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

INSERT INTO departments_dup
(
    dept_no,
    dept_name
) SELECT
                *
FROM
                departments;

# Then, insert a record whose department name is “Public Relations”.
INSERT INTO departments_dup (dept_name)
VALUES      ('Public Relations');

 
# Delete the record(s) related to department number two.
DELETE FROM departments_dup
WHERE
    dept_no = 'd002'; 

# Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');


# dept_manager_dup

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );

INSERT INTO dept_manager_dup
SELECT * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                (999904, '2017-01-01'),
                            (999905, '2017-01-01'),
                            (999906, '2017-01-01'),
                            (999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)
VALUES               ('Public Relations');

DELETE FROM departments_dup
WHERE
    dept_no = 'd002'; 
    
/* INNER JOIN 

 SELECT
	t1.column_name, t2.column_name
 FROM
	table_1 t1 (don't need to use AS)
 JOIN
	table_2 t2 on t1.column_name = t2.column_name; 
    
t1 & t2 name columns
*/

# dept_manager_dup
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

# departments_dup
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

# doing an inner join on departments_dup and dept_manager)dup
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

/* 
INNER JOINs extract only records in which the values in the related columns match
NULL values  or values appearing in just one of the two tables are not displayed 
do not present null values, dropped 6 rows
*/

/* Extract a list containing information about all managers' employee number, first and last name, department number, and hire date. */
SELECT 
    *
FROM
    employees
ORDER BY emp_no;

select m.emp_no, m.dept_no, e.first_name, e.last_name, m.dept_no, e.hire_date FROM
    dept_manager_dup m
        INNER JOIN
    employees e ON m.emp_no = e.emp_no
ORDER BY e.emp_no;


/* INNER JOIN = JOIN INNER JOIN is the default */
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;


/* Duplicate records (duplicate rows) are identical rows in an SQL table 
duplicate records */
INSERT INTO dept_manager_dup
VALUES ('110228','d003','1992-03-21','9999-01-01');

INSERT INTO departments_dup
VALUES ('d009','Customer Service');

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no ASC;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

# how to handle duplicates 

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;