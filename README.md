# 🎓 Course Management System

A modern, comprehensive web-based course management system built with Java Servlets, JSP, and MySQL. Features a beautiful gradient UI with responsive design and role-based access control for administrators, teachers, and students.

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)

## 📋 Table of Contents

- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Database Setup](#-database-setup)
- [Project Structure](#-project-structure)
- [Usage Guide](#-usage-guide)
- [API Documentation](#-api-documentation)
- [Technologies Used](#-technologies-used)
- [Contributing](#-contributing)
- [License](#-license)

## ✨ Features

### 👨‍💼 Admin Functionality
- ➕ Add new courses to the system
- 👨‍🏫 Assign teachers to courses
- 📊 View all courses with statistics dashboard
- 🔍 Search and filter courses
- 🗑️ Delete courses from the system
- 📈 Real-time statistics (total courses, teachers, students)

### 👨‍🎓 Student Functionality
- 📚 View all enrolled courses with teacher information
- ✅ Register for available courses
- 👀 Browse available courses with course details
- 🎯 Modern card-based course display
- 📧 Email verification during signup

### 👨‍🏫 Teacher Functionality
- 📖 View all assigned courses
- 👥 View list of students enrolled in each course
- 📋 Student information display (ID, name, email)
- 🎨 Clean, modern dashboard interface

### 🔐 Authentication & Security
- 📧 Email-based user registration with OTP verification
- 🔑 Role-based access control (Admin/Teacher/Student)
- 🛡️ Session management for secure access
- ✉️ Email verification using JavaMail API

### 🎨 Modern UI/UX
- 🌈 Beautiful gradient purple/blue theme
- 📱 Fully responsive design (mobile, tablet, desktop)
- 💫 Smooth animations and transitions
- 🎯 Font Awesome icons throughout
- 🎴 Card-based modern layouts

## 🔧 Prerequisites

Before you begin, ensure you have the following installed:

- ☕ **Java Development Kit (JDK)** 8 or higher
- 🐱 **Apache Tomcat** 9.0 or higher
- 🐬 **MySQL Server** 8.0 or higher
- 🌙 **Eclipse IDE** (recommended) or any Java IDE
- 📦 **Maven** (optional, for dependency management)

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/DipongkarBarmon/Course-Magagement-System.git
cd Course-Magagement-System
```

### 2. Import into Eclipse IDE

1. Open Eclipse IDE
2. Go to **File → Import → Existing Projects into Workspace**
3. Select the project folder
4. Click **Finish**

### 3. Add Required Libraries

Ensure the following JAR files are in `src/main/webapp/WEB-INF/lib/`:
- `javax.servlet-api-4.0.1.jar` - Servlet API
- `mysql-connector-j-9.4.0.jar` - MySQL JDBC Driver
- `javax.mail.jar` - Email functionality
- `activation.jar` - Email activation

### 4. Configure Database Connection

Update database credentials in the following files if needed:
- `src/main/java/com/dip/dao/Logindao.java`
- `src/main/java/com/dip/dao/Signupdao.java`
- `src/main/java/com/dip/dao/CourseDAO.java`
- JSP files with embedded database queries

Default credentials:
```java
String url = "jdbc:mysql://localhost:3306/Course_Management_System";
String user = "root";
String pass = "dip";
```

### 5. Deploy to Tomcat

#### Option A: Using Eclipse
1. Right-click on project → **Run As → Run on Server**
2. Select Tomcat server
3. Click **Finish**

#### Option B: Manual WAR Deployment
1. Right-click project → **Export → WAR file**
2. Save to Tomcat's `webapps` folder
3. Start Tomcat server
4. Access at `http://localhost:8080/Course-Management`

#### Option C: Using build.sh Script
```bash
chmod +x build.sh
./build.sh
```

## 🗄️ Database Setup

### 1. Create Database

```sql
CREATE DATABASE Course_Management_System;
USE Course_Management_System;
```

### 2. Run Setup Script

Execute the `database_setup.sql` file:

```bash
mysql -u root -p Course_Management_System < database_setup.sql
```

Or manually in MySQL Workbench/Command Line:
```sql
source /path/to/database_setup.sql;
```

### 3. Verify Tables Created

```sql
SHOW TABLES;
```

Expected tables:
- `SignupDetails` - User information (students, teachers, admins)
- `Courses` - Course information and teacher assignments
- `StudentCourses` - Student course enrollments

## 📁 Project Structure

```
Course-Management/
│
├── src/main/java/com/dip/
│   ├── AddCourse.java              # Add course servlet
│   ├── Admin.java                  # Admin entity
│   ├── AdminServlet.java           # Admin dashboard servlet
│   ├── Course.java                 # Course entity
│   ├── DeleteCourse.java           # Delete course servlet
│   ├── login.java                  # Login servlet
│   ├── RegisterCourseServlet.java  # Student course registration
│   ├── SendEmail.java              # Email utility (OTP)
│   ├── Signup.java                 # Signup servlet
│   ├── Student.java                # Student entity
│   ├── Teacher.java                # Teacher entity
│   ├── TeacherDashboardServlet.java# Teacher dashboard servlet
│   ├── UserVarify.java             # User verification utility
│   ├── Verify.java                 # OTP verification servlet
│   ├── ViewStudentsServlet.java    # View enrolled students
│   └── dao/
│       ├── CourseDAO.java          # Course data access
│       ├── Logindao.java           # Login data access
│       └── Signupdao.java          # Signup data access
│
├── src/main/webapp/
│   ├── index.jsp                   # Landing page with animated particles
│   ├── Login.jsp                   # Login page with modern form
│   ├── Signup.jsp                  # Registration with email verification
│   ├── Verify.jsp                  # OTP verification page
│   ├── VeificationSuccessfull.jsp  # Success confirmation page
│   ├── AdminDashboard.jsp          # Admin dashboard with stats
│   ├── addCourse.jsp               # Add course form
│   ├── StudentDashboard.jsp        # Student dashboard with course cards
│   ├── teacherDashboard.jsp        # Teacher dashboard
│   ├── viewStudents.jsp            # Student list for teachers
│   ├── META-INF/
│   │   └── MANIFEST.MF
│   └── WEB-INF/
│       ├── web.xml                 # Servlet mappings & configuration
│       └── lib/                    # JAR dependencies
│
├── build.sh                        # Build script for WAR packaging
├── database_setup.sql              # Database schema & sample data
└── README.md                       # This file
```

## 📖 Usage Guide

### 🌐 Access the Application

After deployment, open your browser and navigate to:
```
http://localhost:8080/Course-Management
```

### 🔑 Default Login Credentials

### 🔑 Default Login Credentials

#### Admin Account
```
Email: admin@course.com
Password: admin123
Role: Admin
```

#### Teacher Account
```
Email: teacher@course.com
Password: teacher123
Role: Teacher
```

#### Student Account
```
Email: student@course.com
Password: student123
Role: Student
```

### 👨‍💼 Admin Workflow

1. **Login**
   - Navigate to Login page
   - Enter admin credentials
   - Select "Admin" role

2. **View Dashboard**
   - See statistics: Total Courses, Teachers, Students
   - View all courses in a searchable table
   - Search courses by name or code

3. **Add New Course**
   - Click "Add New Course" button
   - Fill in course details:
     - Course Name (e.g., "Data Structures")
     - Course Code (e.g., "CS201")
     - Assign Teacher (select from dropdown)
   - Submit to create course

4. **Manage Courses**
   - View all courses with teacher assignments
   - Delete courses using delete button
   - Confirmation dialog prevents accidental deletion

### 👨‍🎓 Student Workflow

1. **Register New Account**
   - Click "Sign Up" from home page
   - Fill in registration form:
     - Full Name
     - ID Number
     - Email Address
     - Phone Number
     - Password & Confirm Password
     - Gender
     - Select "Student" role
   - Submit → Receive OTP via email
   - Enter 6-digit OTP to verify account
   - Account activated → Redirect to login

2. **Login & View Courses**
   - Login with email and password
   - Select "Student" role
   - View dashboard with two sections:
     - **My Enrolled Courses**: Courses you're registered for
     - **Available Courses**: Courses you can enroll in

3. **Enroll in Course**
   - Browse available courses
   - View course details (name, code, teacher)
   - Click "Enroll Now" button
   - Course moves to "Enrolled" section

### 👨‍🏫 Teacher Workflow

1. **Login**
   - Navigate to Login page
   - Enter teacher credentials
   - Select "Teacher" role

2. **View Assigned Courses**
   - See all courses assigned by admin
   - Each course displays:
     - Course Name
     - Course Code
     - "View Students" button

3. **View Enrolled Students**
   - Click "View Students" for any course
   - See list of all enrolled students:
     - Student ID
     - Full Name
     - Email Address
   - Return to dashboard using "Back" button

## 🔌 API Documentation

### Servlet Endpoints

#### Authentication

| Endpoint | Method | Description | Parameters |
|----------|--------|-------------|------------|
| `/LoginServlet` | POST | User login | `email`, `password`, `userType` |
| `/SignupServlet` | POST | User registration | `name`, `id`, `email`, `phone`, `password`, `gender`, `userType` |
| `/Verify` | POST | OTP verification | `otp` |
| `/Login.jsp` | GET | Logout (clears session) | - |

#### Admin Operations

| Endpoint | Method | Description | Parameters |
|----------|--------|-------------|------------|
| `/AdminServlet` | GET | Load admin dashboard | - |
| `/AddCourse` | POST | Add new course | `course_name`, `course_code`, `teacher_id` |
| `/DeleteCourse` | POST | Delete course | `courseCode` |

#### Student Operations

| Endpoint | Method | Description | Parameters |
|----------|--------|-------------|------------|
| `/StudentDashboard.jsp` | GET | Load student dashboard | - |
| `/RegisterCourse` | POST | Enroll in course | `courseCode`, `studentId` |

#### Teacher Operations

| Endpoint | Method | Description | Parameters |
|----------|--------|-------------|------------|
| `/teacherDashboard` | GET | Load teacher dashboard | - |
| `/ViewStudents` | POST | View course students | `courseId` |

### Database Schema

#### SignupDetails Table
Stores all user information (students, teachers, admins)

| Column | Type | Description |
|--------|------|-------------|
| `IdNumber` | INT | Primary Key, User ID |
| `Fullname` | VARCHAR(100) | User's full name |
| `Mail` | VARCHAR(100) | Email address (unique) |
| `Phone` | VARCHAR(20) | Phone number |
| `Password` | VARCHAR(100) | Password (plain text) |
| `Gender` | VARCHAR(10) | Gender |
| `RegisterAs` | VARCHAR(20) | Role: Student/Teacher/Admin |
| `VerificationCode` | VARCHAR(10) | OTP for email verification |

#### Courses Table
Stores course information and teacher assignments

| Column | Type | Description |
|--------|------|-------------|
| `CourseId` | INT | Auto-increment Primary Key |
| `CourseName` | VARCHAR(100) | Course name |
| `CourseCode` | VARCHAR(20) | Unique course code |
| `TeacherId` | INT | Foreign Key to SignupDetails.IdNumber |

#### StudentCourses Table
Stores student course enrollments (many-to-many relationship)

| Column | Type | Description |
|--------|------|-------------|
| `Id` | INT | Auto-increment Primary Key |
| `StudentId` | INT | Foreign Key to SignupDetails.IdNumber |
| `CourseCode` | VARCHAR(20) | Foreign Key to Courses.CourseCode |

### Sample SQL Queries

**Get all courses with teacher names:**
```sql
SELECT c.CourseName, c.CourseCode, s.Fullname AS TeacherName
FROM Courses c
LEFT JOIN SignupDetails s ON c.TeacherId = s.IdNumber
WHERE s.RegisterAs = 'Teacher';
```

**Get student's enrolled courses:**
```sql
SELECT c.CourseName, c.CourseCode, s.Fullname AS TeacherName
FROM Courses c
JOIN StudentCourses sc ON c.CourseCode = sc.CourseCode
LEFT JOIN SignupDetails s ON c.TeacherId = s.IdNumber
WHERE sc.StudentId = ?;
```

**Get students in a course:**
```sql
SELECT s.IdNumber, s.Fullname, s.Mail
FROM SignupDetails s
JOIN StudentCourses sc ON s.IdNumber = sc.StudentId
WHERE sc.CourseCode = ? AND s.RegisterAs = 'Student';
```

## 🛠️ Technologies Used

### Backend
- **Java 8+** - Core programming language
- **Java Servlets** - Server-side request handling
- **JSP (JavaServer Pages)** - Dynamic web pages with embedded Java
- **JDBC** - Database connectivity
- **JavaMail API** - Email functionality for OTP verification

### Frontend
- **HTML5** - Page structure
- **CSS3** - Modern styling with gradients and animations
- **Bootstrap 5.3.2** - Responsive UI framework
- **Font Awesome 6.4.0** - Icon library

### Database
- **MySQL 8.0** - Relational database management
- **MySQL Connector/J** - JDBC driver

### Server
- **Apache Tomcat 9.0** - Servlet container

### Development Tools
- **Eclipse IDE** - Integrated development environment
- **Git** - Version control

## 🎨 UI/UX Features

- **Gradient Theme**: Beautiful purple/blue gradient backgrounds
- **Responsive Design**: Works on desktop, tablet, and mobile devices
- **Modern Cards**: Card-based layouts for courses and information
- **Smooth Animations**: Hover effects and transitions
- **Icon Integration**: Font Awesome icons throughout
- **User-Friendly Forms**: Clear labels and validation
- **Dashboard Statistics**: Real-time counts and metrics
- **Empty States**: Helpful messages when no data exists

## 🔒 Security Considerations

⚠️ **Note**: This is a demonstration project. For production use, implement these security measures:

1. **Password Hashing**: Currently stores plain text passwords
   - Use BCrypt or Argon2 for password hashing
   
2. **SQL Injection Prevention**: Partially implemented with PreparedStatements
   - Ensure all queries use PreparedStatements
   
3. **Session Security**: Basic session management implemented
   - Add session timeout
   - Implement CSRF tokens
   
4. **Input Validation**: Minimal client-side validation
   - Add comprehensive server-side validation
   
5. **HTTPS**: Currently uses HTTP
   - Deploy with SSL/TLS certificates

## 🐛 Troubleshooting

### Common Issues

**1. Database Connection Error**
```
Solution: Check MySQL is running and credentials in DAO files are correct
```

**2. 404 Error on Servlet**
```
Solution: Verify servlet mappings in web.xml match the form actions
```

**3. Email OTP Not Received**
```
Solution: Check JavaMail configuration in SendEmail.java (SMTP settings)
```

**4. Tomcat Deployment Failed**
```
Solution: Ensure javax.servlet-api JAR is in WEB-INF/lib folder
```

**5. Session Lost After Login**
```
Solution: Check session timeout in web.xml, verify cookies are enabled
```

## 📝 Future Enhancements

- [ ] Password encryption with BCrypt
- [ ] File upload for course materials
- [ ] Student grade management
- [ ] Course attendance tracking
- [ ] Email notifications for enrollments
- [ ] PDF report generation
- [ ] Advanced search and filters
- [ ] User profile management
- [ ] Course ratings and reviews
- [ ] Mobile application

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is created for educational purposes. Feel free to use and modify as needed.

## 👤 Author

**Dipongkar Barmon**
- GitHub: [@DipongkarBarmon](https://github.com/DipongkarBarmon)
- Repository: [Course-Management-System](https://github.com/DipongkarBarmon/Course-Magagement-System)

## 🙏 Acknowledgments

- Bootstrap team for the responsive framework
- Font Awesome for the icon library
- MySQL community for the database system
- Apache Tomcat for the servlet container

---

⭐ **If you found this project helpful, please give it a star!** ⭐
