<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*" %>
<%@ page session="True" %>


<%

    // Session check
    //HttpSession session = request.getSession();
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

    // Get all courses
    Statement st = conn.createStatement();
    ResultSet coursesRs = st.executeQuery("SELECT CourseName, CourseCode, TeacherId FROM Courses");

    // Get student's registered courses
    PreparedStatement ps = conn.prepareStatement(
        "SELECT c.CourseName, c.CourseCode, c.TeacherId " +
        "FROM Courses c " +
        "JOIN StudentCourses sc ON c.CourseCode = sc.CourseCode " +
        "WHERE sc.StudentId = ?");
    ps.setInt(1, studentId);
    ResultSet myCoursesRs = ps.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Welcome ${sessionScope.userName}</h2>
        <a href="Login.jsp" class="btn btn-danger">Logout</a>
    </div>

    <h4>My Registered Courses</h4>
    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Course Name</th>
                <th>Course Code</th>
                <th>Course Teacher</th>
            </tr>
        </thead>
        <tbody>
        <% while(myCoursesRs.next()) { 
                int teacherId = myCoursesRs.getInt("TeacherId");
                String teacherName = "";
                if(teacherId != 0) {
                    PreparedStatement tPs = conn.prepareStatement("SELECT Fullname FROM SignupDetails WHERE IdNumber = ?");
                    tPs.setInt(1, teacherId);
                    ResultSet tRs = tPs.executeQuery();
                    if(tRs.next()) teacherName = tRs.getString("Fullname");
                    tRs.close();
                    tPs.close();
                }
        %>
            <tr>
                <td><%= myCoursesRs.getString("CourseName") %></td>
                <td><%= myCoursesRs.getString("CourseCode") %></td>
                <td><%= teacherName %></td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <h4>Register for a New Course</h4>
    <form action="RegisterCourse" method="post">
        <div class="mb-3">
            <label class="form-label">Select Course</label>
            <select class="form-select" name="courseCode" required>
                <option value="">-- Select --</option>
                <% while(coursesRs.next()) { %>
                    <option value="<%= coursesRs.getString("CourseCode") %>">
                        <%= coursesRs.getString("CourseName") %> (<%= coursesRs.getString("CourseCode") %>)
                    </option>
                <% } %>
            </select>
        </div>
        <input type="hidden" name="studentId" value="<%= studentId %>">
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
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
