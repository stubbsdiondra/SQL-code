/* HAVING, WHERE VS HAVING
LIMIT
*/

# HAVING
## is like where but applied to the grouo by block 
## must come between GROUP BY and ORDER BY
## CANNOT USE AGGREGATE FUNCTIONS WITH WHERE BY YOU CAN WITH HAVING
SELECT 
    *
FROM
    employees
HAVING
    hire_date >= '2000-01-01';
    
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

/* Select all employees whose average salary is higher than $120,000 per annum.
*/
SELECT
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;


# WHERE VS HAVING
## WHERE - allows us to set conditions that refer to subsets
## agg functions must go with HAVING
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

## cannot have both and aggregated and non-aggregated in a HAVING clause
## Aggregate Functions - GROUP BY and HAVING
## General conditioons - WHERE

/*
Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
*/
select * from dept_emp;

SELECT
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

# LIMIT - goes at the end
SELECT 
    *
FROM
    salaries;

## please show me the employee numbers of the 10 highest paid employees in the database
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC #be prudent with the column used here
LIMIT 10;

/*
Select the first 100 rows from the 'dept_emp' table.
*/

SELECT 
    *
FROM
    dept_emp
LIMIT 100;