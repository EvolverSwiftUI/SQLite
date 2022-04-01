/*
-- ER MODEL
-- Customer
-- Products
-- Cart
-- Address
*/


	CREATE TABLE 
		customer(
		  id INTEGER NOT NULL PRIMARY KEY,
		  name TEXT,
		  age INTEGER
		);

	PRAGMA TABLE_INFO(customer);

	CREATE TABLE
		product(
			id INTEGER NOT NULL PRIMARY KEY,
			name TEXT,
			price INTEGER,
			brand TEXT,
			category TEXT
		);

	PRAGMA TABLE_INFO(product);
	
-- In the address table, we need to create a foreign key to customer TABLE
-- Creating a foreign key in table is similar to creating a COLUMN in the TABLE
-- We also define a foreign key CONSTRAINT while creating a foreign KEY

	PRAGMA FOREIGN_KEYS = ON;

	CREATE TABLE IF NOT  EXISTS
		address(
			id INTEGER NOT NULL PRIMARY KEY,
			pin_code INTEGER,
			door_no TEXT,
			city TEXT,
			customer_id INTEGER,
			FOREIGN KEY(customer_id) REFERENCES customer(id) ON DELETE CASCADE
		);
			

		PRAGMA TABLE_INFO(address);
		
-- in cart table, we need to make customer_id COLUMN accept only unique VALUES
-- we use UNIQUE CONSTRAINT in such scenario

	CREATE TABLE
		cart(
			id INTEGER NOT NULL PRIMARY KEY,
			total_price INTEGER,
			customer_id INTEGER NOT NULL UNIQUE,
			FOREIGN KEY(customer_id) REFERENCES customer(id) ON DELETE CASCADE
		);

	PRAGMA TABLE_INFO(cart);

		
	


