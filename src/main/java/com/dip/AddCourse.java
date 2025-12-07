package com.dip;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/AddCourse")
public class AddCourse extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String courseName = request.getParameter("course_name");
        String teacherId = request.getParameter("teacher_id");
        String courseCode = request.getParameter("course_code" );

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Course_Management_System", "root", "dip");

            // ✅ Use correct column names (CourseName, TeacherId)
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO Courses(CourseName, CourseCode ,TeacherId) VALUES (?, ?,?)");

            ps.setString(1, courseName);
            ps.setString(2, courseCode);
            

            if (teacherId == null || teacherId.trim().isEmpty()) {
                ps.setNull(3, Types.INTEGER);
            } else {
                ps.setInt(3, Integer.parseInt(teacherId));
            }

            ps.executeUpdate();
            conn.close();

            // ✅ Redirect to dashboard after insertion
            response.sendRedirect("AdminDashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
