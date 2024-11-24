CREATE DATABASE lab5_defence;
CREATE TABLE departments
(
    department_id   SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE staff
(
    staff_id      SERIAL PRIMARY KEY,

    first_name    VARCHAR(50) NOT NULL,

    last_name     VARCHAR(50) NOT NULL,

    email         VARCHAR(50) NOT NULL UNIQUE,
    CHECK ( email LIKE '%@%'),

    department_id INTEGER REFERENCES departments (department_id)
);

ALTER TABLE staff
    ADD CHECK (LENGTH(last_name) < 50 );

INSERT INTO departments (department_name)

VALUES ('HR'),

       ('IT'),

       ('Sales'),

       ('Marketing'),

       ('Finance');



INSERT INTO staff (first_name, last_name, email, department_id)

VALUES ('Alice', 'Johnson', 'alice.johnson@example.com', 1),

       ('Bob', 'Smith', 'bob.smith@example.com', 2),

       ('Charlie', 'Brown', 'charlie.brown@example.com', 3),

       ('David', 'Wilson', 'david.wilson@example.com', 4),

       ('Eva', 'Green', 'eva.green@example.com', 5),

       ('Frank', 'Miller', 'frank.miller@example.com', 1),

       ('Grace', 'Lee', 'grace.lee@example.com', 2),

       ('Henry', 'Adams', 'henry.adams@example.com', 3),

       ('Ivy', 'Davis', 'ivy.davis@example.com', 4),

       ('Jack', 'Taylor', 'jack.taylor@example.com', 5);


SELECT first_name, last_name, COALESCE(department_name, 'No department') AS department_name
FROM staff
         INNER JOIN departments d on d.department_id = staff.department_id;

UPDATE staff
SET email = email || '.hr'
WHERE department_id = (SELECT department_id
                       FROM departments
                       WHERE department_name = 'HR');

SELECT first_name, last_name, UPPER(email) AS email
FROM staff;
