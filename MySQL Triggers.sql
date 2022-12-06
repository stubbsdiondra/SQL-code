##########################################################
##########################################################

-- MySQL Triggers

##########################################################
##########################################################

# By definition, a MySQL trigger is a type of stored program, associated with a table, 
# that will be activated automatically once a specific event related to the table of association occurs.

# This event must be related to one of the following three DML statements: INSERT, UPDATE, or DELETE. 
# Therefore, triggers are a powerful and handy tool that professionals love to use where database consistency 
# and integrity are concerned.

# Moreover, to any of these DML statements, one of two types of triggers can be assigned – a “before”, or an “after” trigger.

# In other words, a trigger is a MySQL object that can “trigger” a specific action or calculation ‘before’ or ‘after’ an INSERT, 
# UPDATE, or DELETE statement has been executed. For instance, a trigger can be activated before a new record is inserted into a table, 
# or after a record has been updated.

-- a trigger is a MySQL object that can "trigger" a spedcific action or calculatiom 'before' or 'after' and INSERT, UPDATE, or DELETE
-- -- statement has been executed

USE employees;

COMMIT;

# BEFORE INSERT
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN # conditional statement
		SET NEW.salary = 0; 
	END IF; 
END $$

DELIMITER ;

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
INSERT INTO salaries VALUES ('10001', -92891, '2010-06-22', '9999-01-01');

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001';
    
    
# BEFORE UPDATE
DELIMITER $$

CREATE TRIGGER trig_upd_salary
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN 
	IF NEW.salary < 0 THEN 
		SET NEW.salary = OLD.salary; 
	END IF; 
END $$

DELIMITER ;

UPDATE salaries 
SET 
    salary = 98765
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
UPDATE salaries 
SET 
    salary = - 50000
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10001'
        AND from_date = '2010-06-22';
        
# Well, in the ‘info’ section of the “employees” database, you can find a tab related to triggers. When you click on its name, 
# MySQL will show you the name, the related event, table, timing, and other characteristics regarding each trigger currently in use.  

# Let’s introduce you to another interesting fact about MySQL. You already know there are pre-defined system variables, but system 
# functions exist too! 
# System functions can also be called built-in functions. 
# Often applied in practice, they provide data related to the moment of the execution of a certain query.

# For instance, SYSDATE() delivers the date and time of the moment at which you have invoked this function.
SELECT SYSDATE();

SELECT DATE_FORMAT(SYSDATE(), '%y-%m-%d') as today;



/* 
A new employye has been promoted to a manager

- annual salary should immediately become $20,000 higher than the highest annual salary they'd ever earned until that moment
- a new record in the "department manager" table
- create a trugfer that will apply several modifications to the "salaries" tables once the relevamt record in the "dept manager"
table has been inserted:

	1. make sure that the end date of the previously highest salary contract of that employee is the one from the execution of the insert statement
	2. insert a new record in the "salaries" table about the same employee that reflects their next contract as a manager
*/
DELIMITER $$

CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary int;
    
    SELECT 
		MAX(salary)
	INTO v_curr_salary FROM
		salaries
	WHERE
		emp_no = NEW.emp_no;

	IF v_curr_salary IS NOT NULL THEN
		UPDATE salaries 
		SET 
			to_date = SYSDATE()
		WHERE
			emp_no = NEW.emp_no and to_date = NEW.to_date;

		INSERT INTO salaries 
			VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
    END IF;
END $$

DELIMITER ;


# After you are sure you have understood how this query works, please execute it and then run the following INSERT statement.  
INSERT INTO dept_manager VALUES ('111534', 'd009', date_format(sysdate(), '%y-%m-%d'), '9999-01-01');

# SELECT the record of employee number 111534 in the ‘dept_manager’ table, and then in the ‘salaries’ table to see how the output was affected. 
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no = 111534;
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 111534;
    
ROLLBACK;



/*
Create a trigger that checks if the hire date of an employee is higher than the current date. 
If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).
*/

# MySQL Triggers - solution

DELIMITER $$
CREATE TRIGGER trig_hire_date  
BEFORE INSERT ON employees
FOR EACH ROW  
BEGIN  
                IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN     
                                SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     
                END IF;  
END $$  
DELIMITER ;  

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2030-01-01');  

SELECT  
    *  
FROM  
    employees
ORDER BY emp_no DESC;

ROLLBACK;