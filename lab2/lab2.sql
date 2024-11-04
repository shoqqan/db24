CREATE DATABASE lab2;

CREATE TABLE student(
    student_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_brith DATE,
    major VARCHAR(50),
    city VARCHAR(50),
    gpa DECIMAL
);

ALTER TABLE student ALTER COLUMN student_id TYPE SMALLINT;
ALTER TABLE student ALTER COLUMN student_id SET NOT NULL;
ALTER TABLE student RENAME COLUMN date_of_brith TO birth_date;
ALTER TABLE student ADD COLUMN email VARCHAR(50);
ALTER TABLE student DROP COLUMN major;
INSERT INTO student (student_id, first_name, last_name, birth_date, city, gpa, email) VALUES
(1, 'John', 'Doe', '2000-01-01', 'New York', 3.5, 'temp1@mail.com'),
(2, 'Jane', 'Doe', '2001-02-02', 'Los Angeles', 3.6, 'temp2@mail.co,'),
(3, 'Alice', 'Smith', '2002-03-03', 'Chicago', 3.7, 'temp3@mail.com')
;
SELECT * FROM student;
SELECT * FROM student WHERE student_id=2;
DROP TABLE student;
DROP DATABASE lab2;