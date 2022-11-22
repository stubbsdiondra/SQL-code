/* SELECT, WHERE, AND, OR
NOT IN, IN
LIKE, NOT LIKE
*/

SELECT 
    first_name, last_name
FROM
    employees;

# * is a wildcard character meansing all and everything

SELECT 
    *
FROM
    employees;
    
SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;
    
    
# the WHERE clause
## WHERE condition;

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
# the AND operator
## WHERE condition_1 AND condition_2;
### conditions set on different columns

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
# the OR operator
## conditions set on the same column

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';
        
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

## the operator AND is applied first OR is second: AND > OR

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');
        
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
## IN - NOT IN
### More than 2 conditions

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elivs';
        
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
    
# LIKE - NOT LIKE
## % substitute for a sequence of characters
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar%');
    
## _ matches a single character 
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('2000%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');