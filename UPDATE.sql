/*
UPDATE Statement
TCL - Transaction Control Language
*/
COMMIT;
/*
*/
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees
SET
first_name = 'Stella',
last_name = 'Parkinson',
birth_date = '1990-12-31',
gender = 'F'
WHERE
emp_no = 999901;

# the WHERE conditon is crucial
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;	# SAVE YOUR CHANGES

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';
    
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;
    
ROLLBACK; # USE WHERE YOU MAKE A MISTAKE
COMMIT;
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    *
FROM
    departments
ORDER BY dept_no;

UPDATE departments
SET 
    dept_name = 'Data Analysis'
WHERE dept_no = 'd010'
;
