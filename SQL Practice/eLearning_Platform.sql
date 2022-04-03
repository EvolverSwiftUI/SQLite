

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
	student.full_name,
	reviews.content,
	reviews.created_at
FROM 
	student 
	INNER JOIN reviews ON student.id = reviews.student_id
WHERE reviews.course_id = 15;

-- LEFT JOIN

SELECT * FROM student LEFT JOIN student_course ON student.id = student_course.student_id;

SELECT 	
	student.full_name 
 FROM 
	student 
	LEFT JOIN student_course ON student.id = student_course.student_id
WHERE student_course.id IS NULL;

--QUESTION
-- Get the scores of student who enrolled in the course of machine learning (course id = 11)

SELECT 
	student.full_name,
	student_course.score
FROM
	student
	INNER JOIN student_course ON student.id = student_course.student_id
WHERE student_course.course_id = 11;	

--QUESTION
-- JOINS on multiple tables
-- Fetch all the students who enrolled for the courses taught by the instructor Arun (id = 102)

	SELECT
		T.name AS course_name,
		student.full_name
	FROM
		(course INNER JOIN student_course ON course.id = student_course.course_id) AS T
		INNER JOIN student ON T.student_id = student.id
	WHERE
		course.instructor_id = 102;

--QUESTION
-- JOINS with other clauses
-- Get the name of student who scored highest in "Machine Learning" course

SELECT 
	student.full_name
FROM
	(student INNER JOIN student_course ON student.id = student_course.student_id) AS T 
	INNER JOIN course ON T.course_id = course.id 
WHERE 
	course.name = "Machine Learning" 
ORDER BY 
	student_course.score DESC
LIMIT 
	1;
	
	
-- Query Walkthrough
-- Question 01
-- Get all courses that the student with id 1 has enrolled and the respective scores in each course


	SELECT 
		course.name,
		student_course.score
	FROM
		(student INNER JOIN student_course ON student.id = student_course.id)  AS T
		INNER JOIN course ON course.id = T.course_id 
	WHERE student.id = 1;	
	
	-- or
	
	SELECT
		course.name,
		student_course.score
	FROM
		course INNER JOIN student_course ON course.id = student_course.course_id
	WHERE 	student_course.student_id = 1;
	
	
-- QUESTION 02
-- 



	

	

		
		
		
