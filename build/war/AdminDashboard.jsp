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
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-3">Welcome to Admin Dashboard</h2>

        <!-- Buttons Row -->
        <div class="d-flex justify-content-between mb-3">
            <a href="addCourse.jsp" class="btn btn-primary">Add New Course</a>
            <a href="Login.jsp" class="btn btn-warning">Logout</a>
        </div>

        <!-- Courses Table -->
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                   
                    <th>Course Name</th>
                     <th>Course code</th>
                    <th>Teacher</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% while(rs.next()) { %>
                <tr>
                    <td><%= rs.getString("CourseName") %></td>
       
                     <td><%= rs.getString("CourseCode") %></td>
                     
                    <td><%= rs.getString("Teacher") != null ? rs.getString("Teacher") : "Not Assigned" %></td>
                    <td>
                       <!-- <a href="updateCourse.jsp?id=<%= rs.getString("CourseCode") %>" class="btn btn-success btn-sm">Update</a>-->
                        <form action="DeleteCourse" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%=rs.getString("CourseCode") %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>

<%
    rs.close();
    st.close();
    conn.close();
%>
</body>
</html>
