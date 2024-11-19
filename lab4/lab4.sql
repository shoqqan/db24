CREATE DATABASE cat_shelter;

CREATE TABLE cats
(
    cat_id  SERIAL PRIMARY KEY,
    name    VARCHAR(50),
    age     INTEGER,
    breed   VARCHAR(50),
    weight  NUMERIC,
    adopted BOOLEAN
);

ALTER TABLE cats
    ALTER COLUMN cat_id TYPE INTEGER;

INSERT INTO cats (cat_id, name, age, breed, weight, adopted)
VALUES (1, 'Whiskers', 2, 'Siamese', 4.5, false),

       (2, 'Fluffy', 3, 'Maine Coon', 6.2, true),

       (3, 'Shadow', 1, 'British Shorthair', 5.1, false),

       (4, 'Mittens', 5, 'Persian', 4.9, true),

       (5, 'Tiger', 4, 'Bengal', 6.0, false);

UPDATE cats
SET weight=ROUND(weight);

UPDATE cats
SET name=UPPER(name);

SELECT name,
       CASE
           WHEN age < 3 THEN 'Young'
           WHEN age >= 3 AND age < 5 THEN 'Mature'
           WHEN age >= 5 THEN 'Elderly'
           END AS age_category

FROM cats;

SELECT name, weight, 'Heaviest' as weight_category
FROM cats
WHERE weight = (SELECT MAX(weight) FROM cats)
UNION
SELECT name, weight, 'Lightest' as weight_category
FROM cats
WHERE weight = (SELECT MIN(weight) FROM cats);

UPDATE cats
SET weight=weight + cats.weight * 0.15
WHERE weight > 5;

CREATE OR REPLACE FUNCTION random_between(low INT, high INT)
    RETURNS INTEGER
RETURN random() * (high - low) + low;

INSERT INTO cats (cat_id, name, age, breed, weight, adopted)
VALUES (6, 'Amaka', 4, 'lol', random_between(3, 7), false);

SELECT *
FROM cats
WHERE breed = 'Persian'
UNION
SELECT *
FROM cats
WHERE breed = 'Siamese'
UNION
SELECT *
FROM cats
WHERE breed = 'Bengal';

UPDATE cats
SET name=REPLACE(LOWER(name), 'i', 'o');

SELECT name,
       CASE
           WHEN weight = age THEN NULL
           ELSE age
           END AS query

FROM cats;

DELETE
FROM cats
WHERE adopted
RETURNING *;


