CREATE DATABASE LAB1DEFENCE;
CREATE TABLE students(
    StudentId INTEGER PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INTEGER,
    CHECK (Age>16)
);
INSERT INTO students (StudentId, FirstName, LastName, Age) VALUES
(1, 'John', 'Doe', 20),
(2, 'Jane', 'Doe', 21),
(3, 'Alice', 'Smith', 22);
ALTER TABLE students ADD COLUMN Faculty VARCHAR(50);
ALTER TABLE students RENAME TO pupils;
SELECT * from pupils WHERE SUBSTRING (FirstName,1,1)='A';
DROP TABLE pupils;

