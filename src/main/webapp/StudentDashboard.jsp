<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, javax.servlet.http.*" %>   <!-- Added java.util for Set/HashSet -->
<%@ page session="True" %>

<%
    // Session check
    if(session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    int studentId = (int) session.getAttribute("userId");
    String studentRole = (String) session.getAttribute("userRole");

    if(!"Student".equals(studentRole)) {
        response.getWriter().println("Access denied!");
        return;
    }

    // DB connection
    String url = "jdbc:mysql://localhost:3306/Course_Management_System";
    String user = "root";
    String pass = "dip";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, pass);

    // Get all courses (scrollable so we can reset cursor)
    Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    ResultSet coursesRs = st.executeQuery("SELECT CourseName, CourseCode, TeacherId FROM Courses");

    // Get student's registered courses (scrollable too)
    PreparedStatement ps = conn.prepareStatement(
        "SELECT c.CourseName, c.CourseCode, c.TeacherId " +
        "FROM Courses c " +
        "JOIN StudentCourses sc ON c.CourseCode = sc.CourseCode " +
        "WHERE sc.StudentId = ?",
        ResultSet.TYPE_SCROLL_INSENSITIVE,
        ResultSet.CONCUR_READ_ONLY
    );
    ps.setInt(1, studentId);
    ResultSet myCoursesRs = ps.executeQuery();

    // Collect enrolled course codes
    Set<String> enrolledCourseCodes = new HashSet<>();
    while(myCoursesRs.next()) {
        enrolledCourseCodes.add(myCoursesRs.getString("CourseCode"));
    }
    myCoursesRs.beforeFirst(); // reset cursor for display
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - Course Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        /* Navbar */
        .navbar-custom {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 1rem 0;
        }
        
        .navbar-brand {
            font-weight: 700;
            color: #667eea !important;
            font-size: 1.4rem;
        }
        
        .navbar-brand i {
            margin-right: 0.5rem;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .user-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1.2rem;
        }
        
        .user-name {
            color: #333;
            font-weight: 600;
        }
        
        /* Main Content */
        .main-content {
            padding: 2rem 0;
        }
        
        .page-header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .page-header h1 {
            color: #333;
            font-weight: 700;
            margin: 0;
        }
        
        .btn-logout {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 12px;
            border: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
        }
        
        .btn-logout:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(245, 87, 108, 0.4);
            color: white;
        }
        
        /* Section Headers */
        .section-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }
        
        .section-header {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            margin-bottom: 1.5rem;
            color: #333;
        }
        
        .section-header i {
            font-size: 1.5rem;
            color: #667eea;
        }
        
        .section-header h3 {
            margin: 0;
            font-weight: 700;
        }
        
        /* Course Cards */
        .courses-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
        }
        
        .course-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        
        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
            border-color: #667eea;
        }
        
        .course-header {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            margin-bottom: 1rem;
        }
        
        .course-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
        }
        
        .course-code-badge {
            background: #f0f0f0;
            color: #333;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            font-family: monospace;
        }
        
        .course-name {
            font-size: 1.1rem;
            font-weight: 700;
            color: #333;
            margin: 0.8rem 0;
        }
        
        .course-teacher {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }
        
        .course-teacher i {
            color: #667eea;
        }
        
        .btn-enroll {
            width: 100%;
            padding: 0.7rem;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(79, 172, 254, 0.3);
        }
        
        .btn-enroll:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(79, 172, 254, 0.4);
        }
        
        .empty-state {
            text-align: center;
            padding: 3rem 1rem;
            color: #999;
        }
        
        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1rem;
            opacity: 0.3;
        }
        
        .empty-state p {
            margin: 0;
            font-size: 1.1rem;
        }
        
        .enrolled-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: #e8f5e9;
            color: #2e7d32;
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
        }
        
        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
            
            .courses-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-graduation-cap"></i>
                Course Management
            </a>
            <div class="user-info">
                <div class="user-avatar">
                    ${sessionScope.userName.substring(0, 1).toUpperCase()}
                </div>
                <span class="user-name">${sessionScope.userName}</span>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content container">
        <!-- Page Header -->
        <div class="page-header">
            <div>
                <h1><i class="fas fa-user-graduate"></i> Student Dashboard</h1>
            </div>
            <a href="Login.jsp" class="btn-logout">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </a>
        </div>

        <!-- My Registered Courses -->
        <div class="section-container">
            <div class="section-header">
                <i class="fas fa-check-circle"></i>
                <h3>My Enrolled Courses</h3>
            </div>
            
            <div class="courses-grid">
                <% 
                boolean hasEnrolled = false;
                while(myCoursesRs.next()) { 
                    hasEnrolled = true;
                    int teacherId = myCoursesRs.getInt("TeacherId");
                    String teacherName = "Not Assigned";
                    if(teacherId != 0) {
                        PreparedStatement tPs = conn.prepareStatement("SELECT Fullname FROM SignupDetails WHERE IdNumber = ?");
                        tPs.setInt(1, teacherId);
                        ResultSet tRs = tPs.executeQuery();
                        if(tRs.next()) teacherName = tRs.getString("Fullname");
                        tRs.close();
                        tPs.close();
                    }
                %>
                <div class="course-card">
                    <div class="course-header">
                        <div class="course-icon">
                            <i class="fas fa-book-open"></i>
                        </div>
                        <span class="course-code-badge"><%= myCoursesRs.getString("CourseCode") %></span>
                    </div>
                    <h4 class="course-name"><%= myCoursesRs.getString("CourseName") %></h4>
                    <div class="course-teacher">
                        <i class="fas fa-user"></i>
                        <span><%= teacherName %></span>
                    </div>
                    <span class="enrolled-badge">
                        <i class="fas fa-check"></i>
                        Enrolled
                    </span>
                </div>
                <% } 
                if (!hasEnrolled) { %>
                <div class="empty-state">
                    <i class="fas fa-book"></i>
                    <p>You haven't enrolled in any courses yet.</p>
                </div>
                <% } %>
            </div>
        </div>

        <!-- Register for New Courses -->
        <div class="section-container">
            <div class="section-header">
                <i class="fas fa-plus-circle"></i>
                <h3>Available Courses</h3>
            </div>
            
            <div class="courses-grid">
                <%
                coursesRs.beforeFirst();
                boolean hasAvailable = false;
                while(coursesRs.next()) { 
                    String courseCode = coursesRs.getString("CourseCode");
                    if(enrolledCourseCodes.contains(courseCode)) continue;
                    hasAvailable = true;

                    int teacherId = coursesRs.getInt("TeacherId");
                    String teacherName = "Not Assigned";
                    if(teacherId != 0) {
                        PreparedStatement tPs = conn.prepareStatement("SELECT Fullname FROM SignupDetails WHERE IdNumber = ?");
                        tPs.setInt(1, teacherId);
                        ResultSet tRs = tPs.executeQuery();
                        if(tRs.next()) {
                            teacherName = tRs.getString("Fullname");
                        }
                        tRs.close();
                        tPs.close();
                    }
                %>
                <div class="course-card">
                    <div class="course-header">
                        <div class="course-icon">
                            <i class="fas fa-book"></i>
                        </div>
                        <span class="course-code-badge"><%= courseCode %></span>
                    </div>
                    <h4 class="course-name"><%= coursesRs.getString("CourseName") %></h4>
                    <div class="course-teacher">
                        <i class="fas fa-user"></i>
                        <span><%= teacherName %></span>
                    </div>
                    <form action="RegisterCourse" method="post">
                        <input type="hidden" name="courseCode" value="<%= courseCode %>">
                        <input type="hidden" name="studentId" value="<%= studentId %>">
                        <button type="submit" class="btn-enroll">
                            <i class="fas fa-plus"></i> Enroll Now
                        </button>
                    </form>
                </div>
                <% } 
                if (!hasAvailable) { %>
                <div class="empty-state">
                    <i class="fas fa-check-double"></i>
                    <p>You're enrolled in all available courses!</p>
                </div>
                <% } %>
            </div>
        </div>
    </div>

<%
    // close DB resources
    coursesRs.close();
    myCoursesRs.close();
    ps.close();
    st.close();
    conn.close();
%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
