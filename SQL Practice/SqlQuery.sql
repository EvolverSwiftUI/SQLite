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















