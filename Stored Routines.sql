/* Stored Routines or Stored Procedures
routine - a usual, fixed action, or series of actions, repeated periodically
stored routine - an SQL statement, or set of SQL statements, tht can be stored on the database server
string a query in a routine, all you need is a single line of code
call stored routine;
*/
/* statement terminator or delimiter
calling stored_procedure won't work so need a temporary delimiter */

# must alwats insert () after procedure_name. no space

# DELIMITER $$
# CREATE PROCEDURE procedure_name()
# BEGIN
#	SELECT * FROM employees } query
#	LIMIT 1000; } query
# END$$
# DELIMITER ; change it back to ;

USE employees;

-- Will return the first 1000 rows from employees table

DROP PROCEDURE IF EXISTS select_employees; # don't need parenthesis when dropping

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT * FROM employees
    LIMIT 1000;

END$$

DELIMITER ;

# using/calling the procedure - WAY 1
CALL employees.select_employees();

# using/calling the procedure - WAY 2
CALL select_employees();

# using/calling the procedure - WAY 2
## click lighting/execute on Store procedures table

/* 
Create a procedure that will provide the average salary of all employees. Then, call the procedure. 
*/
DROP PROCEDURE IF EXISTS avg_salary;
DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
	SELECT 
		AVG(salary)
	FROM 
		salaries;

END$$

DELIMITER ;

CALL avg_salary();

-- can also right click on stored procedures to create a new one

# to drop them 
DROP PROCEDURE select_employees;
# or right click on stored procedure

/*
 Parametric procedures or Stored Procedures with Input Parameters 
 */
DROP PROCEDURE IF EXISTS emp_salary;
DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER) # P STANDS FOR PARAMETER
BEGIN
SELECT
	e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
END$$

DELIMITER ;

/*
With Aggregate Functions
*/ 

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER) # P STANDS FOR PARAMETER
BEGIN
SELECT
	e.first_name, e.last_name, AVG(s.salary)
FROM
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
END$$

DELIMITER ;

/* 
Stored Procedures with Ouput/Two Parameters
CREATE PROCEDURE procedure_name(in parameter, out parameter)
*/
DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2)) # P STANDS FOR PARAMETER
BEGIN
SELECT
	AVG(s.salary)
INTO p_avg_salary FROM # must use select into with in and out parameters
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
END$$

DELIMITER ;

/*
Create a procedure called "emp_info" that uses as parameters the first and the 
last name of an individual, and returns their employee number.
*/
DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), OUT p_emp_no INTEGER)
BEGIN
SELECT
	e.emp_no
INTO p_emp_no FROM
	employees e
WHERE
	e.first_name = p_first_name AND e.last_name = p_last_name;
END$$

DELIMITER ;