CREATE DATABASE lab3;
CREATE TABLE Orders(
    user_Id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    quantity_of_orders INTEGER
);
INSERT INTO Orders (user_Id, first_name, last_name, city, quantity_of_orders)

VALUES (1, 'John', 'Doe', 'Moscow', 5),

       (2, 'Jane', 'Smith', 'London', 3),

       (3, 'Alex', 'Johnson', 'Paris', 20),

       (4, 'Maria', 'Ivanova', 'Moscow', 4),

       (5, 'Anton', 'Petrov', 'Berlin', 2);
SELECT first_name || ' ' || last_name AS "Full Name" FROM Orders;
SELECT * FROM Orders WHERE city='Moscow' AND quantity_of_orders > 3;
SELECT AVG(quantity_of_orders) AS average_orders FROM Orders WHERE city='Moscow';
SELECT city, COUNT(*) AS numbers_of_users
FROM Orders
GROUP BY city;
SELECT * FROM Orders
         WHERE quantity_of_orders=(SELECT MAX(quantity_of_orders) FROM Orders);
SELECT * FROM ORDERS
         ORDER BY quantity_of_orders DESC;
SELECT DISTINCT city
FROM Orders;

SELECT city, SUM(quantity_of_orders) AS total_orders
FROM Orders
GROUP BY city
HAVING SUM(quantity_of_orders) > 10;

SELECT *
FROM Orders
ORDER BY quantity_of_orders DESC LIMIT 3;

DELETE FROM Orders
WHERE city='London';