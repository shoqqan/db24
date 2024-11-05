CREATE DATABASE LAB2DEFENCE;
CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary INTEGER
);
ALTER TABLE employees ADD CHECK (salary>0);
INSERT INTO employees (first_name, last_name, salary) VALUES
('John', 'Doe', 1000),
('Jane', 'Doe', 2000),
('Alice', 'Smith', 3000);
SELECT first_name,last_name FROM employees;
DELETE FROM employees WHERE salary < 2000;
DROP TABLE employees;
