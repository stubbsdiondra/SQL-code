/* Wildcard Characters - % , _ and *
* delivers a list of all columns, calls all rows of a table
% a subsitute for a sequence of characters
_ helps you match a single character

BETWEEN...AND, 
IS NOT NULL, IS NULL

Comparison Operators - <>, !=, etc
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');
    
## BETWEEN..AND..

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
## NOT BETWEEN IN

SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
    
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '60000' AND '70000';
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
    
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
## IS NOT NULL - IS NULL

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;
    
SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
# Comparison operators
## <> and != not equal operators

SELECT 
    *
FROM
    employees
WHERE
    first_name <> 'Mark';

SELECT 
    *
FROM
    employees
WHERE
    first_name != 'Mark';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01';
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (hire_date >= '2000-01-01');
        
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;