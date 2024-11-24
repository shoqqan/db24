CREATE DATABASE lab5;
CREATE TABLE customers
(
    customer_id SERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    email       VARCHAR(50) UNIQUE,
    phone       VARCHAR(50) UNIQUE,
    CHECK (email LIKE '%@%' ),
    CHECK (phone LIKE '+7%')
);

CREATE TABLE orders
(
    order_id     SERIAL PRIMARY KEY,
    customer_id  INTEGER REFERENCES customers (customer_id),
    order_date   DATE NOT NULL,
    total_amount INTEGER,
    CHECK ( total_amount > 0 ),
    CONSTRAINT unique_order_per_customer UNIQUE (customer_id, order_id)
);

INSERT INTO customers (name, email, phone)

VALUES ('Alice Johnson', 'alice.johnson@example.com', '+71234567890'),

       ('Bob Smith', 'bob.smith@example.com', '+71234567891'),

       ('Charlie Brown', 'charlie.brown@example.com', '+71234567892'),

       ('David Wilson', 'david.wilson@example.com', '+71234567893'),

       ('Eva Green', 'eva.green@example.com', '+71234567894'),

       ('Frank Miller', 'frank.miller@example.com', '+71234567895'),

       ('Grace Lee', 'grace.lee@example.com', '+71234567896');



INSERT INTO orders (customer_id, order_date, total_amount)

VALUES (1, '2024-01-15', 150.50),

       (2, '2024-01-16', 200.00),

       (3, '2024-01-17', 75.25),

       (4, '2024-01-18', 120.00),

       (5, '2024-01-19', 300.75),

       (6, '2024-01-20', 450.00),

       (7, '2024-01-21', 50.50);


INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (8, '2024-11-01', 100.00);

SELECT customers.customer_id, customers.name, MAX(order_date) AS latest_order_date
FROM customers
         INNER JOIN orders o on customers.customer_id = o.customer_id
GROUP BY customers.customer_id, customers.name;

SELECT customer_id, order_id, total_amount
FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

SELECT *
FROM customers
WHERE name LIKE 'N%';

UPDATE customers
SET name = 'John Doe'
WHERE customer_id = 2;

SELECT name
FROM orders
         INNER JOIN customers c on c.customer_id = orders.customer_id
WHERE EXTRACT(MONTH FROM current_date) = EXTRACT(MONTH FROM order_date);

