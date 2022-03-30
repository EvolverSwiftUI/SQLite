/*
  DB Name - PracticeDB.db
  Quiries apply on above Database
*/

CREATE TABLE player(name TEXT, age INT, score INT);

PRAGMA  TABLE_INFO(player);

INSERT INTO player(name, age,score) VALUES("Rahul", 50, 200);

INSERT INTO player(name, age,score) VALUES("Jadeja", 35, 300);

SELECT * FROM player;

SELECT name, age, score FROM player;

SELECT name FROM player;

INSERT INTO player
(name, age,score)
VALUES
("Jadeja", 40, 400),
("Dhoni", 35, 300);

SELECT * FROM player WHERE name="Rahul";
SELECT * FROM player WHERE score=200;


UPDATE player SET score=0;
UPDATE player SET score=500 WHERE name="Ram"900;

DELETE FROM player WHERE score=0;
DELETE FROM player;

DROP TABLE player;


ALTER TABLE player ADD jersey_num INT;
ALTER TABLE player RENAME COLUMN jersey_num TO jer_num;
/*
  There is no support for drop column in SQLite database

  ALTER TABLE player DROP COLUMN jer_num;
*/


/*Quering to get data from TABLE*/

CREATE TABLE 
products(
	name TEXT,
	category TEXT,
	price INT,
	brand TEXT,
	rating INT
	);
	
PRAGMA TABLE_INFO(products);

SELECT * FROM products;

-- Comparision Operators
SELECT *FROM products WHERE category = "Food";

SELECT *FROM products WHERE category <> "Food";

SELECT *FROM products WHERE  rating  > 4.0;
SELECT *FROM products WHERE  rating  > =4.0;

SELECT *FROM products WHERE  price  < 2000;
SELECT *FROM products WHERE  price  <= 2000;

-- String operations
SELECT *FROM products WHERE  name  LIKE "Shirt%";
SELECT *FROM products WHERE  name  LIKE "%Shirt";
SELECT *FROM products WHERE  name  LIKE "%Shirt%";

SELECT *FROM products WHERE  name  LIKE "Shirt_";

-- Get all Harry Potter books
SELECT *FROM products WHERE  name  LIKE "Harry Potter%";

SELECT *FROM products WHERE  category  LIKE "Gadgets";

SELECT *FROM products WHERE  name  LIKE "Blue%";

-- name ends with Cake
SELECT *FROM products WHERE  name  LIKE "%Cake";

-- name contains jeans
SELECT *FROM products WHERE  name  LIKE "%jeans%";

-- Logical Operators
--AND, OR, NOT

-- query: 
-- Find Products with 
-- 1. belonging to Clothing category  and 
-- 2. whose price is lessthan 1000

SELECT *FROM products WHERE  category  LIKE "Clothing" AND price < 1000;

----------------------------------------------	

	SELECT 
		*
	FROM 
		products 
	WHERE  
		rating > 4 
		AND price <= 20 
		AND brand LIKE "Britannia";
	
----------------------------------------------	
	
	SELECT 
		*
	FROM 
		products 
	WHERE  
		 name  =  "Chocolate Cake"
		OR name  =  "Strawberry Cake";
		
----------------------------------------------------------------------

	SELECT
		*
	FROM
		products
	WHERE
		brand = "Puma"
		OR brand = "Nike"
		OR brand = "Roadster";


----------------------------------------------------------------------

	SELECT
		*
	FROM
		products
	WHERE
		NOT brand LIKE "Denim";


----------------------------------------------------------------------

-- QUERY
-- Find all products
-- 1. Redmi brand with rating > 4
-- 2. or else brand is oneplus

	SELECT
		*
	FROM	
		products
	WHERE
		(brand = "Redmi" AND rating >= 4 )
		OR brand = "OnePlus";	


----------------------------------------------------------------------

-- QUERY
-- Find all products
-- 1. category is clothing
-- 2. and name does not contain  jeans

	SELECT
		*
	FROM	
		products
	WHERE
		category = "Clothing"
		AND NOT name LIKE "%jeans%";	
		
----------------------------------------------------------------------

	SELECT
		*
	FROM	
		products
	WHERE
		(
			brand = "Puma"
			OR brand = "Denim"
		)
		AND NOT name LIKE "%shirt%";	

----------------------------------------------------------------------
-- IN operator

SELECT * 
FROM products
WHERE brand IN ("Puma", "Denim", "Levi's", "Roadster", "Nike");

----------------------------------------------------------------------
-- BETWEEN operator

SELECT * 
FROM products
WHERE price BETWEEN 500 AND 2000;

------------------------------------------------------------------------
-- ORDER BY clause 
-- QUERY:
-- Get Products as the price in increasing order
-- Get Products as the rating in decreasing order

SELECT *
FROM products
ORDER BY price ASC;

SELECT *
FROM products
ORDER BY rating DESC;

SELECT *
FROM products
ORDER BY 
price ASC, rating DESC;

------------------------------------------------------------------
-- LIMIT  and  OFFSET
-- Get the details of top 5 highly rated products

SELECT *
FROM products
ORDER BY rating DESC
LIMIT 5
OFFSET 0;












