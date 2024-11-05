CREATE DATABASE LAB3DEFENCE;
CREATE TABLE Products(
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity_in_stock INTEGER
);


INSERT INTO Products (product_id, product_name, category, price, quantity_in_stock)

VALUES (1, 'Laptop', 'Electronics', 1200.99, 15),

       (2, 'Phone', 'Electronics', 599.99, 30),

       (3, 'Table', 'Furniture', 89.50, 12),

       (4, 'Chair', 'Furniture', 49.99, 25),

       (5, 'TV', 'Electronics', 799.99, 10);

SELECT AVG(price) AS average_price
FROM Products
WHERE category='Furniture';

SELECT category, COUNT(*) AS numbers_of_products
FROM Products
GROUP BY category;

SELECT * FROM Products
ORDER BY quantity_in_stock DESC ;

SELECT category, SUM(price) as total_price
FROM Products
GROUP BY category
HAVING SUM(price * quantity_in_stock) > 2000;
