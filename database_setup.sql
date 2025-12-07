-- Course Management System Database Setup
-- Run this script to create the necessary tables

CREATE DATABASE IF NOT EXISTS Course_Management_System;
USE Course_Management_System;

-- Users table (replaces SignupDetails)
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'teacher', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Courses table
CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT,
    teacher_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- Student-Course registration table
CREATE TABLE IF NOT EXISTS student_courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    UNIQUE KEY unique_student_course (student_id, course_id)
);

-- Insert sample data
INSERT INTO users (username, full_name, email, password, role) VALUES
('admin', 'System Administrator', 'admin@course.com', 'admin123', 'admin'),
('teacher1', 'John Smith', 'john.smith@course.com', 'teacher123', 'teacher'),
('teacher2', 'Jane Doe', 'jane.doe@course.com', 'teacher123', 'teacher'),
('student1', 'Alice Johnson', 'alice.johnson@course.com', 'student123', 'student'),
('student2', 'Bob Wilson', 'bob.wilson@course.com', 'student123', 'student'),
('student3', 'Carol Brown', 'carol.brown@course.com', 'student123', 'student');

-- Insert sample courses
INSERT INTO courses (course_name, course_description, teacher_id) VALUES
('Java Programming', 'Learn Java programming fundamentals and object-oriented concepts', 2),
('Web Development', 'Introduction to HTML, CSS, JavaScript, and web frameworks', 2),
('Database Management', 'SQL, database design, and data management principles', 3),
('Data Structures', 'Algorithms and data structures for efficient programming', 3);

-- Insert sample student course registrations
INSERT INTO student_courses (student_id, course_id) VALUES
(4, 1), -- Alice registered for Java Programming
(4, 2), -- Alice registered for Web Development
(5, 1), -- Bob registered for Java Programming
(5, 3), -- Bob registered for Database Management
(6, 2), -- Carol registered for Web Development
(6, 4); -- Carol registered for Data Structures
