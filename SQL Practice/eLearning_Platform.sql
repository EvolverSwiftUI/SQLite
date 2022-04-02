

-- DB Schema

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
		
	CREATE TABLE student_course(
			id INTEGER NOT NULL PRIMARY KEY,
			student_id INTEGER,
			course_id INTEGER,
			score INTEGER,
			enrollment_date TEXT,
			FOREIGN KEY ( student_id) REFERENCES student(id) ON DELETE CASCADE,
			FOREIGN KEY ( course_id) REFERENCES course(id) ON DELETE CASCADE
		);

	DROP TABLE student_course;
	
	
------------------------------------------
-- Data insertion done manually

---------------------------------------------------
-- QUERYING

-- Question
-- get the scores of student enrolled in machine learning (course id = 11)

	SELECT 
		full_name, score
	FROM
		student
		JOIN student_course ON student.id = student_course.student_id
	WHERE student_course.course_id = 11;	


-- What will do JOIN clause?
-- JOIN operation combines existing tables into a single temporary table.


------------------------------
-- Question
-- NATURAL JOIN
	
	SELECT 
		*
	FROM
		course
		NATURAL JOIN instructor;
		
-- Question
-- Fetch the courses that are being taught by "Alex"

	SELECT
		course.name,
		instructor.full_name
	FROM
		course
		NATURAL JOIN instructor
	WHERE
		instructor.full_name = "Alex";
		
-- INNER JOIN
-- Question
-- Get reviews along with Student details

SELECT 
* 
FROM
 student 
 INNER JOIN reviews ON student.id = reviews.student_id;		
		
-- Question
-- Get reviews of course "Cyber Security" (course with id = 15)
SELECT 
	* 
FROM 
	student 
	INNER JOIN reviews ON student.id = reviews.student_id
WHERE reviews.course_id = 15;

		
		
		
