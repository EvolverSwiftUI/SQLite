
	CREATE TABLE student(
		  id INTEGER NOT NULL PRIMARY KEY,
		  full_name TEXT,
		  age INTEGER,
		  gender TEXT
		);		

	CREATE TABLE instructor(
			instructor_id	 INTEGER NOT NULL PRIMARY KEY,
			full_name TEXT,
			gender TEXT
		);
		
		
	CREATE TABLE course(
			id INTEGER NOT NULL PRIMARY KEY,
			name TEXT,
			duration INTEGER,
			instructor_id INTEGER,
			FOREIGN KEY(instructor_id) REFERENCES instructor(instructor_id) ON DELETE CASCADE
		);	
		
	CREATE TABLE reviews(
			id INTEGER NOT NULL PRIMARY KEY,
			course_id INTEGER,
			content	TEXT,
			created_at TEXT,
			student_id INTEGER,
			FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE,
			FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE
		);
		
		






