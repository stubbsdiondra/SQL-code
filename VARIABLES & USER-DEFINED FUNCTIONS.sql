/*
VARIABLES
*/
-- 1. CREATE A VARIABLE
SET @v_avg_salary = 0;

-- 2. EXTRACT A VALUE THAT WILL BE ASSIGNED TO THE NEWLY CREATED VARIABLE (CALL PROCEDURE)
CALL employees.emp_avg_salary_out(11300, @v_avg_salary);

-- 3. ASK THE SOFTWARE TO DISPLAY THE OUTPUT OF THE PROCEDURE
SELECT @v_avg_salary;

/*
Create a variable, called "v_emp_no", where you will store the output of the procedure you created in the last exercise.

Call the same procedure, inserting the values "Aruna" and "Journel" as a first and last name respectively.

Finally, select the obtained output.
*/
SET @v_emp_no = 0;
CALL emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;


/*
USER-DEFINED FUNCTIONS

DELIMITER $$
CREATE FUNCTION function_name(parameter data_type) RETURNS data_type # can be of any data type
DECLARE variable_name data_type
SELECT
	...
INTO p_emp_no FROM
	employees e
RETURN variable_name
END$$
DELIMITER ;
*/
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2) 
DETERMINISTIC # NO SQL, READS SQL DATA
BEGIN 
DECLARE v_avg_salary DECIMAL(10,2); # v stands for variable
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

SELECT f_emp_avg_salary(11300);

/*
Create a function called "emp_info" that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.

Hint: In the BEGIN-END block of this program, you need to declare and use two variables - v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.
*/
DELIMITER $$
CREATE FUNCTION f_emp_info(p_first_name VARCHAR(255),p_last_name VARCHAR(255)) RETURNS DECIMAL (10,2) 
DETERMINISTIC # NO SQL, READS SQL DATA
BEGIN 
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL (10,2); # v stands for variable
SELECT
	MAX(from_date)
INTO v_max_from_date FROM

    employees e

        JOIN

    salaries s ON e.emp_no = s.emp_no

WHERE

    e.first_name = p_first_name

        AND e.last_name = p_last_name;
SELECT

    s.salary

INTO v_salary FROM

    employees e

        JOIN

    salaries s ON e.emp_no = s.emp_no

WHERE

    e.first_name = p_first_name

        AND e.last_name = p_last_name

        AND s.from_date = v_max_from_date;

	RETURN v_salary;

END$$

DELIMITER ;

SELECT f_emp_info('Aruna', 'Journel');

# functions are better if you need just one value returned, stored procedure is for multiple
# can't use INSERT, UPDATE or DELETE in function, only in stored procedure
# CALL procedure; VS SELECT function;

SET @v_emp_no = 11300;
SELECT
	emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM
	employees
WHERE
	emp_no = @v_emp_no;