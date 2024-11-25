CREATE DATABASE lab6_defence;
CREATE TABLE departments
(
    department_id   SERIAL PRIMARY KEY,
    department_name VARCHAR
);
CREATE TABLE employees
(
    employee_id   SERIAL PRIMARY KEY,
    first_name    VARCHAR,
    last_name     VARCHAR,
    department_id INTEGER REFERENCES departments (department_id),
    salary        DECIMAL(10, 2),
    hire_date     DATE
);

INSERT INTO departments (department_id, department_name)
VALUES (1, 'HR'),

       (2, 'Finance'),

       (3, 'IT'),

       (4, 'Marketing'),

       (5, 'Sales'),

       (6, 'Customer Support'),

       (7, 'Operations');



INSERT INTO employees (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES (101, 'John', 'Doe', 1, 55000.00, '2020-01-15'),

       (102, 'Jane', 'Smith', 2, 60000.00, '2019-03-10'),

       (103, 'Emily', 'Jones', 3, 75000.00, '2021-06-01'),

       (104, 'Michael', 'Brown', 1, 48000.00, '2018-07-24'),

       (105, 'Sarah', 'Davis', 4, 70000.00, '2017-12-10'),

       (106, 'David', 'Wilson', 2, 62000.00, '2020-05-11'),

       (107, 'Bob', 'Martinez', 7, 45000.00, '2019-09-17'),

       (108, 'Alice', 'Johnson', 6, 68000.00, '2022-01-12'),

       (110, 'Diana', 'Garcia', 6, 71000.00, '2023-02-14'),

       (111, 'Edward', 'Clark', 7, 46000.00, '2018-05-22'),

       (112, 'Fiona', 'Walker', 3, 78000.00, '2021-09-01'),

       (113, 'George', 'White', 4, 72000.00, '2019-11-10');

SELECT employees.first_name || employees.last_name AS name, departments.department_name
FROM employees
         JOIN departments ON (employees.department_id = departments.department_id);


SELECT employees.first_name || ' ' || employees.last_name AS name, departments.department_name, salary
FROM employees
         JOIN departments ON (employees.department_id = departments.department_id)
WHERE salary = (SELECT MAX(salary) FROM employees WHERE employees.department_id = departments.department_id)
ORDER BY name;

SELECT e.first_name,
       e.last_name,
       d.department_name
FROM employees e
         JOIN departments d ON e.department_id = d.department_id
WHERE (SELECT COUNT(*)
       FROM employees
       WHERE department_id = e.department_id) = 1;

SELECT e.employee_id     AS employee_id,
       e.first_name      AS employee_name,
       d.department_id   AS department_id,
       d.department_name AS department_name
FROM employees e
         CROSS JOIN departments d;
