CREATE DATABASE lab2;
CREATE TABLE books(
    bookID INTEGER PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100) DEFAULT 'Unknown',
    publication_year INTEGER,
    genre VARCHAR(50),
    price INTEGER,
    quantity INTEGER DEFAULT 1
);
CREATE SEQUENCE generate_book_id_sequence
AS INTEGER
START WITH 1
INCREMENT 2 NO CYCLE;

ALTER TABLE books ALTER COLUMN bookID SET DEFAULT nextval('generate_book_id_sequence');

INSERT INTO books (title, author, publication_year, genre, price, quantity) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Novel', 10, 5),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Novel', 15, 3),
('1984', 'George Orwell', 1949, 'Dystopian', 20, 2),
('Pride and Prejudice', 'Jane Austen', 1813, 'Romance', 5, 1),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 'Novel', 12, 4),
('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy', 25, 2),
('The Lord of the Rings', 'J.R.R. Tolkien', 1954, 'Fantasy', 30, 1),
('The Da Vinci Code', 'Dan Brown', 2003, 'Mystery', 1800, 3),
('The Alchemist', 'Paulo Coelho', 1988, 'Fantasy', 1000, 2);

SELECT * FROM books WHERE EXTRACT(YEAR FROM CURRENT_DATE) - publication_year > 30 AND price > 500;

UPDATE books SET price=price/100 WHERE EXTRACT(YEAR FROM CURRENT_DATE)-publication_year < 100 RETURNING title,price;

INSERT INTO books (title,genre,price) VALUES
                                           ('MOL','Mystery',300),
                                           ('NOL','Romance',400),
                                           ('POL','Dystopian',500);
UPDATE books
SET publication_year = (SELECT publication_year from books WHERE bookID=4)
WHERE publication_year IS NOT NULL;

SELECT * FROM books
         WHERE genre=(SELECT genre FROM books WHERE bookID=1);
DELETE FROM books
WHERE bookID=2 AND price >200;

DELETE FROM books
       WHERE author = 'Unknown';

UPDATE books
    SET price = price*1.15;

DELETE FROM books RETURNING *;





