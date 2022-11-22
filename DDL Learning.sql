CREATE DATABASE IF NOT EXISTS Sales;
 
CREATE TABLE sales

(purchase_number INT NOT NULL PRIMARY KEY auto_increment,

date_of_purchase DATE NOT NULL,

customer_id INT,

item_code VARCHAR(10) NOT NULL

);

CREATE TABLE customers

(customer_id INT,

first_name VARCHAR(255),

last_name VARCHAR(255),

email_address VARCHAR(255),

number_of_complaints INT

);

SELECT * FROM sales.sales;

SELECT * FROM sales;

DROP TABLE sales;


DROP TABLE sales; 

CREATE TABLE sales
(
purchase_number INT auto_increment,
date_of_purchase DATE,
customer_id INT,
item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);

ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;

DROP TABLE customers;

CREATE TABLE customers
(
    customer_id INT,  
    first_name varchar(255),  
    last_name varchar(255),  
    email_address varchar(255),   
    number_of_complaints int,   
primary key (customer_id)   
);

CREATE TABLE items                                                                                                                              
(  
    item_code varchar(255),   
    item varchar(255),   
    unit_price numeric(10,2),   
    company_id varchar(255),
primary key (item_code)   
);  

    CREATE TABLE companies   
(
    company_id varchar(255),   
    company_name varchar(255),  
    headquarters_phone_number int(12),   
primary key (company_id)   
);

DROP TABLES sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;

# unique key constraint

CREATE TABLE customers
(   customer_id INT,  
    first_name varchar(255),  
    last_name varchar(255),  
    email_address varchar(255),   
    number_of_complaints int,   
primary key (customer_id),
unique key (email_address)
);

DROP TABLE customers;

CREATE TABLE customers
(   customer_id INT,  
    first_name varchar(255),  
    last_name varchar(255),  
    email_address varchar(255),   
    number_of_complaints int,   
primary key (customer_id)
);

ALTER TABLE customers
ADD unique key (email_address);

#indexes - unique keys have same role as indexes but not vice versa
# dropping unique key
ALTER TABLE customers
DROP INDEX email_address;

DROP TABLE customers;

CREATE TABLE customers (

    customer_id INT AUTO_INCREMENT,

    first_name VARCHAR(255),

    last_name VARCHAR(255),

    email_address VARCHAR(255),

    number_of_complaints INT,

PRIMARY KEY (customer_id)

);

ALTER TABLE customers

ADD COLUMN gender ENUM('M', 'F') AFTER last_name;


INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)

VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365datascience.com', 0)

;

# DEFAULT constraint

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name, last_name, gender)
VALUES ('Peter', 'Figaro', 'M')
;

SELECT * FROM customers;


ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;

CREATE TABLE companies (

company_id VARCHAR(255),
company_name VARCHAR(255) DEFAULT 'X',
headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id),
UNIQUE KEY (headquarters_phone_number)
);

# NOT NULL Constraint

DROP TABLE companies;

CREATE TABLE companies (

company_id INT AUTO_INCREMENT,
company_name VARCHAR(255) NOT NULL,
headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id)
);


ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+1 (202) 555-0196', 'Company A')
;

SELECT * FROM companies;

# adding NULL constraint to headquarters_phone_number
ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;

# dropping NULL constraint from headquarters_phone_number
ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;