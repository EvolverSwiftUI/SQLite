
-- DB Schema

	CREATE TABLE user(
		id INTEGER NOT NULL PRIMARY KEY,
		name TEXT,
		age INTEGER,
		gender TEXT,
		phone_no INTEGER,
		address TEXT,
		pincode INTEGER
	);
	
	PRAGMA TABLE_INFO(user);
	
	CREATE TABLE order_details(
		order_id INTEGER NOT NULL PRIMARY KEY,
		customer_id INTEGER,
		order_date TEXT,
		shipped_date TEXT,
		shipped_id INTEGER,
		total_amount INTEGER,
		FOREIGN KEY (customer_id) REFERENCES user(id) ON DELETE CASCADE
	);
	
	CREATE TABLE product(
		product_id INTEGER NOT NULL PRIMARY KEY,
		name TEXT,
		price_per_unit INTEGER,
		rating INTEGER,
		category TEXT,
		brand TEXT
	);	
		
	CREATE TABLE order_product(
		id INTEGER NOT NULL PRIMARY KEY,
		order_id INTEGER,
		product_id INTEGER,
		no_of_units INTEGER,
		FOREIGN KEY (order_id) REFERENCES order_details(order_id) ON DELETE CASCADE,
		FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
	);
		
------------------------------------------------
-- Data insertion done manually		

-----------------------------------------------------
-- VIEW

	CREATE VIEW user_base_details AS
	SELECT 
		id,
		name,
		age,
		gender,
		pincode
	FROM
		user;	
	
	SELECT 
		*
	FROM 
		user_base_details;
		
-- other clauses in view

	SELECT 
		*
	FROM
		user_base_details
	WHERE 
		gender = "Male"
	ORDER BY age ASC;
	
-- Advantages:
-- 1. Provide specific access
-- 2. Writing simple queries

	CREATE VIEW order_with_product AS
	SELECT
		*
	FROM
		order_product 
		JOIN product
		ON order_product.product_id = product.product_id;
		
	SELECT 
		name, no_of_units
	FROM 
		order_with_product
	WHERE
		order_id = 665;
		
-- NOTE:
-- In general, VIEWs are read only
-- We cannot perform write operations like updating, deleting and inserting rows in the base table through VIEWs

-- Get list of all available VIEWs in SQLite

	SELECT
		name
	FROM	
		sqlite_master
	WHERE
		TYPE = "view";
		
-- DELETE VIEW

	DROP VIEW user_base_details;
		
---------------------------------------------------------------------------------------------------------------------------
		
-- Sub Queries
-- QUESTION
-- Get the rating variance of products in the watch category




		
		
			


		
		
		
		
		
		
		
		
		
		
		
		
		
		