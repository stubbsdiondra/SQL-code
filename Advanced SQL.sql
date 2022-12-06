/*
Advanced SQL Topics
*/

# Variables
SET @v_avg_salary = 0;
CALL employees.emp_avg_salary_out(11300, @v_avg_salary);
SELECT @v_avg_salary;

/*
LOCAL, SESSION AMD GLOBAL VARIABLES
*/

# Local variables can be used within a procedure
## DECLARE used for local variables only
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2) 
-- DETERMINISTIC NO SQL, READS SQL DATA
BEGIN 
DECLARE v_avg_salary DECIMAL(10,2);
SELECT
	AVG(s.salary)
INTO v_avg_salary FROM
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE 
	e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$

DELIMITER ;

/* Session Variables - a variable that exisits only for a session in which you are operating */
-- only visible to the session in which it was created
SET @s_var1 = 3;
SELECT @s_var1;

/* Global Variables - apply to all connections related to a specific server
 
SET GLOBAL var_name = value;
SET @@global.var_name = value;

specific group of pre-defined variables are suitable for GLOBAL
*/

SET GLOBAL max_connections = 1000;

SET @@global.max_connections = 1; # only 1 connection

#  A person with what profession do you think will be in control of setting global variables in a database? - Database Administrator

/* User-Defined vs System Variables
user-defined can be local & session
system can be session & global
 */
SET SESSION max_connections = 1000;
-- MAX_CONNECTIONS IS A GLOBAL VARIABLE

SET global sql_mode= 'STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
