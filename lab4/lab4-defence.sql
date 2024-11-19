CREATE DATABASE lab4_defence;
CREATE TABLE store_products
(
    product_id   INTEGER PRIMARY KEY,
    product_name VARCHAR(50),
    category     VARCHAR(50),
    price        NUMERIC,
    stock        INTEGER,
    discount     NUMERIC,
    date_added   DATE
);
INSERT INTO store_products (product_id, product_name, category, price, stock, discount, date_added)
VALUES (1, 'Laptop', 'Electronics', 1000.0, 20, 10.0, '2024-09-01'),
       (2, 'Headphones', 'Electronics', 150.0, 50, 5.0, '2024-09-05'),
       (3, 'Coffee Machine', 'Home Appliances', 300.0, 15, 15.0, '2024-08-20'),
       (4, 'Smartphone', 'Electronics', 800.0, 10, 8.0, '2024-09-10'),
       (5, 'Blender', 'Home Appliances', 100.0, 30, 20.0, '2024-08-15');
SELECT product_name, COALESCE(discount, 0)
FROM store_products;

SELECT product_name,
       CASE
           WHEN price < 200 THEN 'Cheap'
           WHEN price >= 200 AND price < 700 THEN 'Medium'
           WHEN price >= 700 THEN 'Expensive' END AS price_category
FROM store_products;

SELECT UPPER(product_name)
FROM store_products
WHERE category = 'Home Appliances'
ORDER BY product_name;

DROP DATABASE lab4_defence;