# Course Management System

A comprehensive web-based course management system built with Java Servlets, JSP, and MySQL.

## Features

### R-3: Admin Functionality
- Add new courses to the system
- Assign teachers to courses
- View all courses and their assignments

### R-4: Student Functionality
- Register for new courses
- View all registered courses with course details and teacher information

### R-5: Teacher Functionality
- View assigned courses
- View list of students registered for each course

## Prerequisites

- Java 8 or higher
- Apache Tomcat 9.0 or higher
- MySQL 8.0 or higher
- Eclipse IDE (or any Java IDE)

## Database Setup

1. Create a MySQL database named `Course_Management_System`
2. Run the `database_setup.sql` script to create tables and insert sample data
3. Update database connection details in the servlets if needed (currently set to localhost:3306)

## Project Structure

```
src/main/java/com/dip/
├── Course.java              # Course entity
├── Student.java             # Student entity
├── Teacher.java             # Teacher entity
├── Admin.java               # Admin entity
├── StudentServlet.java      # Student functionality
├── AdminServlet.java        # Admin functionality
├── TeacherServlet.java      # Teacher functionality
├── login.java               # Login servlet
├── StudentDAO.java          # Student data access
└── dao/
    ├── CourseDAO.java       # Course data access
    ├── Logindao.java        # Login data access
    └── Signupdao.java       # Signup data access

src/main/webapp/
├── index.jsp                # Home page
├── Login.jsp                # Login page
├── Signup.jsp               # Registration page
├── studentDashboard.jsp     # Student dashboard
├── adminDashboard.jsp       # Admin dashboard
├── teacherDashboard.jsp     # Teacher dashboard
├── teacherStudents.jsp      # Teacher's course students view
└── WEB-INF/
    ├── web.xml              # Servlet configuration
    └── lib/                 # JAR dependencies
```

## Installation & Setup

1. **Clone/Download the project**
2. **Import into Eclipse:**
   - File → Import → Existing Projects into Workspace
   - Select the project folder

3. **Database Configuration:**
   - Run `database_setup.sql` in MySQL
   - Update connection details in servlets if needed

4. **Deploy to Tomcat:**
   - Right-click project → Export → WAR file
   - Deploy WAR file to Tomcat webapps folder
   - Start Tomcat server

5. **Access the application:**
   - Open browser and go to `http://localhost:8080/Course-Management`

## Default Login Credentials

### Admin
- Email: admin@course.com
- Password: admin123

### Teacher
- Email: john.smith@course.com
- Password: teacher123

### Student
- Email: alice.johnson@course.com
- Password: student123

## Usage

### Admin
1. Login as admin
2. Add new courses with descriptions
3. Assign teachers to courses
4. View all courses and their assignments

### Teacher
1. Login as teacher
2. View assigned courses
3. Click "View Students" to see registered students for each course

### Student
1. Login as student
2. View registered courses
3. Register for new courses from available list

## Database Schema

### Users Table
- `user_id` (Primary Key)
- `username` (Unique)
- `full_name`
- `email` (Unique)
- `password`
- `role` (student/teacher/admin)

### Courses Table
- `course_id` (Primary Key)
- `course_name`
- `course_description`
- `teacher_id` (Foreign Key to users)

### Student_Courses Table
- `id` (Primary Key)
- `student_id` (Foreign Key to users)
- `course_id` (Foreign Key to courses)
- `registered_at`

## Dependencies

- `mysql-connector-j-9.4.0.jar` - MySQL JDBC driver
- `javax.mail.jar` - Email functionality
- `javax.activation.jar` - Email activation

## Notes

- The system uses session management for user authentication
- All database operations are handled through DAO classes
- The UI is built with Bootstrap for responsive design
- Password storage is not encrypted (for demo purposes)
