-- Creating tables for University course enrolment
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT UNIQUE NOT NULL,
    enrolment_date DATE
)

CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    department TEXT,
)

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name TEXT UNIQUE NOT NULL,
    course_description TEXT,
    professor_id INTEGER NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
)

CREATE TABLE enrolments (
    (student_ id, course_id) PRIMARY KEY,
    student_id INTEGER NOT NULL,
     FOREIGN KEY (student_id) REFERENCES students(id),
    course_id INTEGER NOT NULL,
     FOREIGN KEY (course_id) REFERENCES courses(id),
    enrolment_date DATE NOT NULL,
)



-- Inserting data into tables
INSERT INTO students (first_name, last_name, email, enrolment_date)
('Mister', 'Pickles', 'mister.pickles@satan.com', '2013-08-25'),
('Marilyn', 'Monroe', 'm.monroe@normajeane.com', '1962-08-04'),
('Robot', 'Chicken', 'robot.chicken@itsalive.com', '2005-02-20'),
('Hannibal', 'Lector', 'h.lector@cannibalism.com', '1991-02-14'),
('Ed', 'Gein', 'ed_gein@humanskinlamps.com', '1984-07-26');

-- This will show you whats in the table for students
SELECT * FROM students;


INSERT INTO professors (first_name, last_name, department)
('Jack', 'Skellington', 'Chemistry'),
('Doctor', 'Finkelstein', 'Biology'),
('Oogie', 'Boogie', 'Entomology'),
('Mister', 'Hyde', 'Making Christmas');

-- Showing professors table
SELECT * FROM professors;


INSERT INTO courses (course_name, course_description, professor_id)
('Biology', 'Creating Sally', 2),
('Entomology', 'The Study of Insects', 3),
('Chemistry', 'Becoming Santa Clause', 1),
('Entomology', 'The Study of Insects', 2),
('Making Christmas', 'Creating Creepy Toys', 4);

-- Showing data in courses table
SELECT * FROM courses



-- Inserting 5 students into the enrolments table
INSERT INTO enrolments (student_id, course_id, enrolment_date)
VALUES
(4, 1, '2024-09-03'),
(4, 3, '2024-09-03'),
(3, 1, '2024-09-03'),
(2, 4, '2021-09-03'),
(3, 4, '2018-09-03');

-- SQL Query for First and Last name
SELECT first_name || '' || last_name AS full_name 
JOIN enrolments ON students.id = enrolments.student_id
JOIN courses ON enrolments.course_id = courses.course_id
WHERE courses.course_name = 'Making Christmas';

-- SQL Query for Full name of professor and courses they teach
SELECT courses.course_name, professors.first_name || ' ' || professors.last_name AS prof_full_name
FROM courses
JOIN professors ON courses.professor_id = professors.professor_id;

-- SQL Query for all courses with students enroled in them
SELECT DISTINCT courses.course_name
FROM courses
JOIN enrolments ON courses.id = enrolments.course_id;

-- Update email of student
UPDATE students 
SET email = 'thecoolemailstays@forever.com'
WHERE student_id = 3 

-- Delete student from course
DELETE FROM enrollments 
WHERE student_id = 5 AND course_id = 2 