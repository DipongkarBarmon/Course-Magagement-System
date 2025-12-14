<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // DB connection
    String url = "jdbc:mysql://localhost:3306/Course_Management_System";
    String user = "root";
    String pass = "dip";
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, pass);
    Statement st = conn.createStatement();

    String query = "SELECT c.CourseName,c.CourseCode, u.Fullname AS Teacher " +
                   "FROM Courses c " +
                   "LEFT JOIN SignupDetails u ON c.TeacherId = u.IdNumber";
    ResultSet rs = st.executeQuery(query);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Course Management</title>
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
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
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
        }
        
        .page-header h1 {
            color: #333;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .page-header p {
            color: #666;
            margin: 0;
        }
        
        /* Stats Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 35px rgba(0,0,0,0.15);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            font-size: 1.8rem;
            color: white;
        }
        
        .stat-card.courses .stat-icon {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        
        .stat-card.teachers .stat-icon {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }
        
        .stat-card.students .stat-icon {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }
        
        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 0.3rem;
        }
        
        .stat-label {
            color: #666;
            font-size: 0.95rem;
        }
        
        /* Action Buttons */
        .action-buttons {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 1.5rem;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }
        
        .btn-custom {
            padding: 0.8rem 1.5rem;
            border-radius: 12px;
            font-weight: 600;
            border: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-add {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }
        
        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
            color: white;
        }
        
        .btn-logout {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
            margin-left: auto;
        }
        
        .btn-logout:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(245, 87, 108, 0.4);
            color: white;
        }
        
        /* Courses Table */
        .table-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            padding: 2rem;
        }
        
        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        .table-header h3 {
            color: #333;
            font-weight: 700;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .table-header h3 i {
            color: #667eea;
        }
        
        .search-box {
            position: relative;
            width: 300px;
        }
        
        .search-box input {
            width: 100%;
            padding: 0.6rem 1rem 0.6rem 2.5rem;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }
        
        .search-box input:focus {
            border-color: #667eea;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
        }
        
        .search-box i {
            position: absolute;
            left: 0.8rem;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }
        
        .table-responsive {
            border-radius: 12px;
            overflow: hidden;
        }
        
        .table-custom {
            width: 100%;
            margin: 0;
        }
        
        .table-custom thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .table-custom thead th {
            padding: 1rem;
            font-weight: 600;
            border: none;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }
        
        .table-custom tbody tr {
            transition: all 0.3s ease;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .table-custom tbody tr:hover {
            background: #f8f9ff;
            transform: scale(1.01);
        }
        
        .table-custom tbody td {
            padding: 1.2rem 1rem;
            color: #333;
            vertical-align: middle;
        }
        
        .course-name {
            font-weight: 600;
            color: #667eea;
        }
        
        .course-code {
            font-family: monospace;
            background: #f0f0f0;
            padding: 0.3rem 0.6rem;
            border-radius: 6px;
            font-size: 0.9rem;
        }
        
        .teacher-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: #e8f0fe;
            color: #1a73e8;
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.9rem;
        }
        
        .teacher-badge.unassigned {
            background: #fef0e8;
            color: #f5576c;
        }
        
        .btn-delete {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-size: 0.85rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(245, 87, 108, 0.3);
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
        
        @media (max-width: 768px) {
            .stats-container {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn-logout {
                margin-left: 0;
            }
            
            .search-box {
                width: 100%;
                margin-top: 1rem;
            }
            
            .table-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
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
                    <i class="fas fa-user-shield"></i>
                </div>
                <span style="color: #333; font-weight: 600;">Admin</span>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content container">
        <!-- Page Header -->
        <div class="page-header">
            <h1><i class="fas fa-tachometer-alt"></i> Admin Dashboard</h1>
            <p>Manage courses, teachers, and track system statistics</p>
        </div>

        <!-- Stats Cards -->
        <div class="stats-container">
            <div class="stat-card courses">
                <div class="stat-icon">
                    <i class="fas fa-book"></i>
                </div>
                <div class="stat-value">
                    <%
                        int courseCount = 0;
                        try (Statement statCourse = conn.createStatement();
                             ResultSet rsCourse = statCourse.executeQuery("SELECT COUNT(*) as count FROM Courses")) {
                            if (rsCourse.next()) courseCount = rsCourse.getInt("count");
                        }
                    %>
                    <%= courseCount %>
                </div>
                <div class="stat-label">Total Courses</div>
            </div>
            
            <div class="stat-card teachers">
                <div class="stat-icon">
                    <i class="fas fa-chalkboard-teacher"></i>
                </div>
                <div class="stat-value">
                    <%
                        int teacherCount = 0;
                        try (Statement statTeacher = conn.createStatement();
                             ResultSet rsTeacher = statTeacher.executeQuery("SELECT COUNT(*) as count FROM SignupDetails WHERE RegisterAs='Teacher'")) {
                            if (rsTeacher.next()) teacherCount = rsTeacher.getInt("count");
                        }
                    %>
                    <%= teacherCount %>
                </div>
                <div class="stat-label">Teachers</div>
            </div>
            
            <div class="stat-card students">
                <div class="stat-icon">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <div class="stat-value">
                    <%
                        int studentCount = 0;
                        try (Statement statStudent = conn.createStatement();
                             ResultSet rsStudent = statStudent.executeQuery("SELECT COUNT(*) as count FROM SignupDetails WHERE RegisterAs='Student'")) {
                            if (rsStudent.next()) studentCount = rsStudent.getInt("count");
                        }
                    %>
                    <%= studentCount %>
                </div>
                <div class="stat-label">Students</div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <a href="addCourse.jsp" class="btn btn-custom btn-add">
                <i class="fas fa-plus-circle"></i>
                Add New Course
            </a>
            <a href="Login.jsp" class="btn btn-custom btn-logout">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </a>
        </div>

        <!-- Courses Table -->
        <div class="table-container">
            <div class="table-header">
                <h3>
                    <i class="fas fa-list"></i>
                    All Courses
                </h3>
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" id="searchInput" placeholder="Search courses...">
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>Course Name</th>
                            <th>Course Code</th>
                            <th>Teacher</th>
                            <th style="text-align: center;">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="courseTableBody">
                    <% 
                    boolean hasCourses = false;
                    while(rs.next()) { 
                        hasCourses = true;
                    %>
                        <tr>
                            <td class="course-name"><%= rs.getString("CourseName") %></td>
                            <td><span class="course-code"><%= rs.getString("CourseCode") %></span></td>
                            <td>
                                <% if(rs.getString("Teacher") != null) { %>
                                    <span class="teacher-badge">
                                        <i class="fas fa-user"></i>
                                        <%= rs.getString("Teacher") %>
                                    </span>
                                <% } else { %>
                                    <span class="teacher-badge unassigned">
                                        <i class="fas fa-exclamation-circle"></i>
                                        Not Assigned
                                    </span>
                                <% } %>
                            </td>
                            <td style="text-align: center;">
                                <form action="DeleteCourse" method="post" style="display:inline;" 
                                      onsubmit="return confirm('Are you sure you want to delete this course?');">
                                    <input type="hidden" name="id" value="<%=rs.getString("CourseCode") %>">
                                    <button type="submit" class="btn-delete">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    <% } 
                    if (!hasCourses) { %>
                        <tr>
                            <td colspan="4">
                                <div class="empty-state">
                                    <i class="fas fa-folder-open"></i>
                                    <p>No courses found. Add your first course to get started!</p>
                                </div>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<%
    rs.close();
    st.close();
    conn.close();
%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            const searchValue = this.value.toLowerCase();
            const tableRows = document.querySelectorAll('#courseTableBody tr');
            
            tableRows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchValue) ? '' : 'none';
            });
        });
    </script>
</body>
</html>
