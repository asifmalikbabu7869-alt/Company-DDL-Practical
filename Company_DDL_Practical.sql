DROP DATABASE IF EXISTS company_training;
CREATE DATABASE company_training;

USE company_training;

CREATE TABLE departments (
    department_id INT NOT NULL,
    dept_name VARCHAR(80) NOT NULL,
    city VARCHAR(60)
);

CREATE TABLE employees (
    employee_id INT NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(120),
    department_id INT NOT NULL,
    salary DECIMAL(10,2),
    status VARCHAR(20)
);

ALTER TABLE departments
ADD PRIMARY KEY (department_id);

ALTER TABLE employees
ADD PRIMARY KEY (employee_id);

ALTER TABLE departments
ADD location VARCHAR(100);

ALTER TABLE departments
CHANGE dept_name department_name 
VARCHAR(80) NOT NULL;

ALTER TABLE employees
MODIFY salary
DECIMAL(12,2) NOT NULL;

ALTER TABLE employees
MODIFY status VARCHAR(20) 
DEFAULT 'Active';

ALTER TABLE employees
ADD CONSTRAINT unique_email 
UNIQUE (email);

RENAME TABLE employees TO staff;

ALTER TABLE staff
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE staff
DROP INDEX unique_email;

ALTER TABLE staff
DROP FOREIGN KEY fk_department;

ALTER TABLE staff
DROP PRIMARY KEY;

ALTER TABLE staff
ADD PRIMARY KEY (employee_id);

ALTER TABLE departments
DROP COLUMN location;

CREATE DATABASE company_management;

RENAME TABLE
company_training.departments
TO company_management.departments;

RENAME TABLE
company_training.staff
TO company_management.staff;

