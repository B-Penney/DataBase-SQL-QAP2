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
    id SERIAL PRIMARY KEY
    course_name TEXT UNIQUE NOT NULL,
    course_description TEXT,
    professor_id INTEGER NOT NULL
    FOREIGN KEY (professor_id) REFERENCES professors(id)
)

CREATE TABLE enrolments (
    (student_ id, course_id) PRIMARY KEY
    student_id INTEGER NOT NULL,
     FOREIGN KEY (student_id) REFERENCES students(id),
    course_id INTEGER NOT NULL,
     FOREIGN KEY (course_id) REFERENCES courses(id) 
    enrolment_date DATE NOT NULL,
)