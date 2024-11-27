CREATE DATABASE lab7;
CREATE TABLE employees
(
    employee_id SERIAL PRIMARY KEY,
    first_name  VARCHAR,
    last_name   VARCHAR,
    department  VARCHAR
);

CREATE TABLE salaries
(
    salary_id      SERIAL PRIMARY KEY,
    employee_id    INTEGER REFERENCES employees (employee_id),
    salary         DECIMAL,
    effective_date DATE
);



INSERT INTO employees (employee_id, first_name, last_name, department)
VALUES (1, 'Alice', 'Smith', 'HR'),

       (2, 'Bob', 'Johnson', 'IT'),

       (3, 'Charlie', 'Brown', 'Marketing'),

       (4, 'Daisy', 'Miller', 'Finance'),

       (5, 'Eve', 'Davis', 'IT');



INSERT INTO salaries (salary_id, employee_id, salary, effective_date)
VALUES (1, 1, 50000, '2023-01-01'),

       (2, 2, 70000, '2023-01-01'),

       (3, 3, 60000, '2023-01-01'),

       (4, 4, 80000, '2023-01-01'),

       (5, 5, 75000, '2023-01-01');

SELECT *
FROM employees
         JOIN salaries s ON employees.employee_id = s.employee_id
WHERE salary > (SELECT AVG(salary) FROM salaries);

SELECT *
FROM employees
WHERE department = (SELECT department FROM employees WHERE employee_id = 2);

CREATE INDEX employees_department_idx ON employees (department);

CREATE INDEX salaries_employee_salary_idx ON salaries (employee_id, salary);

CREATE INDEX employees_lastname_idx ON employees (UPPER(last_name));

CREATE UNIQUE INDEX idx_unique_first_last_name ON employees (first_name, last_name);

CREATE INDEX idx_salaries_employee_salary ON salaries (employee_id, salary DESC);

DROP INDEX employees_department_idx,salaries_employee_salary_idx,idx_salaries_employee_salary,idx_unique_first_last_name;