/* 
Self Join 
- applied when a table must join itself
- if you'd like to combine certain rows of a table with other rows of the same table
*/

# Task: From the emp_manager table, extract the record data only of those employees who are managers as well
SELECT 
    *
FROM
    emp_manager
ORDER BY emp_manager.emp_no;


SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);
            
SELECT 
	manager_no
FROM
	emp_manager;
    
/*
VIEWS
- a virtual table whose contents are obtained from an existing table or tables, called base tables
- simply shows the data contained in the base table
- saves coding time, less storage
*/

SELECT 
    *
FROM
    dept_emp;
    
SELECT 
    emp_no, from_date, COUNT(emp_no) AS Num
FROM
    dept_emp
GROUP BY emp_no
HAVING Num > 1;

# visualize only the period encompassimg the last contract of each employee
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;

SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;

SELECT 
    *
FROM
    employees.v_dept_emp_latest_date;
    
/* 
Create a view that will extract the average salary of all managers registered in the database. 
Round this value to the nearest cent. If you have worked correctly, after executing the view from the 
“Schemas” section in Workbench, you should obtain the value of 66924.27.
*/
CREATE OR REPLACE VIEW v_manager_avg_salary AS
	 SELECT 
        ROUND(AVG(salary),2)
    FROM
        salaries s
			JOIN
        dept_manager m ON s.emp_no = m.emp_no;
    
SELECT 
    *
FROM
    v_manager_avg_salary;