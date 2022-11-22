/* DISTINCT
Aggregate functions
ORDER BY, GROUP BY, AS
*/

SELECT DISTINCT
    gender
FROM
    employees;
    
SELECT DISTINCT
    hire_date
FROM
    employees;
    
# Aggregate Functions
## COUNT(), SUM(), MIN(), MAX(), AVG()

SELECT 
    COUNT(hire_date)
FROM
    employees;
    
SELECT 
    COUNT(first_name)
FROM
    employees;
    
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
/*
How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table? 
How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
*/

SELECT 
    COUNT(salary >= 100000)
FROM
    salaries;
    
SELECT

    COUNT(*)

FROM

    dept_manager;
    
# ORDER BY
## order by first name, ASC default, DESC

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

# GROUP BY
## after WHERE before ORDER BY, does disticnt names
SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

# AS - alias

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

# Using Aliases (AS)
SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;