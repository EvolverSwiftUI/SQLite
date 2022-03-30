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

SELECT *
FROM products
ORDER BY rating DESC
LIMIT 5;


-- Now lets fetch next 5 highly rated products

SELECT *
FROM products
ORDER BY rating DESC
LIMIT 5
OFFSET 5;

SELECT *
FROM products
ORDER BY rating DESC
LIMIT 50;

-- NOTE:
-- always LIMIT clause comes first then only OFFSET clause comes next.
-- otherwise we will get error of syntax

---------------------------------------------------------------------------------
-- DISTINCT results

SELECT brand
FROM products
ORDER BY brand;

-- here in above query we are getting brands as duplicates
-- but we want only unique or distinct brands

-- so we can achieve this by using DISTINCT clause

SELECT DISTINCT brand
FROM products
ORDER BY brand;

-- distinct in multiple columns
-- in each category, get unique brands.
-- meaning we will get unique in the way of category and brand pairs.

SELECT DISTINCT category, brand
FROM products
ORDER BY category;

CREATE TABLE player_match_details(name TEXT, match TEXT,  score INTEGER, fours INTEGER, six INTEGER, year INTEGER);
ALTER TABLE player_match_details RENAME COLUMN six to sixes;

INSERT INTO player_match_details(name, match, score, fours, sixes, year) VALUES("Ram", "RR vs SRH", 62, 2, 7, 2011);

SELECT *FROM player_match_details;

-------------------------------------------------------------------------------------------------------------------------------
-- Aggregations
-- Sum, Avg, Max, Min, Count.............etc.

-- QUERY
-- Total Runs Scrored

	SELECT 
		SUM(score) 
	FROM 
		player_match_details;

-- Get total scored by Lokesh
-- It will work like this way
-- 1. First it will filter rows using WHERE clause
-- 2. Second it will apply the aggregation function SUM on score COLUMN
 
	SELECT 
		SUM(score) 
	FROM 
		player_match_details
	WHERE
		name="Lokesh";

	SELECT 
		AVG(score) 
	FROM 
		player_match_details
	WHERE
		name="Lokesh";
		
	SELECT 
		MAX(score) 
	FROM 
		player_match_details
	WHERE
		name="Lokesh";
		
	SELECT 
		MIN(score) 
	FROM 
		player_match_details
	WHERE
		name="Lokesh";
		
	SELECT 
		COUNT(score) 
	FROM 
		player_match_details
	WHERE
		name="Lokesh";
		
		
-- Total number of matches
		
	SELECT 
		COUNT(*) 
	FROM 
		player_match_details;
	
-- calculate the total number of players in the DB.
-- Approach
-- 1. first get the distinct names of players meaning without duplicates.
-- 2. then second apply the count on that distinct column

	SELECT
		 COUNT(DISTINCT name)
	FROM
		player_match_details;

-- NOTE:
-- NULL value
-- by default null values are excluded when we use DISTINCT function on that COLUMN.


-- COUNT variant functions
	SELECT
		COUNT(*)
	FROM
		player_match_details;
 
 -- or else 
 	SELECT
		COUNT(1)
	FROM
		player_match_details;

 -- or else 
 	SELECT
		COUNT()
	FROM
		player_match_details;
		
-- Using Multiple Aggregate Functions
	SELECT
		MAX(score), 
		MIN(score), 
		AVG(score), 
		SUM(score)
	FROM
		player_match_details;
		
		
	SELECT
		MAX(score),
		MIN(score), 
		AVG(score),
		SUM(score)
	FROM
		player_match_details
	WHERE
		name = "David";

-----------------------------------------------------------------------------------------------------------
-- Alias
-- name to player_name

	SELECT 
		name AS player_name 
	FROM 
		player_match_details;


	SELECT 
		COUNT(DISTINCT name)  AS unique_players_count
	FROM 
		player_match_details;

	SELECT 
		SUM(score)  AS total_score
	FROM 
		player_match_details;
		
------------------------------------------------------------------------------------------------
-- GROUP BY clause

-- Find the total scores of below players
-- Viraj
-- Stark
-- Devid

-- Generally we will do like below

SELECT
	SUM(score) AS total_score
FROM
	player_match_details
WHERE
--	name="Viraj";	
-- 	name="David";
	name="Stark";	
	
-- To handle this we required a special clause
-- GROUP BY	
-- Which can group the required ROWS
-- perform aggregation each GROUP

SELECT 
	name, SUM(score) AS total_score
FROM
	player_match_details
GROUP BY name;

SELECT 
	name, MIN(score) AS minimum_score
FROM
	player_match_details
GROUP BY name;

SELECT 
	name, MAX(score) AS maximum_score
FROM
	player_match_details
GROUP BY name;

	
SELECT 
	name, AVG(score) AS average_score
FROM
	player_match_details
GROUP BY name;
	
SELECT 
	name, 
	MAX(score) AS maximum_score,
	MIN(score) AS minimum_score,
	AVG(score) AS average_score,
	SUM(score) AS total_score
FROM
	player_match_details
GROUP BY 
	name;


-- Get year wise each player total scores
SELECT
	name, 
	year,
	SUM(score) AS total_score
FROM
	player_match_details
GROUP BY 
	name, 
	year;	
	
	
-- Get number of half centuries of each player scored in each year

SELECT
	name, year, COUNT(*) AS half_centuries_count
FROM 
	player_match_details 
WHERE 
	score >= 50
GROUP BY
	name, year;
	
-- Explaination on ABOVE query execution step wise
-- first it will apply where clause to filter the required ROWS
-- second it will apply the group clause to make all those rows into different gropus
-- then in third it will calculate the aggegration function to get total number of rows had by each GROUP
-- then finally it will show each layer name and g=hence each player half centuries on year wise basis
-- where ------> group --------> aggregation function ------> final result

-- Question:
-- Calculate total number of sixes and fours scored by each player
-- Result should be in desencing order of total number of sixes and fours

SELECT
	name, 
	SUM(sixes) AS total_sixes, 
	SUM(fours) AS total_fours
FROM 
	player_match_details
GROUP BY 
	name
ORDER BY 
	total_sixes DESC, 
	total_fours DESC;
	


-------------------------------------------------------------------------------------------------
-- Question:
-- Retrieve top 10 players who played the most number of matches in a year

	SELECT 
		name, 
		year, 
		COUNT(*) AS total_matches 
	FROM 
		player_match_details
	GROUP BY 
		name, 
		year 
	ORDER BY 
		total_matches DESC ;



-------------------------------------------------------------------------------------------------
-- Question:
-- Calculate the average score of players for all the matches played from the year 2010 till 2014 and bottom 5 players in the average score

SELECT
	name, 
	AVG(score) AS average_score 
FROM 
	player_match_details 
WHERE 
	year BETWEEN 2010 AND 2014
GROUP BY 
	name	 
ORDER BY 
	average_score ASC 
LIMIT 5;

-----------------------------------------------------------------------------------------
-- HAVING Clause
-- QUESTION
-- Get all the players who scored more than 1 half-century

SELECT 
	name, 
	COUNT() AS half_centuries
FROM
	player_match_details
WHERE 
	score >= 50
GROUP BY 
	name
HAVING
	half_centuries > 1;	
	
-------------------------------------------------------------------------------------------
-- QUESTION:
-- 1. Calculate	the average_score and total_score of each player for all matches played from 2010 till 2014
-- 2. Retrieve players whose average score is less than 75 in ascending order of their total score

SELECT 
	name, 
	SUM(score) AS total_score, 
	AVG(score) AS average_score 
FROM 
	player_match_details 
WHERE 
	year BETWEEN 2010 AND 2014 
GROUP BY 
	name 
HAVING 
	average_score < 75 
ORDER BY 
	total_score ASC;













----------------------------------------------------------------------------------------------------------
--	Where vs Having
--	Where is used to filter rows vs Having is used to filter groups
--	Performed before grouping vs Performed after grouping




