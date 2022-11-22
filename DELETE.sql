/*
DELETE Statement
*/
COMMIT;

SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
DELETE FROM employees 
WHERE
    emp_no = 999903;
    
ROLLBACK;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

# Unsafe DELETE

commit;

# delete from departments_dup;

# rollback;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments
ORDER BY dept_no;

/* 
DROP VS TRUNCATE VS DELETE

only use drop table when you're sure you won't use the table again

when truncating, auto-increment values will be reset

DELETE - removes records row by row, auto-increment values will NOT be reset
TRUNCATE delives the outout much quicker because it doesn't remove row by row
*/