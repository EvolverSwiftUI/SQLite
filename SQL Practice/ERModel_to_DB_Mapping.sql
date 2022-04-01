/*
-- ER MODEL
-- Customer
-- Products
-- Cart
-- Address
*/

-- CREATE TABLE

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
	
-- cart and product junction TABLE

		CREATE TABLE 
			cart_product(
				id INTEGER NOT NULL PRIMARY KEY,
				cart_id INTEGER,
				product_id INTEGER,
				quantity INTEGER,
				FOREIGN KEY(cart_id )REFERENCES cart(id) ON DELETE CASCADE,
				FOREIGN KEY(product_id) REFERENCES product(id) ON DELETE CASCADE
			);

			
-------------------------------------------------------------------------------
-- INSERT DATA

	INSERT INTO
		customer(id, name, age)
	VALUES
		(1, "John", 29),
		(2, "Emma", 24);
		
	SELECT *FROM customer;
	
	INSERT INTO
		address(id, pin_code, door_no, city, customer_id)
	VALUES
		(1001, 517130, "6-1", "Hyderabad", 1),
		(1002, 615670, "6-13", "Bengaluru", 1);
		
	SELECT *FROM address;
	
	INSERT INTO
		cart(id, total_price, customer_id)
	VALUES
		(1, 12000, 1),
		(2, 500, 2);
		
	UPDATE  cart SET total_price = 1500 WHERE id = 2;	
		
	SELECT *FROM cart;
	
	
	INSERT INTO 
		product(id, name, price, brand, category)
	VALUES
		(1, "Jeans", 1500, "Pepe", "Clothing"),
		(2, "T-shirt", 500, "Puma", "Clothing"),
		(3, "Mobile", 10000, "Redmi", "Gadgets"),
		(4, "Watch", 2000, "Titan", "Gadgets");
			
	SELECT *FROM product;
	
	INSERT INTO
		cart_product(id, cart_id, product_id, quantity)
	VALUES
		(1, 1, 1, 1),
		(2, 1, 2, 1),
		(3, 1, 3, 1),
		(4, 2, 1, 1);
		
	SELECT *FROM cart_product;

		


