/* Aggregate Functions
COUNT(), SUM(), MIN(), MAX(), AVG()
also referred to as summarizing functions
*/

-- Count is application to numeric and non-numeric data
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    COUNT(salary)
FROM
    salaries;
    
-- COUNT(DISTINCT)
-- How many employee start dates are in the database?
SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;

-- COUNT(*) includes the nulls
-- leave no spaces between aggregate function and ()
SELECT 
    COUNT(*)
FROM
    salaries;
    
-- How many departments are there in the "employees" database?
SELECT 
   *
FROM
    dept_emp;
    
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
/* SUM() */

SELECT 
    SUM(salary)
FROM
    salaries;
    
SELECT 
    SUM(*)
FROM
    salaries;

/* What is the total amount of money spent on salaries for 
all contracts starting after the 1st of January 1997? 
*/
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01'

/* 
MAX() and MIN() 
MAX() - returns the maximum valuse of a column'
MIN() - returns the minimum value of a column
*/

# Which is the highest salary we offer?

SELECT 
    MAX(salary)
FROM
    salaries;
    
# Which is the lowest salary we offer?

SELECT 
    MIN(salary)
FROM
    salaries;
    
# 1. Which is the lowest employee number in the database?
SELECT 
    MIN(emp_no)
FROM
    employees;

# 2. Which is the highest employee number in the database?
SELECT 
    MAX(emp_no)
FROM
    employees;
    
/* AVG() 
extracts the average value of all non-null values in a field 
AVERAGE() doesnt work
*/

# Which is the average annual salary the company's employee received?
SELECT 
    AVG(salary)
FROM
    salaries; # you can round this, see below
    
# What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

/* ROUND()
ROUND() - numeric, or math, function you can use
usually applied to the single values that aggregate functions return
*/

/* ROUND() - rounds to the closest integer
ROUND(#, decimal_places) */

SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries;

# Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents

SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
/* COALESCE() & IF NULL()
They are used when null values are dispersed in your data table and you would like to substitute the null values with another value.
- */
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL; 

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

SELECT
*
FROM
departments_dup
ORDER BY dept_no ASC;

/* The next adjustment we’ll have to make is adding a third column
called “Department manager”. It will indicate the manager of the
respective department. For now, we will leave it empty, and will add
the NULL constraint. Finally, we will place it next to the
“Department name” column by typing “AFTER “Department name”. */

ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

SELECT
*
FROM
departments_dup
ORDER BY dept_no ASC;

COMMIT;

SELECT
*
FROM
departments_dup
ORDER BY dept_no;

/* IFNULL() 
IFNULL(expression_1, expression_2)
cannot contain more than 2 parameters, with coalesce you can
*/

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
    
/* COALESCE()
COALESCE(expression_1, expression,...,expression_n)
allows you to insert N arguments in the parameters
COALESCE() is IFNULL() with > 2 parameters
Will always return a single value of the ones we have within parenthesis, and this values will be the fiest
non-null values of this list, reading the values from left to right
*/
SELECT 
    dept_no,
    COALESCE(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;

SELECT
*
FROM
departments_dup
ORDER BY dept_no;

SELECT
dept_no,
dept_name,
COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
departments_dup
ORDER BY dept_no ASC;

/* IFNULL() and COALESCE() do not make any changes to the dataset. 
They create an output where certain data values appers in place of NULL values.

COALESCE() can also have a single argument in a given function 
can help you visualize a prototype of the table's final version
*/

SELECT 
    dept_no,
    dept_name,
    COALESCE('department manager name') AS fake_col
FROM
    departments_dup;
    
/* IFNULL() works precisely with two arguments 

COALESCE() can have one, two, or more arguments
*/

/* Select the department number and name from the ‘departments_dup’ table and add a 
third column where you name the department number (‘dept_no’) as ‘dept_info’. 
If ‘dept_no’ does not have a value, use ‘dept_name’.
*/
SELECT 
    dept_no, dept_name, COALESCE(dept_no) AS dept_info
FROM
    departments_dup;
    
/* Modify the code obtained from the previous exercise in the following way. 
Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ 
is displayed whenever a department number has no value, and ‘Department name not provided’ 
is shown if there is no value for ‘dept_name’.
*/
SELECT 
    dept_no,
    dept_name,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    IFNULL(dept_no, 'N/A') AS dept_info,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;
