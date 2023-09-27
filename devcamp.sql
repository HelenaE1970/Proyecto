USE  university_devcamp;

INSERT INTO students(student_first_name, student_last_name, student_email, student_phone_number, student_address, student_birthdate)
VALUES('Paula', 'Untoria', 'paula@text.com', '555555555', 'Pamplona 5', '2001-11-13');

INSERT INTO students(student_first_name, student_last_name, student_email, student_phone_number, student_address, student_birthdate)
VALUES('Josea', 'Palomo', 'josea@text.com', '555656565', 'Valladolid 4', '2000-08-09');

INSERT INTO students(student_first_name, student_last_name, student_email, student_phone_number, student_address, student_birthdate)
VALUES('Enaitz', 'Tejado', 'enaitz@text.com', '555252525', 'Bruselas 14', '2001-06-21');

INSERT INTO students(student_first_name, student_last_name, student_email, student_phone_number, student_address, student_birthdate)
VALUES('Kay', 'Rodriguez', 'kay@text.com', '555858585', 'Palencia 27', '2000-01-15');

INSERT INTO students(student_first_name, student_last_name, student_email, student_phone_number, student_address, student_birthdate)
VALUES('Nora', 'Sanchez', 'nora@text.com', '555353535', 'Gran Via 15', '2000-09-09');

INSERT INTO proffesors(proffesor_first_name, proffesor_last_name, proffesor_email, proffesor_phone_number, proffesor_course_id)
VALUES('Pilar', 'Romero', 'pilar@text.com', '555959595', 1);

INSERT INTO proffesors(proffesor_first_name, proffesor_last_name, proffesor_email, proffesor_phone_number, proffesor_course_id )
VALUES('Itsaso', 'Velasco', 'itsaso@text.com', '555141441', 2);

INSERT INTO proffesors(proffesor_first_name, proffesor_last_name, proffesor_email, proffesor_phone_number, proffesor_course_id)
VALUES('Carmen', 'Perez', 'carmen@text.com', '555636363', 3);

INSERT INTO students(student_first_name, student_last_name, student_email, student_phone_number, student_address, student_birthdate)
VALUES('Markel', 'Esteban', 'markel@text.com', '555252525, ', 'General Alava 15', '11/10/2001');

INSERT INTO courses(course_name, course_student_id)
VALUES('Math', 2);


INSERT INTO courses(course_name, course_student_id )
VALUES('History', 2);

INSERT INTO courses(course_name, course_student_id)
VALUES('Geography', 5);

INSERT INTO courses(course_name, course_student_id)
VALUES('Biology', 5);

INSERT INTO courses(course_name, course_student_id )
VALUES('Art', 3);

INSERT INTO courses(course_name, course_student_id)
VALUES('Phisics', 2);

INSERT INTO courses(course_name)
VALUES('Chemistry', 4);

INSERT INTO grades(grade_note, grade_course_id, grade_student_id)
VALUES('7.3', 2, 1);

INSERT INTO grades(grade_note, grade_course_id, grade_student_id)
VALUES('6.9', 1, 2);

INSERT INTO grades(grade_note, grade_course_id, grade_student_id)
VALUES('7.5', 3, 4);

INSERT INTO grades(grade_note, grade_course_id, grade_student_id)
VALUES('3.9', 4, 2);

INSERT INTO grades(grade_note, grade_course_id, grade_student_id)
VALUES('5.3', 5, 5);

INSERT INTO grades(grade_note, grade_course_id, grade_student_id)
VALUES('5.9', 6, 3);

INSERT INTO grades(grade_note, grade_course_id, grade_student_id)
VALUES('6.2', 3, 5);

-- The average grade that is given by each professor:
SELECT p.proffesor_id AS 'ID', p.proffesor_last_name AS 'LAST NAME', p.proffesor_first_name AS 'FIRST NAME',  AVG(g.grade_note) AS 'AVG/GRADE'
FROM grades g
JOIN courses c
ON c.course_id = g.grade_course_id
JOIN proffesors p
ON p.proffesor_course_id =c.course_id
GROUP BY p.proffesor_id;

-- The top grades for each student: 
SELECT s.student_id AS 'ID', s.student_last_name AS 'LAST NAME', s.student_first_name AS 'FIRST NAME',  MAX(g.grade_note) AS 'TOP/NOTE'
FROM students s
LEFT JOIN grades g
ON g.grade_student_id = s.student_id
GROUP BY student_id;


-- Sort students by the courses that they are enrolled in:
SELECT s.student_id AS 'ID', s.student_last_name AS 'LAST NAME', s.student_first_name AS 'FIRST NAME', c.course_name AS 'COURSE'
FROM students s
JOIN courses c
ON c.course_student_id = s.student_id
ORDER BY c.course_name; 

-- Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course:

SELECT 
	c.course_name AS 'COURSES',
	AVG(g.grade_note) AS 'AVERAGE/GRADE'
FROM courses c
LEFT JOIN grades g
 ON c.course_id = g.grade_course_id
GROUP BY c.course_name
ORDER BY AVG(g.grade_note) ASC;

-- Finding which student and professor have the most courses in common:
SELECT s.student_last_name AS 'Student Name', p.proffesor_last_name AS 'Proffesor Name',
	COUNT(*) AS 'Common Courses'
FROM students s
JOIN courses c
ON c.course_student_id = s.student_id
JOIN proffesors p
ON p.proffesor_course_id = c.course_id
GROUP BY s.student_last_name, p.proffesor_last_name
LIMIT 1


